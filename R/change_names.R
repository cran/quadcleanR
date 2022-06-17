
#' @title Change names of columns
#' @description Using a new data frame of labels, change column names in one function.
#'     Helpful if column names are shorthands or contain spaces and characters that
#'     are not supported in column names in R.
#'
#' @param data The data frame that you want to change the column names of.
#' @param labelset The data frame containing column names that you want to change and
#'     what you want them to be changed to.
#' @param from The name of the column in the label set data frame containing the
#'     original column names.
#' @param to The name of the column in the label set data frame containing new
#'     column names that the original column names will be changed to.
#'
#' @return A data frame containing new column names.
#' @export
#'
#' @examples
#'#creating data set
#'Sites <- c("One", "Two", "Three", "Four", "Five")
#'Acrop <- c(0.1, 0.4, 0.9, 0.2, 0.5)
#'Gardin <- c(0.4, 0.9, 0.5, 0.23, 0.8)
#'Psam <- c(0.9, 0.5, 0.8, 0.1, 0.4)
#'Lepta <- c(0.5, 0.7, 0.8, 0.2, 0.9)
#'coral_cover <- data.frame(Sites, Acrop, Gardin, Psam, Lepta)
#'
#'#creating label data frame
#'species_short <- c("Acrop", "Gardin", "Psam", "Lepta")
#'species_long <- c("Acropora", "Gardineroseris", "Psammocora", "Leptastrea")
#'coral_labels <- data.frame(species_short, species_long)
#'
#'change_names(coral_cover, coral_labels, "species_short", "species_long")
#'

change_names <- function(data, labelset, from, to) {
  for (i in 1:nrow(labelset)) {
    colnames(data)[colnames(data) == labelset[[from]][i]] <- labelset[[to]][i]
  }

  return(data)
}
