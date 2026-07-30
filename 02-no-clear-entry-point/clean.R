# clean.R

source("helpers.R")

dat <- read.csv("data.csv")

dat <- drop_missing(dat)
dat$mass_kg <- to_kg(dat$body_mass_g)
dat$species <- factor(dat$species)

nrow(dat)
