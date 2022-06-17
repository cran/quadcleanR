#create data set for test
Sites <- as.factor(c("One", "One", "Two", "Two", "Three", "Three"))
Transect <- as.factor(c("1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow"))
Acropora.sp <- c(1, 2, 3, 4, 5, 6)
Gardineroseris.sp <- c(6, 1, 2, 3, 4, 5)
Psammocora.sp <- c(5, 6, 1, 2, 3, 4)
Leptastrea.sp <- c(4, 5, 6, 1, 2, 3)
Blurry <- c(3, 4, 5, 6, 1, 2)
Unk <- c(2, 3, 4, 5, 6, 1)
coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp, Blurry, Unk)

test1 <- usable_obs(coral_cover, c("Blurry", "Unk"))
expect_match(colnames(test1[7]), "unusable")
expect_equal(test1[,7], c(5, 7, 9, 11, 7, 3))

expect_warning(usable_obs(coral_cover, c("Blurry", "Unk"), print_max = TRUE),  "no max specified")

expect_warning(usable_obs(coral_cover, c("Blurry", "Unk"), rm_unusable = FALSE), "duplication exists in the data frame")
test2 <- suppressWarnings(usable_obs(coral_cover, c("Blurry", "Unk"), rm_unusable = FALSE))
expect_match(colnames(test2[9]), "unusable")

test3 <- usable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8)
expect_equal(nrow(test3), 4)

test4 <- usable_obs(coral_cover, c("Blurry", "Unk"), max = TRUE, cutoff = 8, print_max = TRUE)
expect_equal(nrow(test4), 2)

