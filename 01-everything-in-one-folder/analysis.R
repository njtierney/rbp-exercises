setwd("/Users/nick/Desktop/penguin stuff/final analysis")

dat <- read.csv("penguins.csv")
dat <- dat[!is.na(dat$body_mass_g), ]
dat$mass_kg <- dat$body_mass_g / 1000

# sam reckons the 2007 measurements were done differently, check this
# dat <- dat[dat$year > 2007, ]

table(dat$species, dat$island)

m <- lm(mass_kg ~ flipper_length_mm + species, data = dat)
summary(m)

# tried adding sex but it drops a pile of rows
# m2 <- lm(mass_kg ~ flipper_length_mm + species + sex, data = dat)
# anova(m, m2)

png("figure1.png")
plot(dat$flipper_length_mm, dat$mass_kg)
dev.off()

means <- tapply(dat$mass_kg, dat$species, mean)
means

write.csv(dat, "results.csv", row.names = FALSE)
