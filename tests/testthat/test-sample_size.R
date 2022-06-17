#creating test data frame
Year <- c("2000", "2000", "2000", "2000", "2000", "2001", "2001", "2001", "2001",
          "2002", "2002", "2002", "2002", "2003", "2003", "2003", "2003", "2003", "2003")
Site <- c("site1", "site1", "site2", "site2", "site2","site1", "site1", "site2", "site2",
          "site1", "site1", "site2", "site2","site1", "site1", "site2", "site2", "site2", "site2")
Quadrat <- c("Q1", "Q2", "Q3", "Q4", "Q5", "Q6", "Q7", "Q8", "Q9", "Q10", "Q11",
             "Q12", "Q13", "Q14", "Q15", "Q16", "Q17", "Q18", "Q19")
Cover <- sample(x = seq(from = 0, to = 1, by = 0.01), 19, replace=TRUE)
coral_cover <- data.frame(Year, Site, Quadrat, Cover)

test1 <- sample_size(coral_cover, dim_1 = "Site", dim_2 = "Year", count = "Quadrat")
expect_equal(dim(test1), c(2,4))
expect_equal(colnames(test1), unique(Year))
expect_equal(test1[1,4], 2)
