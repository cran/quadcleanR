#' @title Calculate species cover
#' @description Convert the number of observations for each species or non-species
#'     to proportion or percent cover within each row based on the total number
#'     of observations in each row. Useful for quadrats with varying numbers of
#'     observations to calculate each row's percent cover all at once.
#'
#' @param data A data frame with each row representing a sampling unit (ex. a
#'     quadrat or photo).
#' @param spp The column names containing all observations to be used in the
#'     proportion calculation. It is important to note that the proportions
#'     will be scaled to the total observations in these columns for each quadrat.
#' @param prop If `prop = TRUE`, the resulting cover will be proportions. If
#'     `prop = FALSE`, the resulting cover will be in percentages.
#' @param total If `total = TRUE`, a column containing the total number of observations
#'     at each sampling unit will be returned in a new column called `total_pts`. This will
#'     not be returned if `total = FALSE`.
#'
#' @return A data frame containing scaled observation cover.
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
#' coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
#'                           Psammocora.sp, Leptastrea.sp)
#'
#' cover_calc(data = coral_cover, spp = names(coral_cover[3:6]), prop = TRUE, total = TRUE)
#'
#' cover_calc(data = coral_cover, spp = names(coral_cover[3:6]), prop = FALSE, total = FALSE)

cover_calc <- function(data, spp, prop = TRUE, total = FALSE){

 spp_vector <- spp

  if(total == FALSE){
    if(prop == TRUE){

        total_i <- rowSums(data[,colnames(data) %in% spp_vector])

        for(j in 1:length(spp_vector)){
          data[[spp_vector[j]]] <- data[[spp_vector[j]]]/total_i

      }
    }
    if(prop == FALSE){
        total_i <- rowSums(data[,colnames(data) %in% spp_vector])

        for(j in 1:length(spp_vector)){
          data[[spp_vector[j]]] <- (data[[spp_vector[j]]]/total_i) * 100

      }
    }
   return(data)

  }
 if(total == TRUE){

   data[["total_pts"]] <- "error"

   if(prop == TRUE){
     data[["total_pts"]] <- rowSums(data[,colnames(data) %in% spp_vector])

       for(j in 1:length(spp_vector)){
         data[[spp_vector[j]]] <- data[[spp_vector[j]]]/data[["total_pts"]]

     }
   }
   if(prop == FALSE){
     data[["total_pts"]] <- rowSums(data[,colnames(data) %in% spp_vector])

       for(j in 1:length(spp_vector)){
         data[[spp_vector[j]]] <- (data[[spp_vector[j]]]/data[["total_pts"]]) * 100

      }
   }
   return(data)

 }
}
