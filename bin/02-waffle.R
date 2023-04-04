# Day 2 - Waffle

# Libraries --------------------------------------------------------------------

library(dplyr)
library(ggplot2)

# Variables --------------------------------------------------------------------

out_dir <- "analysis/"

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

# Colors -----------------------------------------------------------------------

col <- list()
col$fill <- c(
  "milk" = "lavender",
  "flour" = "wheat",
  "eggs" = "orange",
  "butter" = "gold2",
  "sugar" = "darkseagreen1",
  "baking powder" = "lightpink",
  "salt" = "mediumseagreen"
)

# Arrange data -----------------------------------------------------------------

# Create grid for all ingredients
total <- sum(recipe)

# Wrangle
x <- 1:29
y <- 1:20
df <- data.frame(
  x = rep(x, each = max(y)),
  y = rep(y, max(x))
)
df$col <- c(rep(names(recipe), recipe), NA)
df <- df[!is.na(df$col), ]
df$col <- factor(df$col, names(recipe))

# Plot -------------------------------------------------------------------------

ggplot(df, aes(x, y, fill = col)) +
  geom_tile(col = "white", linewidth = 1) +
  scale_fill_manual(values = col$fill) +
  theme_void(20) +
  theme(
    aspect.ratio = 1,
    legend.position = "right"
  ) +
  labs(fill = "Ingredient", title = "What is in my waffle?")
fn <- paste0(out_dir, "day2_waffle.png")
ggsave(fn, width = 8, height = 6, bg = "white")
