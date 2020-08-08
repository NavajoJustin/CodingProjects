#installed packages for data science
install.packages("tidyverse")
library("tidyverse")
library(tidyverse)

#install packages with remotes
install.packages("remotes")

#installed data
remotes::install_github("allisonhorst/palmerpenguins")
library(palmerpenguins)
penguins

library(tidyverse)
glimpse(penguins)
View(penguins)

#data visualize for group 3 lighting presentation
ggplot(data = penguins, aes(x = island, y = body_mass_g)) +
  #geom_point changes the characteristic of the points in scatter plot
  #aes uses the sex and island to define what the output of color and shape will be
  geom_point(aes(color = sex, 
                 shape = island),
             #change the size of point, alpha is opacity, and position jitter prevents point overlap
             size = 3,
             alpha = 0.65, 
             position = "jitter") +
  #the hashtag numbers are hexcodes for colors, na.translate = F is a way of removing the NA count
  scale_color_manual(values = c("#009E73","#CC79A7"), 
                     na.translate = F) +
  #lab(...) changes the labels of the graph
  labs(title = "Distribution of Body Mass across Penguin Sex",
       subtitle = "Body Mass and Sex for Each island",
       #renaming the x-axis, y-axis, and the legend titles of color and shape to what is in quotations
       x = "Island",
       y = "Body mass (g)",
       color = "Penguin sex",
       shape = "Penguin island") +
  theme_minimal()

#Revised and updated ggplot for individual lightning talk
ggplot(data = subset(penguins, !is.na(sex)),
       aes(x = island, fill = sex)) +
  geom_bar(width = 0.5) +
  geom_text(stat = 'count', aes(label = ..count..),
            position = position_stack(vjust = 0.8), size = 4.5) +
  scale_color_manual(values = c("#009E73","gray")) +
  theme(axis.text.x = element_text(angle = 65, vjust = 0.6)) +
  labs(title = "Penguin Sex Count Across all Islands",
       x = "Island",
       y = "Number of Individuals",
       fill = "Sex")
