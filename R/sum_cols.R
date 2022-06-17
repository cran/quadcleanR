#' @title Sum columns based on matching names
#' @description Select columns and attach a vector of their new names, then columns
#'     with matching names will have each row summed. This is helpful to simplify
#'     your data quickly, like simplifying at a higher taxonomic group.
#'
#' @param data A data frame.
#' @param from The column names in `data`.
#' @param to A vector of new names, with matching names being the columns where
#'    each row will be summed.
#'
#' @return A data frame with summed columns.
#' @export
#'
#' @examples
#' Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
#' Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
#' Acropora.tabulate <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0)
#' Acropora.corymbose <- c(0.4, 0, 0.1, 0, 0.3, 0.5)
#' Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, 0.6)
#' Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
#' Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, 0.3)
#' coral_cover <- data.frame(Sites, Transect, Acropora.tabulate, Acropora.corymbose,
#'                           Gardineroseris.sp, Psammocora.sp, Leptastrea.sp)
#'
#' new_names <- c("Acropora.spp", "Acropora.spp", "Gardineroseris.sp",
#'                "Psammocora.sp", "Leptastrea.sp")
#'
#' sum_cols(data = coral_cover, from = colnames(coral_cover[,3:7]),
#'          to = new_names)
#'
sum_cols <- function(data, from, to){

  names <- data.frame(to, from)
  not_changing <- colnames(data)[!colnames(data) %in% from]
  data_new <- data[colnames(data) %in% not_changing]
  data_new[unique(to)] <- "error"

  for(i in 1:length(unique(to))){
    names_i <- names[names$to == unique(to)[i],]$from
    data_new[[unique(to)[i]]] <- rowSums(data[colnames(data) %in% names_i])

  }
  return(data_new)

}
