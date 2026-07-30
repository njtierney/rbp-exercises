dat <- read.csv("penguins.csv")
dat <- dat[!is.na(dat$body_mass_g), ]
dat$mass_kg <- dat$body_mass_g / 1000

fit <- lm(mass_kg ~ flipper_length_mm, data = dat)
summary(fit)

plot(dat$flipper_length_mm, dat$mass_kg)
abline(fit)
