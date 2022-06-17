#' @title Sample Quadrat Data (0.6m by 0.9m)
#'
#' @description A \code{data_frame} that can be used with the Simple Cleaning
#'     Quadrat Data and the Cleaning and Cropping Quadrat Data vignettes
#'     to show how quadrat data can be cleaned to produce easy to analyze data
#'     frames. Data was collected by the [Baum Lab](https://www.juliakbaum.org/)
#'     and Kiritimati Field Teams. Data is the uncleaned version of data found in
#'     Maucieri and Baum 2021. Biological Conservation. \doi{10.1016/j.biocon.2021.109328}
#'     The data are from photo quadrats (0.9m by 0.6m) which were randomly annotated
#'     with 54 random points each. At each of these annotated points, the substrate
#'     was identified. Photo quadrats were collected on Kiritimati Island in the
#'     Republic of Kiribati and document coral cover over time and space. The
#'     annotations and output of the \code{data_frame} were produced using
#'     [CoralNet](https://coralnet.ucsd.edu/) and all annotations were done manually,
#'     by trained researchers.
#'
#' @format A \code{data_frame} with 135 columns, which are:
#' \describe{
#' \item{Image.ID}{Photo quadrat image ID from [CoralNet](https://coralnet.ucsd.edu/).}
#' \item{Image.name}{The photo quadrat image name.}
#' \item{Annotation.status}{If the quadrat has been completely annotated, or if there
#'     are more annotations to occur.}
#' \item{Points}{The total number of annotation points in the quadrat.}
#' \item{AcCor}{Percent of total annotated points annotated for Acropora (corymbose morphology).}
#' \item{AcDig}{Percent of total annotated points annotated for Acropora (digitate morphology).}
#' \item{Acr_arb}{Percent of total annotated points annotated for Acropora (arborescent morphology).}
#' \item{Acrop}{Percent of total annotated points annotated for Acropora.}
#' \item{AcroTab}{Percent of total annotated points annotated for Acropora (tabulate morphology).}
#' \item{Astreo}{Percent of total annotated points annotated for Astreopora.}
#' \item{B_Acr_arb}{Percent of total annotated points annotated for bleached Acropora (arborescent morphology).}
#' \item{B_Acro}{Percent of total annotated points annotated for bleached Acropora.}
#' \item{B_Astre}{Percent of total annotated points annotated for bleached Astreopora.}
#' \item{BAT}{Percent of total annotated points annotated for bleached Acropora (tabulate morphology).}
#' \item{B_Cosc}{Percent of total annotated points annotated for bleached Coscinarea.}
#' \item{B_Echin}{Percent of total annotated points annotated for bleached Echinophyllia.}
#' \item{B_FavHal}{Percent of total annotated points annotated for bleached Favites halicora.}
#' \item{B_Favia}{Percent of total annotated points annotated for bleached_Favia.}
#' \item{B_FaviaM}{Percent of total annotated points annotated for bleached Favia matthaii.}
#' \item{B_FaviaS}{Percent of total annotated points annotated for bleached Favia speciosa.}
#' \item{B_FaviaSt}{Percent of total annotated points annotated for bleached Goniastrea stelligera.}
#' \item{B_Favites}{Percent of total annotated points annotated for bleached Favites.}
#' \item{B_FavPent}{Percent of total annotated points annotated for bleached Favites pentagona.}
#' \item{B_Fung}{Percent of total annotated points annotated for bleached Fungia.}
#' \item{BGard}{Percent of total annotated points annotated for bleached Gardineroseris.}
#' \item{B_GonEd}{Percent of total annotated points annotated for bleached Goniastrea edwardsi.}
#' \item{B_Herpo}{Percent of total annotated points annotated for bleached Herpolitha.}
#' \item{B_HYDNO}{Percent of total annotated points annotated for bleached Hydnophora.}
#' \item{B_HyExe}{Percent of total annotated points annotated for bleached Hydnophora exesa.}
#' \item{BlAcro-Cor}{Percent of total annotated points annotated for bleached Acropora (corymbose morphology).}
#' \item{B_Lepta}{Percent of total annotated points annotated for bleached Leptastrea.}
#' \item{B_Lepto}{Percent of total annotated points annotated for bleached Leptoseris.}
#' \item{Blisop}{Percent of total annotated points annotated for bleached Isopora.}
#' \item{B_Lobo}{Percent of total annotated points annotated for bleached Lobophyllia.}
#' \item{BlTurbFol}{Percent of total annotated points annotated for bleached Turbinaria (foliose morphology).}
#' \item{B_MOEN}{Percent of total annotated points annotated for bleached Montipora (encrusting morphology).}
#' \item{B_MOFO}{Percent of total annotated points annotated for bleached Montipora (foliose morphology).}
#' \item{B_Monta}{Percent of total annotated points annotated for bleached Montastraea.}
#' \item{B_Monti}{Percent of total annotated points annotated for bleached Montipora.}
#' \item{B_Oxyp}{Percent of total annotated points annotated for bleached Oxypora.}
#' \item{B_Paly}{Percent of total annotated points annotated for bleached Palythoa.}
#' \item{B_PaveDUER}{Percent of total annotated points annotated for bleached Pavona duerdeni.}
#' \item{B_Pavona}{Percent of total annotated points annotated for bleached Pavona.}
#' \item{B_PEYDO}{Percent of total annotated points annotated for bleached Pocillopora eydouxi.}
#' \item{B_Plat}{Percent of total annotated points annotated for bleached Platygyra.}
#' \item{B_PMEAN}{Percent of total annotated points annotated for bleached Pocillopora meandrina.}
#' \item{B_Pocillo}{Percent of total annotated points annotated for bleached Pocillopora.}
#' \item{B_Porit}{Percent of total annotated points annotated for bleached Porites.}
#' \item{B_Psam}{Percent of total annotated points annotated for bleached Psammocora.}
#' \item{B_PVAR}{Percent of total annotated points annotated for bleached Pavona varians.}
#' \item{B_Sando}{Percent of total annotated points annotated for bleached Sandolitha.}
#' \item{B_UnkCoral}{Percent of total annotated points annotated for bleached unknown hard coral.}
#' \item{Cirr}{Percent of total annotated points annotated for Cirrhipathes.}
#' \item{COSC}{Percent of total annotated points annotated for Coscinaraea.}
#' \item{ECHIN}{Percent of total annotated points annotated for Echinophyllia.}
#' \item{Fav}{Percent of total annotated points annotated for Favites.}
#' \item{FavHal}{Percent of total annotated points annotated for Favites halicora.}
#' \item{Favites halicora}{Percent of total annotated points annotated for Favia.}
#' \item{FaviaM}{Percent of total annotated points annotated for Dipsastraea matthaii.}
#' \item{FaviaS}{Percent of total annotated points annotated for Favia speciosa.}
#' \item{FaviaSt}{Percent of total annotated points annotated for Favia stelligera.}
#' \item{FavPent}{Percent of total annotated points annotated for Favites pentagona.}
#' \item{Fung}{Percent of total annotated points annotated for Fungia.}
#' \item{Gardin}{Percent of total annotated points annotated for Gardineroseris.}
#' \item{GonEd}{Percent of total annotated points annotated for Goniastrea edwardsi.}
#' \item{Herpo}{Percent of total annotated points annotated for Herpolitha.}
#' \item{HYDNO}{Percent of total annotated points annotated for Hydnophora.}
#' \item{HyExe}{Percent of total annotated points annotated for Hydnophora exesa.}
#' \item{Isopora}{Percent of total annotated points annotated for Isopora.}
#' \item{Lepta}{Percent of total annotated points annotated for Leptastrea.}
#' \item{Lepto}{Percent of total annotated points annotated for Leptoseris.}
#' \item{Lobo}{Percent of total annotated points annotated for Lobophyllia.}
#' \item{*MOEN}{Percent of total annotated points annotated for Montipora (encrusting morphology).}
#' \item{*MOFO}{Percent of total annotated points annotated for Montipora (foliose morphology).}
#' \item{Monta}{Percent of total annotated points annotated for Montastraea.}
#' \item{Monti}{Percent of total annotated points annotated for Montipora.}
#' \item{Oxyp}{Percent of total annotated points annotated for Oxypora.}
#' \item{Paly}{Percent of total annotated points annotated for Palythoa.}
#' \item{PaveDUER}{Percent of total annotated points annotated for Pavona duerdeni.}
#' \item{Pavon}{Percent of total annotated points annotated for Pavona.}
#' \item{PEYDO}{Percent of total annotated points annotated for Pocillopora eydouxi.}
#' \item{Plat}{Percent of total annotated points annotated for Platygyra.}
#' \item{Plero}{Percent of total annotated points annotated for Plerogyra.}
#' \item{PMEAN}{Percent of total annotated points annotated for Pocillopora meandrina.}
#' \item{Pocill}{Percent of total annotated points annotated for Pocillopora.}
#' \item{Porit}{Percent of total annotated points annotated for Porites.}
#' \item{Psam}{Percent of total annotated points annotated for Psammocora.}
#' \item{PVAR}{Percent of total annotated points annotated for Pavona varians.}
#' \item{Sando}{Percent of total annotated points annotated for Sandolitha.}
#' \item{Tuba}{Percent of total annotated points annotated for Tubastrea.}
#' \item{TURB}{Percent of total annotated points annotated for Turbinaria.}
#' \item{UnkCoral}{Percent of total annotated points annotated for unknown hard coral.}
#' \item{ANEM}{Percent of total annotated points annotated for sea anemone.}
#' \item{B_Clad}{Percent of total annotated points annotated for bleached Cladiella.}
#' \item{B_Sinu}{Percent of total annotated points annotated for bleached Sinularia.}
#' \item{Clad}{Percent of total annotated points annotated for Cladiella.}
#' \item{EncBry}{Percent of total annotated points annotated for encrusting Bryozoan.}
#' \item{EUR}{Percent of total annotated points annotated for sea urchin.}
#' \item{HYDCO}{Percent of total annotated points annotated for Hydrocoral.}
#' \item{Hydra}{Percent of total annotated points annotated for Hydroid.}
#' \item{Mille}{Percent of total annotated points annotated for Millepora.}
#' \item{MOBI}{Percent of total annotated points annotated for bivalves.}
#' \item{Sarco}{Percent of total annotated points annotated for Sarcophyton.}
#' \item{SECO}{Percent of total annotated points annotated for sea cucumber.}
#' \item{Sinu}{Percent of total annotated points annotated for Sinularia.}
#' \item{Sponge}{Percent of total annotated points annotated for sponge.}
#' \item{Stylas}{Percent of total annotated points annotated for Stylaster.}
#' \item{UnkTUN}{Percent of total annotated points annotated for unknown Tunicate.}
#' \item{XmasW}{Percent of total annotated points annotated for Christmas Tree Worm.}
#' \item{ZOAN}{Percent of total annotated points annotated for Zoanthid.}
#' \item{B_Sarco}{Percent of total annotated points annotated for bleached Sarcophyton.}
#' \item{Sand}{Percent of total annotated points annotated for sand.}
#' \item{Sediment}{Percent of total annotated points annotated for sediment.}
#' \item{SCRO}{Percent of total annotated points annotated for consolidated rock.}
#' \item{B_Loph}{Percent of total annotated points annotated for bleached Lobophytum.}
#' \item{CYAN}{Percent of total annotated points annotated for Cyanobacteria films.}
#' \item{Loph}{Percent of total annotated points annotated for Lobophytum.}
#' \item{Rubble}{Percent of total annotated points annotated for broken coral rubble.}
#' \item{SHAD}{Percent of total annotated points annotated for shadow.}
#' \item{Trans}{Percent of total annotated points annotated for transect hardware.}
#' \item{Unc}{Percent of total annotated points annotated for unclear.}
#' \item{AVRA}{Percent of total annotated points annotated for Avrainvillea.}
#' \item{Caul}{Percent of total annotated points annotated for Caulerpa.}
#' \item{CCA}{Percent of total annotated points annotated for crustose coraline algae.}
#' \item{Dict}{Percent of total annotated points annotated for Dictyota.}
#' \item{DICTY}{Percent of total annotated points annotated for Dictyosphaeria.}
#' \item{Hali}{Percent of total annotated points annotated for Halimeda.}
#' \item{Lobph}{Percent of total annotated points annotated for Lobophora.}
#' \item{Macro}{Percent of total annotated points annotated for macroalgae.}
#' \item{Mdict}{Percent of total annotated points annotated for Microdictyon.}
#' \item{Pad}{Percent of total annotated points annotated for Padina.}
#' \item{Peysson}{Percent of total annotated points annotated for Peyssonnelia.}
#' \item{Turf}{Percent of total annotated points annotated for turf algae.}
#' \item{TURFH}{Percent of total annotated points annotated for turf algae on hard substrate.}
#' \item{Unidentified}{Percent of total annotated points annotated that were unidentified.}
#' }
"softcoral_SQuads"
