#' @title Change values within a column
#' @description Using two vectors, change the values in one column to a new
#'     set of values. Helpful if you need to change many values at once, like
#'     updating changes to site names or taxonomy.
#'
#' @param data A data frame.
#' @param column The column in which to change values.
#' @param from A vector containing the values you wish to change.
#' @param to A vector contain the values you which to change to, ensuring these
#'     occur in the same order as the `from` vector.
#'
#' @return A data frame containing new values within the specified column.
#' @export
#'
#' @examples
#' Sites <- c("One.jpg", "Two.jpg", "Three.jpg", "Four.jpg", "Five.jpg")
#' Dominant_Coral <- c("Acropora.sp", "Leptastrea.spp", "Acropora.sp",
#'                     "Acropora.sp", "Acropora.sp")
#' Dominant_Cover <- c(0.1, 0.4, 0.9, 0.2, 0.5)
#' Largest_Coral <- c("Acropora.sp", "Acropora.sp", "Psammocora.sp",
#'                    "Acropora.sp","Gardineroseris.spp")
#'
#' coral_cover <- data.frame(Sites, Dominant_Coral, Dominant_Cover, Largest_Coral)
#'
#' change_values(coral_cover, "Dominant_Coral",
#'     c("Acropora.sp","Leptastrea.spp"), c("Acropora_tabulate", "Leptastrea.purpurea"))
change_values <- function(data, column, from, to) {

    column_vec <- column

    for(i in 1:length(from)){

    data[[column_vec]] <- gsub(from[i], to[i], data[[column_vec]])

    }

  return(data)
}
