#creating data set
Sites <- c("One", "Two", "Three", "Four", "Five")
Acrop <- c(0.1, 0.4, 0.9, 0.2, 0.5)
Gardin <- c(0.4, 0.9, 0.5, 0.23, 0.8)
Psam <- c(0.9, 0.5, 0.8, 0.1, 0.4)
Lepta <- c(0.5, 0.7, 0.8, 0.2, 0.9)
coral_cover <- data.frame(Sites, Acrop, Gardin, Psam, Lepta)

#creating label data frame
species_short <- c("Acrop", "Gardin", "Psam", "Lepta")
species_long <- c("Acropora", "Gardineroseris", "Psammocora", "Leptastrea")
coral_labels <- data.frame(species_short, species_long)

test <- change_names(coral_cover, coral_labels, "species_short", "species_long")

#ensure that column 2's name was changed
expect_match(colnames(test)[2], "Acropora")
#ensure that column 1's name was not changed
expect_match(colnames(test)[1], "Sites")
