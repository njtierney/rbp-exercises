# Rebuilds data/penguins.csv from the raw file. The cleaning itself lives in
# data-raw/, next to the data it cleans.
library(here)

source(here("data-raw", "clean-penguins.R"))

penguins <- read.csv(here("data", "penguins.csv"))
nrow(penguins)
summary(penguins$mass_kg)
