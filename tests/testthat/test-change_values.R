# creating data set
Sites <- c("One.jpg", "Two.jpg", "Three.jpg", "Four.jpg", "Five.jpg")
Dominant_Coral <- c("Acropora.sp", "Leptastrea.spp", "Acropora.sp",
                    "Acropora.sp", "Acropora.sp")
Dominant_Cover <- c(0.1, 0.4, 0.9, 0.2, 0.5)
Largest_Coral <- c("Acropora.sp", "Acropora.sp", "Psammocora.sp",
                   "Acropora.sp","Gardineroseris.spp")

coral_cover <- data.frame(Sites, Dominant_Coral, Dominant_Cover, Largest_Coral)

coral_new <- change_values(coral_cover, "Dominant_Coral", c("Acropora.sp","Leptastrea.spp"), c("Acropora_tabulate", "Leptastrea.purpurea"))
expect_match(coral_new$Dominant_Coral[2], "Leptastrea.purpurea")
