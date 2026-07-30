# run.R

source("main.R")

out <- data.frame(
  species = names(species_means(dat)),
  mass_kg = as.numeric(species_means(dat))
)

write.csv(out, "results.csv", row.names = FALSE)
