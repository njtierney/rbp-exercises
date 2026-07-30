library(ggplot2)

dat <- read.csv("penguins.csv")
dat <- dat[!is.na(dat$body_mass_g), ]
dat$mass_kg <- dat$body_mass_g / 1000

# other crew measured the 2007 birds, drop them
dat <- dat[dat$year > 2007, ]

fit <- lm(mass_kg ~ flipper_length_mm + species, data = dat)
summary(fit)

p <- ggplot(dat, aes(x = flipper_length_mm, y = mass_kg, colour = species)) +
  geom_point() +
  geom_smooth(method = "lm", se = FALSE)
ggsave("fig-mass-flipper.png", p, width = 6, height = 4)

means <- tapply(dat$mass_kg, dat$species, mean)
out <- data.frame(species = names(means), mass_kg = as.numeric(means))
write.csv(out, "results.csv", row.names = FALSE)
