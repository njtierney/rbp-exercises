# tests.R

source("model.R")

stopifnot(nrow(dat) > 0)
stopifnot(!any(is.na(dat$mass_kg)))
stopifnot(all(dat$mass_kg > 2 & dat$mass_kg < 7))

# this one has been failing since March
stopifnot(nrow(dat) == 344)

message("all good")
