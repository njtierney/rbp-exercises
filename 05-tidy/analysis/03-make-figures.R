# Draws the figures for the report. Everything lands in output/figures/.
library(here)
library(ggplot2)

penguins <- read.csv(here("data", "penguins.csv"))

mass_flipper <- ggplot(
  penguins,
  aes(x = flipper_length_mm, y = mass_kg, colour = species)
) +
  geom_point(alpha = 0.7) +
  geom_smooth(method = "lm", se = FALSE) +
  labs(
    x = "Flipper length (mm)",
    y = "Body mass (kg)",
    colour = "Species"
  ) +
  theme_minimal()

ggsave(
  here("output", "figures", "mass-flipper.png"),
  mass_flipper,
  width = 6,
  height = 4
)

mass_species <- ggplot(penguins, aes(x = species, y = mass_kg)) +
  geom_boxplot() +
  labs(x = "Species", y = "Body mass (kg)") +
  theme_minimal()

ggsave(
  here("output", "figures", "mass-species.png"),
  mass_species,
  width = 6,
  height = 4
)
