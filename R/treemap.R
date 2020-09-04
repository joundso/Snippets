# library
library(treemap)

label_same_mapping <- "Same mappings"
label_different_mapping <- "Differing mappings"
label_single_mapping <- "Only one mapping"

# Create data
group <-
  c(
    rep(label_different_mapping, 3),
    rep(label_same_mapping, 1),
    rep(label_single_mapping, 1)
  )
subgroup <-
  c("LOINC-zu-KM", "KM-zu-LOINC", "LOINC-zu-LOINC", "", "")
value <- c(1110, 579, 1031, 4312, 2613)
data <- data.frame(group, subgroup, value)

# Custom labels:
treemap(
  data,
  index = c("group", "subgroup"),
  vSize = "value",
  type = "index",

  fontsize.labels = c(15, 12),
  # size of labels. Give the size per level of aggregation: size for group, size for subgroup, sub-subgroups...
  fontcolor.labels = c("white", "orange"),
  # Color of labels
  fontface.labels = c(2, 1),
  # Font of labels: 1,2,3,4 for normal, bold, italic, bold-italic...
  bg.labels = c("transparent"),
  # Background color of labels
  align.labels = list(c("center", "center"),
                      c("right", "bottom")),
  # Where to place labels in the rectangle?
  overlap.labels = 0.5,
  # number between 0 and 1 that determines the tolerance of the overlap between labels. 0 means that labels of lower levels are not printed if higher level labels overlap, 1  means that labels are always printed. In-between values, for instance the default value .5, means that lower level labels are printed if other labels do not overlap with more than .5  times their area size.
  inflate.labels = F,
  # If true, labels are bigger when rectangle is bigger.

)
