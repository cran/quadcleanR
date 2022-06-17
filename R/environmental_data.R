#' @title Sample Environmental Data for Cleaning Vignettes
#'
#' @description A \code{data_frame} that can be used with the Simple Cleaning Quadrat
#'     Data vignette to show how environmental data can be easily added to quadrat data.
#'     Data was collected and collated by the [Baum Lab](https://www.juliakbaum.org/).
#'     Data was originally published with coral quadrat data in
#'     Maucieri and Baum 2021. Biological Conservation \doi{10.1016/j.biocon.2021.109328}.
#'
#' @format A \code{data_frame} with 7 columns, which are:
#' \describe{
#' \item{Site}{Site number.}
#' \item{HD_Cat}{Estimate of local human disturbance at each site as a categorical variable.}
#' \item{HD_Cont}{Estimate of local human disturbance at each site as a continuous variable.}
#' \item{NPP}{Max net primary productivity at each site (mg C m^-2 day^-1).}
#' \item{WE}{If the sampling site is on the sheltered or windward side of the atoll.}
#' \item{Region}{Region of the atoll.}
#' \item{WaveEnergy}{Wave energy at each site (kW m^-1).}
#' }
"environmental_data"
