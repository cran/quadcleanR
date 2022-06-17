#' @title Categorize data based on contents of a column
#' @description Using a column within the data frame, categorize rows in a binary
#'     of yes or no, or customize with a set of category names. Data can be categorized
#'     based on the inclusion or lack of inclusion of parts of characters, or based on
#'     exact characters. Especially useful for turning ID tags into useful categories
#'     for analysis such as morphology, bleaching, taxonomy etc.
#'
#' @param data The data frame.
#' @param column The column name which contains the data on which to categorize
#'     rows.
#' @param values The characters or parts of characters to use to classify rows.
#' @param name The name of the now column of categories.
#' @param binary If `binary = TRUE`, the `name` column will be returned with "Yes"
#'     denoting that characters ,or parts of characters specified by
#'     `values` are present in the row, while "No" denotes that there are no
#'     characters or parts of characters specified in `values` present in the row.
#'     If `binary =  FALSE` there must be `categories` provided which will be used
#'     to classify the presence of characters or parts of characters specified in
#'     `values`.
#' @param exact If `exact = TRUE` only exact matches will be selected. If `exact = FALSE`
#'     matches will be selected if they contain the characters in the
#'    `values` vector and will not be limited by exact matches.
#' @param categories The factor names denoting the presence of the characters or
#'     parts of characters specified by `values`. These must be specified in the
#'     same order as the corresponding element in `values`.
#'
#' @return A data frame with new categorization column.
#' @export
#'
#' @examples
#' Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
#' Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
#' Acropora.sp <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
#' Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, NA)
#' Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
#' Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, NA)
#' Notes <- c(NA, NA, "saw octopus", NA, "white balance corrected", NA)
#' coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
#'                           Psammocora.sp, Leptastrea.sp, Notes)
#'
#' # Classify shallow transects in a binary column
#' categorize(data = coral_cover, column = "Transect", values = "Shallow",
#'     name = "Shallow", binary = TRUE, exact = FALSE)
#'
#' # Classify depth of transect in a new column based on transect name
#' categorize(data = coral_cover, column = "Transect", values = c("Shallow", "Deep"),
#'     name = "Depth", binary = FALSE, categories = c("S", "D"), exact = FALSE)
#'
#'
categorize <- function(data, column, values, name, binary = TRUE, exact = TRUE, categories){

  key_column <- match(as.factor(column), names(data))
  num_column <- ncol(data)
  values_vector <- c(values)


  if(exact == FALSE){

    if(binary == TRUE){
      data[[name]] <- "No"
      data[[name]][grep(paste(values_vector,collapse="|"), data[[column]])] <- "Yes"

    }

    if(binary == FALSE){
      data[[name]] <- NA
      names <- data.frame(values_vector, categories)

      for(i in 1:length(unique(categories))){
        names_i <- names[names$categories == unique(categories)[i],]$values_vector
        data[[name]][grep(paste(names_i,collapse="|"), data[[column]])] <- unique(categories)[i]

      }
    }
  }


  if(exact == TRUE){

    if(binary == TRUE){
      data[[name]] <- "No"
      data[[name]][data[[column]] %in% values_vector] <- "Yes"

    }

    if(binary == FALSE){

      data[[name]] <- NA
      names <- data.frame(values_vector, categories)

      for(i in 1:length(unique(categories))){
        names_i <- names[names$categories == unique(categories)[i],]$values_vector
        data[[name]][data[[column]] %in% names_i] <- unique(categories)[i]

      }
    }
  }

  data[[name]] <- as.factor(data[[name]])
  order_column <- c(1:key_column, num_column + 1, (key_column + 1):num_column)
  data <- data[,order_column]

  return(data)
}
