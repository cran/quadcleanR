#create data set for test
Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
Acropora.tabulate <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0)
Acropora.corymbose <- c(0.4, 0, 0.1, 0, 0.3, 0.5)
Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, 0.6)
Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, 0.3)
coral_cover <- data.frame(Sites, Transect, Acropora.tabulate, Acropora.corymbose,
                          Gardineroseris.sp, Psammocora.sp, Leptastrea.sp)

new_names <- c("Acropora.spp", "Acropora.spp", "Gardineroseris.sp",
               "Psammocora.sp", "Leptastrea.sp")


test <- sum_cols(data = coral_cover, from = colnames(coral_cover[,3:7]),
             to = new_names)
expect_equal(ncol(test), 6)
expect_equal(colnames(test)[3], "Acropora.spp")
expect_equal(sum(test$Acropora.spp), 3.5)
