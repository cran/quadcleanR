#' @title Final cleaned quadrat data
#'
#' @description A \code{data_frame} that was created with the Cleaning Quadrat
#'     Data from CoralNet. This is an example data frame of how the `quadcleanR`
#'     package can be useful in cleaning quadrat data.
#'
#' @format A \code{data_frame} with 14 columns, which are:
#' \describe{
#' \item{Field.Season}{Field season ID.}
#' \item{TimeBlock}{If the sampling season was before, during or after the El Niño event.}
#' \item{Site}{Site number.}
#' \item{Quadrat}{Quadrat ID.}
#' \item{HD_Cat}{Estimate of local human disturbance at each site as a categorical
#'     variable.}
#' \item{HD_Cont}{Estimate of local human disturbance at each site as a continuous
#'     variable.}
#' \item{NPP}{Max net primary productivity at each site (mg C m^-2 day^-1).}
#' \item{WE}{If the sampling site is on the sheltered or windward side of the atoll.}
#' \item{Region}{Region of the atoll.}
#' \item{WaveEnergy}{Wave energy at each site (kW m^-1).}
#' \item{Taxonomic_Name}{Taxonomic name for each substrate.}
#' \item{functional_group}{Functional group for each substrate.}
#' \item{life_history}{Life history classification for each substrate.}
#' \item{prop_cover}{The proportion cover for each substrate.}
#' }
"final_cleaned"
