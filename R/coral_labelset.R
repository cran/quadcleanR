#' @title Labelset for Corals
#'
#' @description A \code{data_frame} that can be used with the Simple Cleaning Quadrat
#'     Data vignette to rename columns in quadrat data and add functional group data,
#'     to produce easy to analyze data frames. The short names were used to
#'     identify substrate using [CoralNet](https://coralnet.ucsd.edu/) and are
#'     included in the output from CoralNet.
#'
#' @format A \code{data_frame} with 5 columns, which are:
#' \describe{
#' \item{short_name}{The short name ID used to annotate the photo quadrats.}
#' \item{full_name}{The long name and definition for each short name ID.}
#' \item{taxonomic_name}{The taxonomic grouping name for each short name ID.}
#' \item{functional_group}{The functional group for each ID.}
#' \item{life_history}{The life history category for each coral ID.}
#' }
"coral_labelset"
