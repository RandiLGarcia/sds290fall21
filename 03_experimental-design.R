staff <- c(rep("women-ft", 90), rep("women-pt", 18), rep("men-ft", 9), rep("men-pt", 63))
wage <- c(rnorm(90, mean = 25), rnorm(18, 15), rnorm(9, 22), rnorm(63, 15))
ds <- data.frame(staff, wage)
head(ds)
nrow(ds)
require(mosaic)
qplot(data = ds, x = wage, color = staff, geom = "density")
mean(~wage, data = ds)
# simple random sampling
mean(~wage, data = sample(ds, 40))
# Stratified sampling
strat_samp <- bind_rows(
  sample(filter(ds, staff == "women-ft"), 20), 
  sample(filter(ds, staff == "women-pt"), 4), 
  sample(filter(ds, staff == "men-ft"), 2), 
  sample(filter(ds, staff == "men-pt"), 14)
)
mean(~wage, data = strat_samp)
# Comparison
SRS <- do(1000) * mean(~wage, data = sample(ds, 40))
STR <- do(1000) * mean(~wage, data = bind_rows(
                                sample(filter(ds, staff == "women-ft"), 20),
                                sample(filter(ds, staff == "women-pt"), 4),
                                sample(filter(ds, staff == "men-ft"), 2),
                                sample(filter(ds, staff == "men-pt"), 14)
))
sim <- bind_rows(SRS, STR) %>%
  mutate(scheme = rep(c("simple", "statified"), each = 1000))
qplot(data = sim, x = mean, color = scheme, geom = "density")
