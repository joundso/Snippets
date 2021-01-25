## See docu: https://ggplot2.tidyverse.org/reference/geom_boxplot.html#examples
## Search for "It's possible to draw a boxplot with your own computations if you"

y <- rnorm(100)
df <- data.frame(
  x = 1,
  y0 = min(y),
  y25 = quantile(y, 0.25),
  y50 = median(y),
  y75 = quantile(y, 0.75),
  y100 = max(y)
)
ggplot2::ggplot(df, ggplot2::aes(x)) +
  ggplot2::geom_boxplot(ggplot2::aes(
    ymin = y0,
    lower = y25,
    middle = y50,
    upper = y75,
    ymax = y100
  ),
  stat = "identity")