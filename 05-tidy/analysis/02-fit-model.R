# Fits body mass against flipper length and species.
library(here)

source(here("R", "functions.R"))

penguins <- read.csv(here("data", "penguins.csv"))

# Centred, so the intercept is the mass of an average-flippered Adelie rather
# than one with a flipper of 0 mm.
penguins$flipper_centered <- mean_center(penguins$flipper_length_mm)

fit <- lm(mass_kg ~ flipper_centered + species, data = penguins)
summary(fit)

saveRDS(fit, here("output", "models", "mass-model.rds"))
