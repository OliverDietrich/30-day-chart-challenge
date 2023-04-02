# Day 2 - Waffle

# Libraries --------------------------------------------------------------------

library(dplyr)
library(ggplot2)

# Data -------------------------------------------------------------------------

# List ingredients
recipe <- c(
  "flour" = 136,
  "sugar" = 16,
  "baking powder" = 4,
  "salt" = 1,
  "milk" = 245,
  "eggs" = 120,
  "butter" = 57
)
recipe <- sort(recipe, decreasing = TRUE)

# Create grid for all ingredients
total <- sum(recipe)

x <- 1:29
y <- 1:20
df <- data.frame(
  x = rep(x, each = max(y)),
  y = rep(y, max(x))
)
df$col <- c(rep(names(recipe), recipe), NA)

# Plot -------------------------------------------------------------------------

ggplot(df, aes(x, y, fill = col)) +
  geom_tile(col = "white", size = 2)

