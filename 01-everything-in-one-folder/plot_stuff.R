dat <- read.csv("penguins.csv")

plot(dat$flipper_length_mm, dat$body_mass_g, col = factor(dat$species))
legend("topleft", legend = levels(factor(dat$species)), pch = 1, col = 1:3)

# for the talk on thursday
boxplot(body_mass_g ~ species, data = dat)

hist(dat$bill_length_mm, breaks = 30)
