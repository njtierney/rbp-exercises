# plots.R

source("clean.R")

plot(dat$flipper_length_mm, dat$mass_kg, col = dat$species)
legend("topleft", legend = levels(dat$species), pch = 1, col = 1:3)

boxplot(mass_kg ~ species, data = dat)
