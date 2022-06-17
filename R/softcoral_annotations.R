#' @title Sample Annotation Data for Cropping Vignette
#'
#' @description A \code{data_frame} that can be used with the Why to Crop Quadrats
#'     by Area vignette to show how quadrat data can be cropped while maintaining spatial
#'     relationships between observations. Data was collected by the
#'     [Baum Lab](https://www.juliakbaum.org/) and Kiritimati Field Teams. Data
#'     is the uncleaned version of data found in
#'     Maucieri and Baum 2021. Biological Conservation. \doi{10.1016/j.biocon.2021.109328}
#'     The data are from photo quadrats (1m by 1m) which were randomly annotated
#'     with 100 random points each. At each of these annotated points, the substrate
#'     was identified. Photo quadrats were collected on Kiritimati Island in the
#'     Republic of Kiribati and document coral cover over time and space. The
#'     annotations and output of the \code{data_frame} were produced using
#'     [CoralNet](https://coralnet.ucsd.edu/) and all annotations were done manually,
#'     by trained researchers.
#'
#' @format A \code{data_frame} with 4 columns, which are:
#' \describe{
#' \item{Name}{Unique identification code for each quadrat.}
#' \item{Row}{The pixel row where the annotation occurred in the photo of the quadrat.}
#' \item{Column}{The pixel column where the annotation occurred in the photo of
#'     the quadrat.}
#' \item{Label}{The identification for the substrate below the annotation location.}
#' }
"softcoral_annotations"
