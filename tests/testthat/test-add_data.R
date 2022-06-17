#create data set for test
Sites <- as.factor(c("One", "One", "One", "Two", "Two", "Three"))
Transect <- as.factor(c("1-Deep", "1-Shallow", "2-Shallow", "1-Shallow", "1-Deep", "1"))
coral_name <- c("Acropora.sp", "Leptastrea.sp", "Sinularia.sp", "Psammocora.sp", "Psammocora.sp", "Leptastrea.sp")
prop_cover <- c(0.1, 0.6, 0.4, 0.9, 0.2, 0.5)
coral_cover <- data.frame(Sites, Transect, coral_name, prop_cover)

corals <- c("Acropora.sp", "Leptastrea.sp", "Psammocora.sp")
lifehistory <- c("compeditive", "weedy",  "stresstolerant")
functionalgroup <- c("hardcoral", "hardcoral", "hardcoral")
coral_info <- data.frame(corals, lifehistory, functionalgroup)


test_1 <- add_data(data = coral_cover, add = coral_info, cols = c("lifehistory", "functionalgroup"),
         data_id = "coral_name", add_id = "corals")
expect_equal(length(colnames(test_1)), 6)
expect_equal(colnames(test_1)[5], "lifehistory")
expect_equal(test_1[4,5], "stresstolerant")


test_2 <- add_data(data = coral_cover, add = coral_info, cols = c("lifehistory", "functionalgroup"),
                   data_id = "coral_name", add_id = "corals", number = 4)
expect_equal(length(colnames(test_2)), 6)
expect_equal(colnames(test_2)[4], "lifehistory")
expect_equal(test_2[6,4], "weedy")
