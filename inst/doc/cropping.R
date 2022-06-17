## ----load package, message = FALSE--------------------------------------------

library(quadcleanR)
library(ggplot2)


## ----randomized data, out.width = '45%', fig.show='hold'----------------------

#Creating a vector of the soft coral genera
tags <- c("Cladiella", "Sinularia", "Sarcophyton", "Lobophytum")

#Creating a vector of quadrat names
rep <- c(rep("Q1", times = 100),
          rep("Q2", times = 100),
          rep("Q3", times = 100),
          rep("Q4", times = 100))

#Creating a vector of randomized row locations
row <- c(sample(x = c(0:2000), size = 100, replace = TRUE),
         sample(x = c(0:2000), size = 100, replace = TRUE),
         sample(x = c(0:2000), size = 100, replace = TRUE),
         sample(x = c(0:2000), size = 100, replace = TRUE))

#Creating a vector of randomized column locations
column <- c(sample(x = c(0:2000), size = 100, replace = TRUE),
            sample(x = c(0:2000), size = 100, replace = TRUE),
            sample(x = c(0:2000), size = 100, replace = TRUE),
            sample(x = c(0:2000), size = 100, replace = TRUE))

#Creating a vector of randomized identification labels
label <- c(sample(x = tags, size = 100, replace = TRUE),
           sample(x = tags, size = 100, replace = TRUE),
           sample(x = tags, size = 100, replace = TRUE),
           sample(x = tags, size = 100, replace = TRUE))

#Joining vectors into a data frame
coral_annotations <- data.frame(rep, row, column, label)

#Plotting each quadrat
ggplot(coral_annotations[1:100,], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 1")

ggplot(coral_annotations[101:200,], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 2")

ggplot(coral_annotations[201:300,], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 3")

ggplot(coral_annotations[301:400,], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 4")



## ----randomized crop, out.width = '45%', fig.show='hold'----------------------

crop_area_coral_1 <- crop_area(data = coral_annotations, row = "row",
                             column = "column", id = "rep", dim = c(0.5, 0.5))



#Plotting each quadrat
ggplot(coral_annotations[1:100, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 1") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * max(column),
      ymin = 0,
      ymax =  0.5 * max(row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_1, rep == "Q1"),
             color = "red")

ggplot(coral_annotations[101:200, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 2") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * max(column),
      ymin = 0,
      ymax =  0.5 * max(row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_1, rep == "Q2"),
             color = "red")

ggplot(coral_annotations[201:300, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 3") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * max(column),
      ymin = 0,
      ymax =  0.5 * max(row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_1, rep == "Q3"),
             color = "red")

ggplot(coral_annotations[301:400, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 4") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * max(column),
      ymin = 0,
      ymax =  0.5 * max(row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_1, rep == "Q4"),
             color = "red")


## ----randomized crop with dimensions, out.width = '45%', fig.show='hold'------

coral_annotations[["col_dim"]] <- 2000
coral_annotations[["row_dim"]] <- 2000

crop_area_coral_2 <- crop_area(data = coral_annotations, row = "row",
                               column = "column", id = "rep", dim = c(0.5, 0.5),
                               res = TRUE, res_dim_x = "col_dim", res_dim_y = "row_dim")



#Plotting each quadrat
ggplot(coral_annotations[1:100, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 1") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * 2000,
      ymin = 0,
      ymax =  0.5 * 2000
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_2, rep == "Q1"),
             color = "red")

ggplot(coral_annotations[101:200, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 2") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * 2000,
      ymin = 0,
      ymax =  0.5 * 2000
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_2, rep == "Q2"),
             color = "red")

ggplot(coral_annotations[201:300, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 3") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * 2000,
      ymin = 0,
      ymax =  0.5 * 2000
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_2, rep == "Q3"),
             color = "red")

ggplot(coral_annotations[301:400, ], aes(x = column, y = row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "Quadrat 4") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.5 * 2000,
      ymin = 0,
      ymax =  0.5 * 2000
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = subset(crop_area_coral_2, rep == "Q4"),
             color = "red")


## ----load data, message = FALSE-----------------------------------------------

data(softcoral_annotations)


## ----visualize soft coral, out.width = '45%', fig.show='hold'-----------------

ex_1 <- subset(softcoral_annotations, Name == unique(softcoral_annotations$Name)[1])
ex_2 <- subset(softcoral_annotations, Name == unique(softcoral_annotations$Name)[2])
ex_3 <- subset(softcoral_annotations, Name == unique(softcoral_annotations$Name)[3])
ex_4 <- subset(softcoral_annotations, Name == unique(softcoral_annotations$Name)[4])

#Plotting each quadrat
ggplot(ex_1, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q10")

ggplot(ex_2, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q11") 

ggplot(ex_3, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q12") 

ggplot(ex_4, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q13") 



## ----randomized crop soft corals, out.width = '45%', fig.show='hold'----------

crop_area_softcoral <- crop_area(data = softcoral_annotations, row = "Row",
                             column = "Column", id = "Name", dim = c(0.9, 0.6), 
                             obs_range = c(36,64))

ex_1_sub <- subset(crop_area_softcoral, Name == unique(softcoral_annotations$Name)[1])
ex_2_sub <- subset(crop_area_softcoral, Name == unique(softcoral_annotations$Name)[2])
ex_3_sub <- subset(crop_area_softcoral, Name == unique(softcoral_annotations$Name)[3])
ex_4_sub <- subset(crop_area_softcoral, Name == unique(softcoral_annotations$Name)[4])


#Plotting each quadrat
ggplot(ex_1, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q10") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.6 * max(Column),
      ymin = 0,
      ymax =  0.9 * max(Row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = ex_1_sub,
             color = "red")

ggplot(ex_2, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q11") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.6 * max(Column),
      ymin = 0,
      ymax =  0.9 * max(Row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = ex_2_sub,
             color = "red")

ggplot(ex_3, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q12") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.6 * max(Column),
      ymin = 0,
      ymax =  0.9 * max(Row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = ex_3_sub,
             color = "red")

ggplot(ex_4, aes(x = Column, y = Row)) +
  geom_point() +
  theme_classic() +
  labs(y = "", x = "", title = "KI2013_site14_Q13") +
  geom_rect(
    aes(
      xmin = 0,
      xmax = 0.6 * max(Column),
      ymin = 0,
      ymax =  0.9 * max(Row)
    ),
    color = "black",
    alpha = 0
  ) +
  geom_point(data = ex_4_sub,
             color = "red")


