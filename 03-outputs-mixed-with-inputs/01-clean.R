dat <- read.csv("penguins.csv")

dat <- dat[!is.na(dat$body_mass_g) & !is.na(dat$flipper_length_mm), ]
dat$mass_kg <- dat$body_mass_g / 1000
dat <- dat[, c("species", "island", "flipper_length_mm", "mass_kg", "year")]

write.csv(dat, "cleaned_data.csv", row.names = FALSE)
