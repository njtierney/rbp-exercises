# final.R

source("helpers.R")

dat <- read.csv("data.csv")

dat <- dat[!is.na(dat$body_mass_g), ]
dat$mass_kg <- dat$body_mass_g / 1000

# the 2007 birds were measured by the other crew, leave them out
dat <- dat[dat$year > 2007, ]

fit <- lm(mass_kg ~ flipper_length_mm + species, data = dat)
summary(fit)

species_means(dat)
