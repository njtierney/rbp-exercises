dat <- read.csv("cleaned_data.csv")

fit <- lm(mass_kg ~ flipper_length_mm, data = dat)
summary(fit)
saveRDS(fit, "model_fit.rds")

png("fig-mass-flipper.png", width = 600, height = 400)
plot(dat$flipper_length_mm, dat$mass_kg)
abline(fit)
dev.off()

png("fig-species.png", width = 600, height = 400)
boxplot(mass_kg ~ species, data = dat)
dev.off()
