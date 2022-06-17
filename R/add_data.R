#' @title Add data to existing data frame.
#' @description Using key identifying columns, add additional columns to an
#'     existing data frame. This function allows you to match new columns
#'     based on specified IDs and you can choose what columns to add. Additionally
#'     you can specify the column number at which to add the new columns, so they
#'     are not added to the end of the data frame. Helpful for adding environmental
#'     or taxonomic data to your quadrat data.
#'
#' @param data A data frame you want to add columns to.
#' @param add A data frame with columns you want to add to `data`.
#' @param cols The column names from `add` that you wish to add to `data`.
#' @param data_id The ID column in `data` that will be used to match rows in `add`.
#' @param add_id The ID column in `add` that will be used to match rows in `data`.
#' @param number The column number to start at to add the new columns, so they
#'     are not added to the end of the data frame. If not specified they will
#'     be added to the end of the data frame by default.
#'
#' @return A data frame with added columns.
#' @export
#'
#' @examples
#' Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
#' Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1"))
#' coral_name <- c("Acropora.sp", "Leptastrea.sp", "Sinularia.sp", "Psammocora.sp", "
#'     Psammocora.sp", "Leptastrea.sp")
#' prop_cover <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
#' coral_cover <- data.frame(Sites, Transect, coral_name, prop_cover)
#'
#' corals <- c("Acropora.sp", "Leptastrea.sp", "Psammocora.sp")
#' lifehistory <- c("compeditive", "weedy",  "stresstolerant")
#' functionalgroup <- c("hardcoral", "hardcoral", "hardcoral")
#' coral_info <- data.frame(corals, lifehistory, functionalgroup)
#'
#' add_data(data = coral_cover, add = coral_info, cols = c("lifehistory", "functionalgroup"),
#'          data_id = "coral_name", add_id = "corals", number = 4)
#'
add_data <- function(data, add, cols, data_id, add_id, number = FALSE){

  cols_vector <- cols
  num_column <- ncol(data)

  match_data <- add[match(data[[data_id]], add[[add_id]]),]

  for(i in 1:length(cols_vector)){
    data[[cols_vector[i]]] <- match_data[[cols_vector[i]]]

  }

  if(number != FALSE){
  order_column <- c(1:(number - 1), (num_column+1):((num_column) + length(cols_vector)), (number):num_column)
  data <- data[,order_column]
  }

  return(data)

}
