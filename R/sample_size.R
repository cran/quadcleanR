#' @title Calculate sample sizes
#' @description Specify which columns to use to produce a table with sample sizes.
#'     Helpful to visualize number of samples in your data.
#'
#' @param data The data frame you want to calculate sample sizes for.
#' @param dim_1 The first dimension to calculate sample sizes for. This will be the
#'     resulting row names. This must be the column name within `data`.
#' @param dim_2 The second dimension to calculate sample sizes for. This will be the
#'     resulting column names. This must be the column name within `data`.
#' @param count The column name within `data` that you wish to count the length of
#'     in order to calculate the sample sizes.
#'
#' @return A data frame of sample sizes.
#' @export
#'
#' @examples
#' Year <- c("2000", "2000", "2000", "2000", "2000", "2001", "2001", "2001", "2001",
#' "2002", "2002", "2002", "2002", "2003", "2003", "2003", "2003", "2003", "2003")
#' Site <- c("site1", "site1", "site2", "site2", "site2","site1", "site1", "site2",
#'           "site2", "site1", "site1", "site2", "site2","site1", "site1", "site2",
#'           "site2", "site2", "site2")
#' Quadrat <- c("Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9", "Q10", "Q11",
#'              "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", "Q18", "Q19")
#' Cover <- sample(x = seq(from = 0, to = 1, by = 0.01), 19, replace = TRUE)
#' coral_cover <- data.frame(Year, Site, Quadrat, Cover)
#'
#' sample_size(coral_cover, dim_1 = "Site", dim_2 = "Year", count = "Quadrat")

sample_size <- function(data, dim_1, dim_2, count){

  count_vec <- count

  dim_1_unique <- unique(data[[dim_1]])
  dim_2_unique <- unique(data[[dim_2]])

  new_data <- as.data.frame(matrix(data = NA, ncol = length(dim_2_unique),
                                   nrow = length(dim_1_unique)))
  colnames(new_data) <- dim_2_unique
  rownames(new_data) <- dim_1_unique

  for(i in 1:length(dim_1_unique)){

    for (j in 1:length(dim_2_unique)) {

      i_j <- data[(data[[dim_1]] == dim_1_unique[i]) & (data[[dim_2]] == dim_2_unique[j]), ]
      new_data[[i,j]] <- length(unique(i_j[[count_vec]]))

    }

  }

  return(new_data)

}
