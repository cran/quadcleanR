
#' @title Extract usable observations
#' @description Sum columns containing unusable observations and remove
#'     rows that contain more than the specified cutoff number of unusable points.
#'     Helpful if there are annotations that were unidentifiable and you want to
#'     remove them from the total usable observations, and you can remove quadrats
#'     with too many unusable observations.
#'
#' @param data A data frame with each row representing a sampling unit (ex. a
#'     quadrat or photo).
#' @param unusable A vector of column names containing unusable observations.
#' @param max If `max = FALSE`, no threshold will be examined. If `max = TRUE`, a
#'     threshold cutoff needs to be provided where rows containing more than the
#'     `cutoff` will be removed from the data frame.
#' @param cutoff The threshold number where rows containing more unusable observations
#'     than the `cutoff` will be removed from the data frame.
#' @param above_cutoff If `above_cutoff = TRUE`, the data frame returned will be the
#'     rows containing more unusable observations than the cutoff. If `above_cutoff = FALSE`
#'     the data frame returned will be the rows containing equal to or less unusable
#'     observations than the cutoff.
#' @param rm_unusable If `rm_unusable = TRUE`, the columns named in the unusable
#'     vector will be removed from the data frame. These columns will not be
#'     removed if `rm_unusable = FALSE`, though duplicate data will remain.
#'
#' @return A data frame containing summed unusable points.
#' @export
#'
#' @examples
#' #create data set for example
#' Sites <- as.factor(c("One", "One", "Two", "Two", "Three", "Three"))
#' Transect <- as.factor(c("1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow",
#'     "1-Shallow", "2-Shallow"))
#' Acropora.sp <- c(1, 2, 3, 4, 5, 6)
#' Gardineroseris.sp <- c(6, 1, 2, 3, 4, 5)
#' Psammocora.sp <- c(5, 6, 1, 2, 3, 4)
#' Leptastrea.sp <- c(4, 5, 6, 1, 2, 3)
#' Blurry <- c(3, 4, 5, 6, 1, 2)
#' Unk <- c(2, 3, 4, 5, 6, 1)
#' coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
#'                           Psammocora.sp, Leptastrea.sp, Blurry, Unk)
#'
#'
#' usable_obs(coral_cover, c("Blurry", "Unk"))
#'
#' usable_obs(coral_cover, c("Blurry", "Unk"), above_cutoff = TRUE)
#'
#' usable_obs(coral_cover, c("Blurry", "Unk"), rm_unusable = FALSE)
#'
#' usable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8)
#'
#' usable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8, above_cutoff = TRUE)


usable_obs <- function(data, unusable, max = FALSE, cutoff, above_cutoff = FALSE, rm_unusable = TRUE){

  unusable_vector <- c(unusable)
  data[["unusable"]] <- "error"

  data$unusable <- rowSums(data[,colnames(data) %in% unusable_vector])

  if(sum(is.na(data$unusable)) > 0){stop("unusable observations contain NA or NaN")}

  if(rm_unusable == TRUE){
    data <- data[!colnames(data) %in% unusable_vector]

  }
  if(rm_unusable == FALSE){warning('duplication exists in the data frame')}
  if(max == TRUE){
    if(above_cutoff == TRUE){
      data_rm <- data[data$unusable > cutoff,]
      rownames(data_rm) <- NULL
      return(data_rm)

    }
    if(above_cutoff == FALSE){
      data <- data[data$unusable <= cutoff,]
      rownames(data) <- NULL
      return(data)

    }
  }
  if(max == FALSE){
    if(above_cutoff == TRUE){warning('no max specified')}
    return(data)

  }
}

