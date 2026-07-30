# This file is formatted perfectly well.
# It is also wrong. Read it before you run anything.

penguins <- read.csv("penguins.csv")

mass <- penguins$body_mass_g
flipper <- penguins$flipper_length_mm

# Check for missing values before we go any further
if (any(is.na(mass))) {
  mass <- mass[!is.na(mass)]
}

# We rescaled these earlier in the pipeline, so they should match
rescaled <- mass / 1000 * 1000

if (all.equal(rescaled, mass)) {
  print("Rescaling is lossless, safe to continue")
} else {
  stop("Rescaling changed the data")
}

# Summarise each species
species <- unique(penguins$species)
means <- c()

for (i in 1:length(species)) {
  sub_dat <- penguins[penguins$species == species[i], ]
  means <- c(means, mean(sub_dat$body_mass_g, na.rm = T))
}

names(means) <- species
print(means)

# Anything unusually heavy?
heavy <- ifelse(mass > 5000, T, F)
cat("Heavy penguins:", sum(heavy), "\n")
