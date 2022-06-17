## ----load package, warning=FALSE, message=FALSE-------------------------------

library(quadcleanR)
library(dplyr)
library(tidyr)
library(shiny)
library(knitr)
library(kableExtra)

data("softcoral_LQuads")


## ----head and tail, results='hide'--------------------------------------------

tail(softcoral_LQuads)


## ----head and tail cleaner md output, message = FALSE, echo = FALSE, results='asis'----

knitr::kable(tail(softcoral_LQuads), align = 'c') %>%
  kable_styling("striped", full_width = F) %>% 
  scroll_box(width = "100%")


## ----confirmed annotation status----------------------------------------------

LQuad_confirmed <- softcoral_LQuads %>% filter(Annotation.status == "Confirmed") %>% select(-c(Image.ID, Points, Annotation.status))


## ----separating ID------------------------------------------------------------

LQuad_separated <- separate(LQuad_confirmed, Image.name, sep="_", into=c("Field.Season", "Site","Quadrat"))


## ----remove jpg and T19-------------------------------------------------------

LQuad_nojpg <- rm_chr(LQuad_separated, c(".jpg", ".jpeg"))

LQuad_site40 <- change_values(LQuad_nojpg, "Site", "siteT19", "site40")

LQuad_noDEEP_site8.5 <- keep_rm(LQuad_site40, c("DEEP", "site8.5"), select = "row", exact = FALSE, colname = "Site", keep = FALSE)

LQuad_noMPQ <- keep_rm(LQuad_noDEEP_site8.5, c("MPQ"), select = "row", exact = FALSE, colname = "Quadrat", keep = FALSE)



## ----view levels--------------------------------------------------------------

unique(LQuad_noMPQ$Field.Season)
unique(LQuad_noMPQ$Site)


## ----add labelset, message=FALSE, results='hide'------------------------------

data("coral_labelset")
head(coral_labelset)


## ----add labelset cleaner md output, message = FALSE, echo = FALSE, results='asis'----

knitr::kable(head(coral_labelset), align = 'c')%>%
  kable_styling("striped", full_width = F) %>% 
  scroll_box(width = "100%")


## ----change colnames----------------------------------------------------------

LQuad_colnames <- change_names(LQuad_noMPQ, coral_labelset, "short_name", "full_name")
names(LQuad_colnames)[1:16]


## ----usable points------------------------------------------------------------

LQuad_colnames <-  mutate_at(LQuad_colnames, c(4:134), as.numeric)

LQuad_usable <- usable_obs(LQuad_colnames, c("Shadow", "Transect_hardware", "Unclear"), 
                            max = TRUE, cutoff = 10)

LQuad_removed <- usable_obs(LQuad_colnames, c("Shadow", "Transect_hardware", "Unclear"),
                             max = TRUE, cutoff = 10, print_max = TRUE)


## ----prop cover calc----------------------------------------------------------

LQuad_cover <- cover_calc(LQuad_usable, names(LQuad_usable[,4:131]), prop = TRUE) 


## ----long format--------------------------------------------------------------

LQuad_long <- LQuad_cover %>% select(-c(unusable)) %>% pivot_longer(cols = names(LQuad_cover[,4:131]), names_to = "Tag_Name", values_to = "prop_cover")


## ----A categorizing bleaching-------------------------------------------------

A_LQuad_Bleach <- categorize(LQuad_long, "Tag_Name", values = c("Bleach"), name = "Bleached", binary = TRUE, exact = FALSE)


## ----A categorizing taxonomy--------------------------------------------------

A_LQuad_Taxa <- categorize(A_LQuad_Bleach, "Tag_Name", values = coral_labelset$full_name, name = "Taxonomic_Name", binary = FALSE, categories = coral_labelset$taxonomic_name)


## ----B summarising taxonomy, results='hide'-----------------------------------

B_LQuad_taxonomy <- A_LQuad_Taxa %>% group_by(Field.Season, Site, Quadrat, Taxonomic_Name) %>% summarise(prop_cover = sum(prop_cover))


## ----C summing columns--------------------------------------------------------

current_names <- colnames(LQuad_cover[,4:131])
new_names <- coral_labelset[match(current_names, coral_labelset$full_name),]$taxonomic_name

LQuad_wide_summed <- sum_cols(LQuad_cover, from = current_names, to = new_names)


## ----add more data------------------------------------------------------------

B_LQuad_LH_FG <- add_data(B_LQuad_taxonomy, coral_labelset, cols = c("functional_group", "life_history"), data_id = "Taxonomic_Name", add_id = "taxonomic_name", number = 5)

data("environmental_data")

B_LQuad_enviro <- add_data(B_LQuad_LH_FG, environmental_data, cols = c("HD_Cat", "HD_Cont", "NPP",  "WE", "Region", "WaveEnergy"), data_id = "Site", add_id = "Site", number = 4)


## ----final characterization and subset----------------------------------------

B_LQuad_timeblock <- categorize(B_LQuad_enviro, column = "Field.Season", values = unique(B_LQuad_enviro$Field.Season), name = "TimeBlock", binary = FALSE, exact = TRUE, categories = c(rep("Before", times = 4), rep("During", times = 3), rep("After", times = 4)))

simple_cleaned <- keep_rm(B_LQuad_timeblock, values = "Soft_coral", select = "row", colname = "functional_group")


## ----sample sizes, results = 'hide'-------------------------------------------

sample_size(simple_cleaned, dim_1 = "Site", dim_2 = "Field.Season", count = "Quadrat")


## ----sample sizes cleaner md output, message = FALSE, echo = FALSE, results='asis'----

knitr::kable(sample_size(simple_cleaned, dim_1 = "Site", dim_2 = "Field.Season", count = "Quadrat"), align = 'c')%>%
  kable_styling("striped", full_width = F) %>% 
  scroll_box(width = "100%")


## ----shiny app from git, eval = FALSE-----------------------------------------
#  
#  runGitHub("quadcleanR", username = "DominiqueMaucieri", subdir = "inst/shiny/example", ref = "main")
#  

## ----shiny app, eval= FALSE---------------------------------------------------
#  
#  visualize_app(data = simple_cleaned, xaxis = colnames(simple_cleaned[,1:13]), yaxis = "prop_cover")
#  

