
Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1-Deep"))
Acropora.sp <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, NA)
Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, NA)
Notes <- c(NA, NA, "saw octopus", NA, "white balance corrected", NA)
coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp, Notes)


exact_keep_row <- keep_rm(coral_cover, c("One") , "row", TRUE, TRUE, TRUE, "Sites")
expect_equal(nrow(exact_keep_row), as.integer(3))
expect_equal(length(levels(exact_keep_row$Sites)), as.integer(1))

exact_keep_col <- keep_rm(coral_cover, c("Acropora.sp", "Gardineroseris.sp",
                         "Psammocora.sp", "Leptastrea.sp") , "col", TRUE, TRUE, TRUE)
expect_equal(ncol(exact_keep_col), as.integer(4))

exact_rm_row <- keep_rm(coral_cover, c("Three") , "row", FALSE, FALSE, TRUE, "Sites")
expect_equal(nrow(exact_rm_row), as.integer(5))
expect_equal(length(levels(exact_rm_row$Sites)), as.integer(3))

exact_rm_row_drop <- keep_rm(coral_cover, c("Three") , "row", FALSE, TRUE, TRUE, "Sites")
expect_equal(length(levels(exact_rm_row_drop$Sites)), as.integer(2))

exact_rm_col <- keep_rm(coral_cover, c("Notes") , "col", FALSE, FALSE, TRUE)
expect_equal(ncol(exact_rm_col), as.integer(6))


partial_keep_row <- keep_rm(coral_cover, c("-Deep", 2), "row", TRUE, TRUE, FALSE, "Transect")
expect_equal(nrow(partial_keep_row), as.integer(4))
expect_equal(length(levels(partial_keep_row$Transect)), as.integer(2))

partial_keep_col <- keep_rm(coral_cover, c(".sp", "Not"), "col", TRUE, TRUE, FALSE)
expect_equal(ncol(partial_keep_col), as.integer(5))

partial_rm_row <- keep_rm(coral_cover, c("-Shallow"), "row", FALSE, FALSE, FALSE, "Transect")
expect_equal(nrow(partial_rm_row), as.integer(3))
expect_equal(length(levels(partial_rm_row$Transect)), as.integer(3))

partial_rm_row_drop <- keep_rm(coral_cover, c("-Shallow"), "row", FALSE, TRUE, FALSE, "Transect")
expect_equal(length(levels(partial_rm_row_drop$Transect)), as.integer(1))

partial_rm_col <- keep_rm(coral_cover, c(".sp", "Not"), "col", FALSE, FALSE, FALSE)
expect_equal(ncol(partial_rm_col), as.integer(2))


