# helpers.R

drop_missing <- function(d) {
  d[!is.na(d$body_mass_g) & !is.na(d$flipper_length_mm), ]
}

to_kg <- function(grams) {
  grams / 1000
}

species_means <- function(d) {
  tapply(d$mass_kg, d$species, mean)
}
