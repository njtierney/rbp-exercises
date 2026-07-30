dat <- read.csv("penguins.csv")
dat <- dat[!is.na(dat$body_mass_g), ]
dat$mass_kg <- dat$body_mass_g / 1000

fit <- lm(mass_kg ~ flipper_length_mm + species, data = dat)
summary(fit)

plot(dat$flipper_length_mm, dat$mass_kg, col = factor(dat$species))

means <- tapply(dat$mass_kg, dat$species, mean)
out <- data.frame(species = names(means), mass_kg = as.numeric(means))
write.csv(out, "results.csv", row.names = FALSE)
