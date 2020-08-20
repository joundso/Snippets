# Cleanup the backend in RStudio:
cat("\014") # Clears the console (imitates CTR + L)
rm(list = ls()) # Clears the Global Environment/variables/data
invisible(gc()) # Garbage collector/Clear unused RAM
# Start coding now:

## Test of weighted statistics

quant <- c(.1, .25, .5, .75, .90)

age_site1 <- c(10, 24, 87, 45, 60, 41, 18, 56)
summary_site1 <- psych::describe(age_site1, quant = quant)

age_site2 <- c(74, 16, 87)
summary_site2 <- psych::describe(age_site2, quant = quant)

age_site3 <- c(12, 23, 34, 45, 75, 26)
summary_site3 <- psych::describe(age_site3, quant = quant)

age_control <- c(age_site1, age_site2, age_site3)
summary_control <- psych::describe(age_control, quant = quant)


## Combine the parameters over all sites:
statistic_params <-
  c(
    "n",
    "mean",
    "sd",
    "median",
    "min",
    "max",
    "skew",
    "kurtosis",
    "se",
    "Q0.1",
    "Q0.25",
    "Q0.5",
    "Q0.75",
    "Q0.9"
  )
all <- list()
for (param in statistic_params) {
  all[[param]] <-
    c(summary_site1[[param]], summary_site2[[param]], summary_site3[[param]])
}


## Start anlysis:
weighted <-
  list(
    "mean" = Hmisc::wtd.mean(x = all[["mean"]], weights = all[["n"]]),
    "min" = min(x = all[["min"]], na.rm = T),
    # "Q0.1" = Hmisc::wtd.mean(x = all[["Q0.1"]], weights = all[["n"]]),
    # "Q0.1" = reldist::wtd.quantile(x = all[["Q0.1"]], q = 0.1, weight = all[["n"]]),
    "Q0.1" = MetricsWeighted::weighted_quantile(x = all[["Q0.1"]], w = all[["n"]], probs = c(0.1)),
    "Q0.25" = Hmisc::wtd.quantile(x = all[["Q0.25"]], weights = all[["n"]], probs = c(0.25)),
    # "median" = Hmisc::wtd.mean(x = all[["median"]], weights = all[["n"]]),
    # "median" = reldist::wtd.quantile(x = all[["median"]], weights = all[["n"]]),
    "median" = MetricsWeighted::weighted_median(x = all[["median"]], weights = all[["n"]]),
    "sd" = Hmisc::wtd.var(x = all[["sd"]], weights = all[["n"]]),
    "Q0.75" = Hmisc::wtd.quantile(x = all[["Q0.75"]], weights = all[["n"]], probs = c(0.75)),
    "Q0.9" = Hmisc::wtd.quantile(x = all[["Q0.9"]], weights = all[["n"]], probs = c(0.9)),
    "max" = max(all[["max"]], na.rm = T),
    "skew" = 0,
    "kurtosis" = 0,
    "se" = 0
    )

## Check if the weighted stats equals the control:
for (param in names(weighted)) {
  digits <- 6
  weighted_tmp <- round(weighted[[param]], digits = digits)
  control_tmp <- round(summary_control[[param]], digits = digits)

  if (weighted_tmp == control_tmp) {
    print(paste0(
      "[",
      param,
      "] \U2714 successfully checked (",
      param,
      " = ",
      control_tmp,
      ")."
    ))
  } else{
    ## The weighted result seems not to be equal to the control, so check by hand:
    print(
      paste0(
        "\U2718 [",
        param,
        "] ",
        "(weighted) -> ",
        weighted[[param]],
        " = ",
        summary_control[[param]],
        " (<- control)?"
      )
    )
  }
}
