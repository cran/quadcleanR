## ----setup, warning=FALSE, message=FALSE--------------------------------------

library(quadcleanR)

data("corals")


## ----change_names, warning=FALSE, message=FALSE-------------------------------

data("coral_labelset")

corals_change_names <- change_names(corals, coral_labelset, from = "short_name", to = "full_name")


## ----change_values, warning=FALSE, message=FALSE------------------------------

corals_change_values <- change_values(corals_change_names, "Field.Season", c("KI2015a", "KI2016a"), c("KI2015", "KI2016"))


## ----keep_rm, warning=FALSE, message=FALSE------------------------------------

corals_keep_rm <- keep_rm(corals_change_values, "DEEP" , select = "row", keep = FALSE, drop_levels = TRUE, exact = FALSE, "Site")


## ----rm_chr, warning=FALSE, message=FALSE-------------------------------------

corals_rm_chr <- rm_chr(corals_keep_rm, rm = c(".jpg", ".jpeg"), full_selection = FALSE, cols = "Quadrat")


## ----sum_cols, warning=FALSE, message=FALSE-----------------------------------

corals_sum_cols <- sum_cols(corals_rm_chr, from = c("Acropora_corymbose", "Acropora_digitate", "Acropora_tabulate"), to = c("Acropora_spp", "Acropora_spp", "Acropora_spp"))


## ----add_data, warning=FALSE, message=FALSE-----------------------------------

data("environmental_data")

corals_add_data <- add_data(corals_sum_cols, environmental_data, cols = c("HD_Cat", "HD_Cont"), data_id = "Site", add_id = "Site", number = 4)


## ----categorize, warning=FALSE, message=FALSE---------------------------------

corals_categorize <- categorize(corals_add_data, "Field.Season", values = c("2015", "2016", "2017"), name = "ElNino", binary = FALSE, exact = FALSE, categories = c("Before", "During", "After"))


## ----cover_calc, warning=FALSE, message=FALSE---------------------------------

corals_cover_calc <- cover_calc(corals_categorize, spp = colnames(corals_categorize[,c(7:15)]), prop = TRUE, total = TRUE)


## ----usable_obs, warning=FALSE, message=FALSE---------------------------------

corals_usable_obs <- usable_obs(corals_cover_calc, c("Unclear", "Shadow"), max = TRUE, cutoff = 0.9, above_cutoff = FALSE, rm_unusable = TRUE)


## ----sample_size, warning=FALSE, message=FALSE--------------------------------

corals_sample_size <- sample_size(corals_usable_obs, dim_1 = "Site", dim_2 = "Field.Season", count = "Quadrat")


## ----visualize_app, eval= FALSE-----------------------------------------------
#  
#  corals_usable_obs$ElNino <- factor(corals_usable_obs$ElNino, levels = c("Before", "During", "After"))
#  corals_usable_obs$HD_Cat <- factor(corals_usable_obs$HD_Cat, levels = c("Very High", "High", "Medium", "Low", "Very Low"))
#  
#  
#  visualize_app(data = corals_usable_obs, xaxis = colnames(corals_usable_obs[,c(1:6)]), yaxis = colnames(corals_usable_obs[,c(7:13)]))
#  

