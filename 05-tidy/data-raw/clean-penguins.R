# Turns data-raw/penguins-raw.csv into data/penguins.csv.
# Raw data is read-only: every change to it happens here, in code.
library(here)

source(here("R", "functions.R"))

raw <- read.csv(here("data-raw", "penguins-raw.csv"))

# Body mass and flipper length are the two variables the model needs, so a
# bird missing either one is no use to us.
clean <- raw[!is.na(raw$body_mass_g) & !is.na(raw$flipper_length_mm), ]
clean$mass_kg <- to_kg(clean$body_mass_g)

clean <- clean[, c(
  "species",
  "island",
  "flipper_length_mm",
  "body_mass_g",
  "mass_kg",
  "year"
)]

write.csv(clean, here("data", "penguins.csv"), row.names = FALSE)
