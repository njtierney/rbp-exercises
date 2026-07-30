# analysis.R

source("helpers.R")

dat <- read.csv("data.csv")

# same cleaning as clean.R, kept here so this runs on its own
dat <- dat[!is.na(dat$body_mass_g), ]
dat$mass_kg <- dat$body_mass_g / 1000

fit <- lm(mass_kg ~ flipper_length_mm + species, data = dat)
summary(fit)

species_means(dat)
