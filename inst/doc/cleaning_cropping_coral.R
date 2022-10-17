## ----load package, message = FALSE, warning = FALSE---------------------------

library(quadcleanR)
library(dplyr)
library(tidyr)
library(shiny)
library(knitr)
library(kableExtra)


data("softcoral_SQuads")


## ----head and tail, results='hide'--------------------------------------------

tail(softcoral_SQuads)


## ----head and tail cleaner md output, message = FALSE, echo = FALSE, results='asis'----

knitr::kable(tail(softcoral_SQuads), align = 'c') %>%
  kable_styling("striped", full_width = F) %>% 
  scroll_box(width = "100%")


## ----confirmed annotation status----------------------------------------------

SQuad_confirmed <- softcoral_SQuads %>% filter(Annotation.status == "Confirmed") %>% select(-c(Image.ID, Points, Annotation.status))


## ----separating ID------------------------------------------------------------

SQuad_separated <- separate(SQuad_confirmed, Image.name, sep="_", into=c("Field.Season", "Site","Quadrat"))


## ----remove jpg and T19-------------------------------------------------------

SQuad_nojpg <- rm_chr(SQuad_separated, c(".jpg", ".jpeg"))
SQuad_site40 <- change_values(SQuad_nojpg, "Site", "siteT19", "site40")


## ----view levels--------------------------------------------------------------

unique(SQuad_site40$Field.Season)
unique(SQuad_site40$Site)


## ----add labelset, message=FALSE, results='hide'------------------------------

data("coral_labelset")
head(coral_labelset)


## ----add labelset cleaner md output, message = FALSE, echo = FALSE, results='asis'----

knitr::kable(head(coral_labelset), align = 'c')%>%
  kable_styling("striped", full_width = F) %>% 
  scroll_box(width = "100%")


## ----change colnames----------------------------------------------------------

SQuad_colnames <- change_names(SQuad_site40, coral_labelset, "short_name", "full_name")
names(SQuad_colnames)[1:16]


## ----usable points------------------------------------------------------------

SQuad_colnames <-  mutate_at(SQuad_colnames, c(4:134), as.numeric)

SQuad_usable <- usable_obs(SQuad_colnames, c("Shadow", "Transect_hardware", "Unclear"), 
                            max = TRUE, cutoff = 10)

SQuad_removed <- usable_obs(SQuad_colnames, c("Shadow", "Transect_hardware", "Unclear"),
                             max = TRUE, cutoff = 10, above_cutoff = TRUE)


## ----large quad---------------------------------------------------------------

data("softcoral_annotations")
data("softcoral_LQuads")


## ----removing unconfirmed-----------------------------------------------------

LQuad_confirmed <- softcoral_LQuads %>% filter(Annotation.status == "Confirmed") 

LQuad_sub <- softcoral_annotations %>% filter(Name %in% unique(LQuad_confirmed$Image.name))


## ----large quad cropping------------------------------------------------------

LQuad_cropped <- crop_area(data = LQuad_sub, row = "Row",
                             column = "Column", id = "Name", dim = c(0.9, 0.6), 
                             obs_range = c(36,64))


## ----large quad formatting----------------------------------------------------

LQuad_wide <- LQuad_cropped %>% select(-c(obs, Row, Column)) %>% group_by(Name) %>% pivot_wider(names_from = Label, values_from = Label, values_fn = length, values_fill = 0)
LQuad_wide <- as.data.frame(LQuad_wide)

LQuad_separated <- separate(LQuad_wide, Name, sep="_", into=c("Field.Season", "Site","Quadrat"))

LQuad_nojpg <- rm_chr(LQuad_separated, c(".jpg", ".jpeg"))

LQuad_colnames <- change_names(LQuad_nojpg, coral_labelset, "short_name", "full_name")


LQuad_colnames <-  mutate_at(LQuad_colnames, c(4:11), as.numeric)

LQuad_usable <- usable_obs(LQuad_colnames, c("Shadow", "Transect_hardware", "Unclear"),
                             max = TRUE, cutoff = 0.1*54)

LQuad_removed <- usable_obs(LQuad_colnames, c("Shadow", "Transect_hardware", "Unclear"),
                             max = TRUE, cutoff = 0.1*54, above_cutoff = TRUE)


## ----bind quad dfs------------------------------------------------------------

AllQuads <- bind_rows(SQuad_usable, LQuad_usable) %>% select(-c(unusable))

AllQuads[, 4:131][is.na(AllQuads[, 4:131])] <- 0


## ----remove DEEP, site 8.5 and MPQs-------------------------------------------

AllQuad_noDEEP_site8.5 <- keep_rm(AllQuads, c("DEEP", "site8.5"), select = "row", exact = FALSE, colname = "Site", keep = FALSE)

AllQuad_noMPQ <- keep_rm(AllQuad_noDEEP_site8.5, c("MPQ"), select = "row", exact = FALSE, colname = "Quadrat", keep = FALSE)


## ----prop cover calc----------------------------------------------------------

AllQuad_cover <- cover_calc(AllQuad_noMPQ, names(AllQuad_noMPQ[,4:131]), prop = TRUE)


## ----long format--------------------------------------------------------------

AllQuad_long <- AllQuad_cover %>% pivot_longer(cols = names(AllQuad_cover[,4:131]), names_to = "Tag_Name", values_to = "prop_cover")


## ----A categorizing bleaching-------------------------------------------------

A_AllQuad_Bleach <- categorize(AllQuad_long, "Tag_Name", values = c("Bleach"), name = "Bleached", binary = TRUE, exact = FALSE)


## ----A categorizing taxonomy--------------------------------------------------

A_AllQuad_Taxa <- categorize(A_AllQuad_Bleach, "Tag_Name", values = coral_labelset$full_name, name = "Taxonomic_Name", binary = FALSE, categories = coral_labelset$taxonomic_name)


## ----B summarising taxonomy, results='hide'-----------------------------------

B_AllQuad_taxonomy <- A_AllQuad_Taxa %>% group_by(Field.Season, Site, Quadrat, Taxonomic_Name) %>% summarise(prop_cover = sum(prop_cover))


## ----C summing columns--------------------------------------------------------

current_names <- colnames(AllQuad_cover[,4:131])
new_names <- coral_labelset[match(current_names, coral_labelset$full_name),]$taxonomic_name

AllQuad_wide_summed <- sum_cols(AllQuad_cover, from = current_names, to = new_names)


## ----add more data------------------------------------------------------------

B_AllQuad_LH_FG <- add_data(B_AllQuad_taxonomy, coral_labelset, cols = c("functional_group", "life_history"), data_id = "Taxonomic_Name", add_id = "taxonomic_name", number = 5)

data("environmental_data")

B_AllQuad_enviro <- add_data(B_AllQuad_LH_FG, environmental_data, cols = c("HD_Cat", "HD_Cont", "NPP",  "WE", "Region", "WaveEnergy"), data_id = "Site", add_id = "Site", number = 4)


## ----final characterization and subset----------------------------------------

B_AllQuad_timeblock <- categorize(B_AllQuad_enviro, column = "Field.Season", values = unique(B_AllQuad_enviro$Field.Season), name = "TimeBlock", binary = FALSE, exact = TRUE, categories = c(rep("Before", times = 8), rep("During", times = 3), rep("After", times = 4)))

AllQuads_cropclean <- keep_rm(B_AllQuad_timeblock, values = "Soft_coral", select = "row", colname = "functional_group")

AllQuads_cropclean$TimeBlock <- factor(AllQuads_cropclean$TimeBlock, levels = c("Before", "During", "After"))
AllQuads_cropclean$Site <- factor(AllQuads_cropclean$Site, levels = paste("site", seq(1:40), sep = ""))
AllQuads_cropclean$HD_Cat <- factor(AllQuads_cropclean$HD_Cat, levels = c("Very Low", "Low", "Medium", "High", "Very High"))


## ----sample sizes, results = 'hide'-------------------------------------------

sample_size(AllQuads_cropclean, dim_1 = "Site", dim_2 = "Field.Season", count = "Quadrat")


## ----sample sizes cleaner md output, message = FALSE, echo = FALSE, results='asis'----

knitr::kable(sample_size(AllQuads_cropclean, dim_1 = "Site", dim_2 = "Field.Season", count = "Quadrat"), align = 'c')%>%
  kable_styling("striped", full_width = F) %>% 
  scroll_box(width = "100%")


## ----shiny app, eval= FALSE---------------------------------------------------
#  
#  visualize_app(data = AllQuads_cropclean, xaxis = colnames(AllQuads_cropclean[,1:13]), yaxis = "prop_cover")
#  

