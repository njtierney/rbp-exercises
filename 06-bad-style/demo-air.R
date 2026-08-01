library(dplyr)
library(ggplot2)
#read in data
penguins <- read.csv("penguins.csv")
Penguins_clean <- penguins |>
  filter(!is.na(bill_length_mm), !is.na(body_mass_g)) |>
  mutate(
    mass_kg = body_mass_g / 1000,
    bill_ratio = bill_length_mm / bill_depth_mm
  )
sd_mass <- sd(Penguins_clean$mass_kg)
mass_mean <- mean(Penguins_clean$mass_kg)
Long_variable_Name <- nrow(Penguins_clean)

summary_by_species <- Penguins_clean |>
  group_by(species, island) |>
  summarise(
    mass_mean = mean(mass_kg),
    SD_mass = sd(mass_kg),
    bill_ratio_mean = mean(bill_ratio),
    n = n(),
    .groups = "drop"
  ) |>
  arrange(desc(mass_mean))
print(summary_by_species)

m <- lm(mass_kg ~ flipper_length_mm + species, data = Penguins_clean)
print(summary(m))
