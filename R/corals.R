#' @title Simple Coral Quadrat Data
#'
#' @description A \code{data_frame} that can be used with the Simple Examples
#'     of Functions vignette to learn how the cleaning functions in quadcleanR work.
#'     Data was collected by the [Baum Lab](https://www.juliakbaum.org/)
#'     and Kiritimati Field Teams. Data is the uncleaned version of data found in
#'     Maucieri and Baum 2021. Biological Conservation. \doi{10.1016/j.biocon.2021.109328}
#'     The data are from photo quadrats (1m by 1m) which were randomly annotated
#'     with 100 random points each. At each of these annotated points, the substrate
#'     was identified. Photo quadrats were collected on Kiritimati Island in the
#'     Republic of Kiribati and document coral cover over time and space. The
#'     annotations and output of the \code{data_frame} were produced using
#'     [CoralNet](https://coralnet.ucsd.edu/) and all annotations were done manually,
#'     by trained researchers.
#'
#' @format A \code{data_frame} with 14 columns, which are:
#' \describe{
#' \item{Field.Season}{Field season ID.}
#' \item{Site}{Site number.}
#' \item{Quadrat}{Quadrat ID.}
#' \item{AcCor}{Percent of total annotated points annotated for Acropora (corymbose morphology).}
#' \item{AcDig}{Percent of total annotated points annotated for Acropora (digitate morphology).}
#' \item{AcroTab}{Percent of total annotated points annotated for Acropora (tabulate morphology).}
#' \item{Monta}{Percent of total annotated points annotated for Montastraea.}
#' \item{Lepta}{Percent of total annotated points annotated for Leptastrea.}
#' \item{Sinu}{Percent of total annotated points annotated for Sinularia.}
#' \item{Clad}{Percent of total annotated points annotated for Cladiella.}
#' \item{Lobph}{Percent of total annotated points annotated for Lobophora.}
#' \item{Sarco}{Percent of total annotated points annotated for Sarcophyton.}
#' \item{Unc}{Percent of total annotated points annotated for unclear.}
#' \item{SHAD}{Percent of total annotated points annotated for shadow.}
#' }
"corals"
