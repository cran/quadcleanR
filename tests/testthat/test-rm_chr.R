 # creating data set
 Sites <- c("One.jpg", "Two.jpg", "Three.jpg", "Four.jpg", "Five.jpg")
 Dominant_Coral <- c("Acropora.sp", "Leptastrea.spp", "Acropora.sp",
     "Acropora.sp", "Acropora.sp")
 Dominant_Cover <- c(0.1, 0.4, 0.9, 0.2, 0.5)
 Largest_Coral <- c("Acropora.sp", "Acropora.sp", "Psammocora.sp",
     "Acropora.sp","Gardineroseris.spp")

 coral_cover <- data.frame(Sites, Dominant_Coral, Dominant_Cover, Largest_Coral)

 # removing a character from select columns
 coral_cover_nospp <- rm_chr(coral_cover, c(".spp"), full_selection = FALSE,
     cols = c("Largest_Coral", "Dominant_Coral"))

 #ensure that Dominant_Coral characters were changed
 expect_match(coral_cover_nospp$Dominant_Coral[1], "Acropora.sp")
 expect_match(coral_cover_nospp$Dominant_Coral[2], "Leptastrea")

 # removing multiple characters from all columns
 coral_cover_clean <- rm_chr(coral_cover, c(".jpg", ".spp", ".sp"))

 #ensure that all characters were changed
 expect_match(coral_cover_nospp$Sites[1], "One")
 expect_match(coral_cover_nospp$Largest_Coral[2], "Acropora")
