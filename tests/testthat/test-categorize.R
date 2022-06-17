#create data set for test
Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1"))
Acropora.sp <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
Gardineroseris.sp <- c(0.4, 0.9, 0.5, 0.23, 0.5, NA)
Psammocora.sp <- c(0.9, 0.6, 0.5, 0.8, 0.1, 0.4)
Leptastrea.sp <- c(0.5, 0.7, 0.4, 0.8, 0.2, NA)
Notes <- c(NA, NA, "saw octopus", NA, "white balance corrected", NA)
coral_cover <- data.frame(Sites, Transect, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp, Notes)


test_binary <- categorize(data = coral_cover, column = "Transect", values = "Shallow", name = "Shallow", binary = TRUE, exact = FALSE)
expect_equal(colnames(test_binary[3]), "Shallow")
expect_equal(levels(test_binary$Shallow), c("No", "Yes"))

test_cat <- categorize(data = coral_cover, column = "Transect", values = c("Shallow", "Deep"), name = "Depth", binary = FALSE, categories = c("S", "D"), exact = FALSE)
expect_equal(colnames(test_cat[3]), "Depth")
expect_equal(levels(test_cat$Depth), c("D", "S"))


Sites <- as.factor(c("One", "One", "One_Deep", "Two", "Two_Deep", "Three"))
coral_cover_2 <- data.frame(Sites, Acropora.sp, Gardineroseris.sp,
                          Psammocora.sp, Leptastrea.sp, Notes)

test_binary_2 <- categorize(data = coral_cover_2, column = "Sites", values = "Deep", name = "Deep", binary = TRUE, exact = FALSE)
expect_equal(colnames(test_binary_2[2]), "Deep")
expect_equal(levels(test_binary_2$Deep), c("No", "Yes"))

test_binary_3 <- categorize(data = coral_cover_2, column = "Sites", values = "Deep", name = "Deep", binary = TRUE, exact = TRUE)
expect_equal(colnames(test_binary_3[2]), "Deep")
expect_equal(levels(test_binary_3$Deep), "No")

test_binary_4 <- categorize(data = coral_cover_2, column = "Sites", values = "One", name = "One", binary = TRUE, exact = TRUE)
expect_equal(colnames(test_binary_4[2]), "One")
expect_equal(test_binary_4[3,2], structure(1L, .Label = c("No", "Yes"), class = "factor"))

test_cat_2 <- categorize(data = coral_cover_2, column = "Sites", values = c("One", "One_Deep"), name = "One", binary = FALSE, categories = c("short", "long"), exact = TRUE)
expect_equal(test_cat_2[4,2], structure(NA_integer_, .Label = c("long", "short"), class = "factor"))


