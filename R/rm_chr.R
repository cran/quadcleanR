#' @title Remove characters from data frame
#' @description Parts of characters can be removed based on a vector of removal
#'     characters. When these characters are present in the data frame they will
#'     be removed. Selection area can include the full data frame or a subset
#'     of columns. When working with images, this can be helpful to remove extra
#'     characters from image IDs, or anywhere else where you want to remove specific
#'     characters from your data.
#'
#' @param data A data frame.
#' @param rm The parts of characters to be removed from the data frame. Can be a
#'     single element or a vector of elements.
#' @param full_selection If `full_selection = TRUE` parts of characters matching
#'     the `rm` argument will be removed from entire data frame. If
#'     `full_selection = FALSE` only the specified columns will have the parts of
#'     characters matching the `rm` argument removed.
#' @param cols If `full_selection = FALSE` this argument will specify which columns
#'     to have characters matching the `rm` argument removed.
#'
#' @return A data frame containing the selected parts of characters removed.
#' @export
#'
#' @examples
#' # creating data set
#' Sites <- c("One.jpg", "Two.jpg", "Three.jpg", "Four.jpg", "Five.jpg")
#' Dominant_Coral <- c("Acropora.sp", "Leptastrea.spp", "Acropora.sp",
#'     "Acropora.sp", "Acropora.sp")
#' Dominant_Cover <- c(0.1, 0.4, 0.9, 0.2, 0.5)
#' Largest_Coral <- c("Acropora.sp", "Acropora.sp", "Psammocora.sp",
#'     "Acropora.sp","Gardineroseris.spp")
#'
#' coral_cover <- data.frame(Sites, Dominant_Coral, Dominant_Cover, Largest_Coral)
#'
#' # removing a character from select columns
#' coral_cover_nospp <- rm_chr(coral_cover, c(".spp"), full_selection = FALSE,
#'     cols = c("Largest_Coral", "Dominant_Coral"))
#'
#' # removing multiple characters from all columns
#' coral_cover_clean <- rm_chr(coral_cover, c(".jpg", ".spp", ".sp"))


rm_chr <- function(data, rm, full_selection = TRUE, cols) {
  if (full_selection == TRUE) {
    for (i in 1:ncol(data)) {
      for (j in 1:length(rm)) {
        data[, i] <- gsub(rm[j], "", data[, i])
      }
    }
    return(data)
  }

  if (full_selection == FALSE) {
    for (i in 1:length(cols)) {
      col_sel <- cols[i]
      for (j in 1:length(rm)) {
        data[[col_sel]] <- gsub(rm[j], "", data[[col_sel]])
      }
    }
    return(data)
  }
}





