#create data set for test
Sites <- as.factor(c("One", "One", "Two", "Two", "Three", "Three"))
Transect <- as.factor(c("1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow"))
Acropora.sp <- c(1, 2, 3, 4, 5, 6)
Gardineroseris.sp <- c(6, 1, 2, 3, 4, 5)
Psammocora.sp <- c(5, 6, 1, 2, 3, 4)
Leptastrea.sp <- c(4, 5, 6, 1, 2, 3)
coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp)


prop <- cover_calc(data = coral_cover, spp = names(coral_cover[3:6]), prop = TRUE, total = FALSE)
expect_equal(prop[1,3], coral_cover[1,3]/16)

prop_total <- cover_calc(data = coral_cover, spp = names(coral_cover[3:6]), prop = TRUE, total = TRUE)
expect_equal(names(prop_total[7]), "total_pts")
expect_equal(prop_total[4,7], 10)

percent <- cover_calc(data = coral_cover, spp = names(coral_cover[3:6]), prop = FALSE, total = FALSE)
expect_equal(percent[1,3], prop[1,3]*100)

percent_total <- cover_calc(data = coral_cover, spp = names(coral_cover[3:6]), prop = FALSE, total = TRUE)
expect_equal(sum(percent_total[7]), 84)


Sites <- as.factor(c("One", "One", "Two", "Two", "Three", "Three"))
Transect <- as.factor(c("1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow", "1-Shallow", "2-Shallow"))
Acropora.sp <- c(1, 2, 3, 4, 5, 0)
Gardineroseris.sp <- c(6, 1, 2, 3, 4, 0)
Psammocora.sp <- c(5, 6, 1, 2, 3, 0)
Leptastrea.sp <- c(4, 5, 6, 1, 2, 0)
coral_cover2 <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp)

expect_warning(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = TRUE, total = FALSE))
prop_zero <- suppressWarnings(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = TRUE, total = FALSE))
expect_equal(prop_zero[6,4], 0)
expect_equal(prop_zero[6,3], 0)


expect_warning(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = TRUE, total = TRUE))
prop_total_zero <- suppressWarnings(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = TRUE, total = TRUE))
expect_equal(names(prop_total_zero[7]), "total_pts")
expect_equal(prop_total_zero[4,7], 10)
expect_equal(prop_total_zero[6,3], 0)

expect_warning(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = FALSE, total = FALSE))
percent_zero <- suppressWarnings(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = FALSE, total = FALSE))
expect_equal(percent_zero[1,3], prop[1,3]*100)
expect_equal(percent_zero[6,3], 0)

expect_warning(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = FALSE, total = TRUE))
percent_total_zero <- suppressWarnings(cover_calc(data = coral_cover2, spp = names(coral_cover2[3:6]), prop = FALSE, total = TRUE))
expect_equal(sum(percent_total_zero[7]), 66)
expect_equal(percent_total_zero[6,3], 0)
