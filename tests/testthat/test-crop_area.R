
#Creating the data set
set.seed(17)
tags <- c("Clad", "Sinu", "Sarco", "Loph")

site <- c(rep("Site1", times = 100),
          rep("Site2", times = 100),
          rep("Site3", times = 100),
          rep("Site4", times = 100))
row <- c(sample(x = c(1:2000), size = 100, replace = TRUE),
         sample(x = c(1:2000), size = 100, replace = TRUE),
         sample(x = c(1:2000), size = 100, replace = TRUE),
         sample(x = c(1:2000), size = 100, replace = TRUE))
column <- c(sample(x = c(1:2000), size = 100, replace = TRUE),
            sample(x = c(1:2000), size = 100, replace = TRUE),
            sample(x = c(1:2000), size = 100, replace = TRUE),
            sample(x = c(1:2000), size = 100, replace = TRUE))
label <- c(sample(x = tags, size = 100, replace = TRUE),
           sample(x = tags, size = 100, replace = TRUE),
           sample(x = tags, size = 100, replace = TRUE),
           sample(x = tags, size = 100, replace = TRUE))
coral_annotations <- data.frame(site, row, column, label)
coral_annotations$site <- as.factor(coral_annotations$site)

test1 <- crop_area(data = coral_annotations, row = "row",
                             column = "column", id = "site", dim = c(0.5, 0.5))

expect_true(nrow(coral_annotations) > nrow(test1))

coral_annotations$col_dim <- 2000
coral_annotations$row_dim <- 2000

test2 <- crop_area(data = coral_annotations, row = "row",
                               column = "column", id = "site", dim = c(0.5, 0.5),
                               res = TRUE, res_dim_x = "col_dim", res_dim_y = "row_dim")

expect_true(ncol(test2) > ncol(coral_annotations))
expect_true(nrow(test2) < nrow(coral_annotations))
expect_true(nrow(test1) < nrow(test2))


test3 <- crop_area(data = coral_annotations, row = "row",
                   column = "column", id = "site", dim = c(0.5, 0.5),
                   res = TRUE, res_dim_x = "col_dim", res_dim_y = "row_dim",
                   obs_rm = TRUE, obs_range = c(20, 30))

expect_true(nrow(test3) < nrow(test2))
expect_true(length(unique(test3$site)) < length(unique(test2$site)))


test4 <- crop_area(data = coral_annotations, row = "row",
                   column = "column", id = "site", dim = c(0.5, 0.5),
                   obs_rm = TRUE, obs_range = c(20, 30))

expect_true(nrow(test4) < nrow(test1))
expect_true(length(unique(test4$site)) < length(unique(test1$site)))
