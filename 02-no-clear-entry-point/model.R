# model.R

source("clean.R")

m1 <- lm(mass_kg ~ flipper_length_mm, data = dat)
m2 <- lm(mass_kg ~ flipper_length_mm + species, data = dat)

anova(m1, m2)
summary(m2)
