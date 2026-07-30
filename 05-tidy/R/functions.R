# Small helpers used by more than one script in analysis/.

# Grams to kilograms, so body mass reads on a scale people think in.
to_kg <- function(grams) {
  grams / 1000
}

# Centre a predictor, so the model intercept means something.
mean_center <- function(variable) {
  variable - mean(variable, na.rm = TRUE)
}

scale_sd <- function(variable) {
  variable / sd(variable, na.rm = TRUE)
}
