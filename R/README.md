# R Snippets

- [R Snippets](#r-snippets)
  - [General](#general)
  - [Select a subset of a table](#select-a-subset-of-a-table)
  - [Regression, Machine-Learning](#regression-machine-learning)
    - [Linear](#linear)
    - [Random Forests](#random-forests)
    - [k-nearest Neighbors](#k-nearest-neighbors)
    - [Bayes](#bayes)
    - [Simple neural networks](#simple-neural-networks)
  - [Measure time](#measure-time)
  - [Install TeX](#install-tex)
  - [Clean the R environment, console and history](#clean-the-r-environment-console-and-history)
  - [Determine elements existing in two or more vectors](#determine-elements-existing-in-two-or-more-vectors)
  - [`data.table` specific stuff](#datatable-specific-stuff)
    - [Change the type of multiple columns](#change-the-type-of-multiple-columns)
    - [Copy a `data.table`s structure without its content](#copy-a-datatables-structure-without-its-content)
    - [Search and replace in all cells in a `data.table`](#search-and-replace-in-all-cells-in-a-datatable)
    - [Add multiple columns to a `data.table` using the `:=` operator](#add-multiple-columns-to-a-datatable-using-the--operator)
    - [Remove all columns with no content](#remove-all-columns-with-no-content)
    - [Assign by value/reference](#assign-by-valuereference)
    - [Keep first/n rows by group](#keep-firstn-rows-by-group)
  - [Apply CRAN checks locally to current package](#apply-cran-checks-locally-to-current-package)
  - [Xaringan (Presentations with R)](#xaringan-presentations-with-r)
    - [Some public templates](#some-public-templates)
    - [Formatting slides](#formatting-slides)
    - [`class`es](#classes)
    - [`background-image`](#background-image)
  - [CRAN releases](#cran-releases)
  - [Quarto](#quarto)
  - [Inspect a `data.table` or `data.frame` object](#inspect-a-datatable-or-dataframe-object)
  - [Special characters](#special-characters)
  - [Split vector `x` in chunks](#split-vector-x-in-chunks)
    - [... with maximum chunksize `max_size`](#-with-maximum-chunksize-max_size)
    - [... of `n` equal-sized chunks](#-of-n-equal-sized-chunks)

## General

Some basic hints in the beginning:

- Use `data.table` instead of `data.frame` due to performance reasons. See [here](https://www.geeksforgeeks.org/data-table-vs-data-frame-in-r-programming/) for more details.
- Use explicit function names from packeges in the way `package::function(param)` instead of importing the whole package into the namespace. If you import a lot of packages and its functions, unintended side-effects might occur like two functions with the same name overwriting each other silently.

## Select a subset of a table

```R
## This selects the column 1 to 10 from the data:
subset(data, age < 25, select = 1:10)
```

Or (using `data.table`):

```R
cols <- c("colname1", "colname2")
testdata[testdata$colname3 < 40, cols]
```

## Regression, Machine-Learning

### Linear

```R
linear_model <- lm(weight ~ height)
```

### Random Forests

```R
rf_model <- randomForest(weight ~ height)
rf_model2 <- CoreModel(weight ~ heigth, model="rf")
```

### k-nearest Neighbors

```R
knn_model <- CoreModel(weight ~ heigth, model="knn")
```

### Bayes

```R
bayes_model <- CoreModel(weight ~ heigth, model="bayes")
bayes_model2 <- NaiveBayes(weight ~ .)
```

### Simple neural networks

```R
nnet.model <- nnet(weight ~ ., size=10)
```

## Measure time

```R
# Start the clock!
ptm <- proc.time()

# Do stuff here

# Stop the clock
proc.time() - ptm
```

## Install TeX

```R
tinytex::install_tinytex(force = T)
```

## Clean the R environment, console and history

```R
# Cleanup the backend in RStudio:
cat("\014") # Clears the console (imitates CTR + L)
rm(list = ls()) # Clears the Global Environment/variables/data
invisible(gc()) # Garbage collector/Clear unused RAM
# Start coding now:
print("Hello world! =)")
```

Or:

```R
# install.packages("cleaR")
cleaR::clear()
```

## Determine elements existing in two or more vectors

```R
v1 <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 1, 2, 3)
v2 <- c(2, 3, 4, 2, 3)
v3 <- c(1, 1, 1, 2, 2, 2, 9, 4)

Reduce(intersect, list(v1, v2, v3))
## Result:
# [1] 2 4
```

## `data.table` specific stuff

### Change the type of multiple columns

```R
data <- data.table::data.table(a = 1:1e5,
                               b = sample(x = LETTERS, size = 1e5, replace = TRUE))

test_set <- function(data, colnames) {
  for (col in colnames) {
    data.table::set(x = data,
                    j = col,
                    value = as.character(data[[col]]))
  }
  return(data)
}

test_lapply <- function(data, colnames) {
  return(data[, lapply(.SD, as.character), .SDcols = colnames])
}

microbenchmark::microbenchmark(test_set(data = data, colnames = c("a", "b")),
                               test_lapply(data = data, colnames = c("a", "b")))
```

In short: I often use `dt <- dt[, lapply(.SD, as.character), .SDcols = c("colname1", "colname2")]`.

### Copy a `data.table`s structure without its content

```R
data <- data.table::data.table(a = 1:10,
                               b = sample(x = LETTERS, size = 10, replace = TRUE))

data_structure <- data[0, ]
# > data_structure
# Empty data.table (0 rows and 2 cols): a,b
```

### Search and replace in all cells in a `data.table`

``` r
dt <- data.table::data.table(
  c1 = c(1, 2, 3, 4, 5, 6, 7, 8, 9),
  c2 = c(3, 4, 5, 6, 7, 8, 9, 1, 2),
  c3 = c(5, 6, 7, 8, 9, 1, 2, 3, 4)
)
dt
#>    c1 c2 c3
#> 1:  1  3  5
#> 2:  2  4  6
#> 3:  3  5  7
#> 4:  4  6  8
#> 5:  5  7  9
#> 6:  6  8  1
#> 7:  7  9  2
#> 8:  8  1  3
#> 9:  9  2  4

## Option 1: 
## Change all cells containing '2' as value to 'NA'
for (col in names(dt)) {
  data.table::set(
    x = dt,
    i = which(dt[[col]] == 2),
    j = col,
    value = NA
  )
}
dt
#>    c1 c2 c3
#> 1:  1  3  5
#> 2: NA  4  6
#> 3:  3  5  7
#> 4:  4  6  8
#> 5:  5  7  9
#> 6:  6  8  1
#> 7:  7  9 NA
#> 8:  8  1  3
#> 9:  9 NA  4

## Option 2 (thanks to @kapsner):
## Change all cells containing '3' as value to 'NA'
dt[dt == 3] <- NA
dt
#>    c1 c2 c3
#> 1:  1 NA  5
#> 2: NA  4  6
#> 3: NA  5  7
#> 4:  4  6  8
#> 5:  5  7  9
#> 6:  6  8  1
#> 7:  7  9 NA
#> 8:  8  1 NA
#> 9:  9 NA  4
```

<sup>Created on 2022-01-19 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Thanks to [@kapsner](https://github.com/kapsner/) for the inspiration of option 2! :+1:

### Add multiple columns to a `data.table` using the `:=` operator

```r
dt <- data.table::data.table(c1 = c(1, 2, 3),
                             c2 = c(3, 4, 5),
                             c3 = c(5, 6, 7))
dt
#>    c1 c2 c3
#> 1:  1  3  5
#> 2:  2  4  6
#> 3:  3  5  7


## Option 1:
dt[, c("newcol_1", "newcol_2") := list("value_for_col_1", "value_for_col_2")]
dt
#>    c1 c2 c3        newcol_1        newcol_2
#> 1:  1  3  5 value_for_col_1 value_for_col_2
#> 2:  2  4  6 value_for_col_1 value_for_col_2
#> 3:  3  5  7 value_for_col_1 value_for_col_2


## Option 2:
dt[, `:=`(avg = mean(c1),
          med = median(c1),
          min = min(c1))]
dt
#>    c1 c2 c3        newcol_1        newcol_2 avg med min
#> 1:  1  3  5 value_for_col_1 value_for_col_2   2   2   1
#> 2:  2  4  6 value_for_col_1 value_for_col_2   2   2   1
#> 3:  3  5  7 value_for_col_1 value_for_col_2   2   2   1
```

<sup>Created on 2021-09-15 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

### Remove all columns with no content

:bulb: Corresponding to a comment [on Stack Overflow](https://stackoverflow.com/a/64759996/13890903):

```r
dt <- data.table::data.table(
  col_1 = c(1,2,3),
  col_2 = NA,
  col_3 = NA,
  col_4 = c(9,8,7)
)
dt
#>    col_1 col_2 col_3 col_4
#> 1:     1    NA    NA     9
#> 2:     2    NA    NA     8
#> 3:     3    NA    NA     7

names_of_empty_cols <- dt[, names(which(sapply(.SD, function(x) all(is.na(x)))))]
# or
# names_of_empty_cols <- dt[, names(which(!colSums(!is.na(.SD))))]
names_of_empty_cols
#> [1] "col_2" "col_3"

dt[, (names_of_empty_cols) := NULL]
dt
#>    col_1 col_4
#> 1:     1     9
#> 2:     2     8
#> 3:     3     7
```

<sup>Created on 2021-11-04 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

### Assign by value/reference

``` r
dt <- data.table::data.table(
  a = c(1:4),
  b = c(1:4),
  c = c(1:4)
)

(colnames_dynamic <- names(dt))
#> [1] "a" "b" "c"
(colnames_static <- rlang::duplicate(names(dt)))
#> [1] "a" "b" "c"

## Add new colum to dt:
dt[, "x" := c(11:14)]

## `colnames_dynamic` now also changed (assigned by reference):
colnames_dynamic
#> [1] "a" "b" "c" "x"

## `colnames_dynamic` is still unchanged (assigned by value):
colnames_static
#> [1] "a" "b" "c"
```

<sup>Created on 2022-01-12 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

### Keep first/n rows by group

``` r
(dx <-
  data.frame(
    ID = factor(c(1, 1, 2, 2, 3, 3)),
    AGE = c(30, 30, 40, 40, 35, 35),
    FEM = factor(c(1, 1, 0, 0, 1, 1))
  ))
#>   ID AGE FEM
#> 1  1  30   1
#> 2  1  30   1
#> 3  2  40   0
#> 4  2  40   0
#> 5  3  35   1
#> 6  3  35   1

dxt <- data.table::data.table(dx, key='ID')
dxt[, .SD[1,], by=ID]
#>    ID AGE FEM
#> 1:  1  30   1
#> 2:  2  40   0
#> 3:  3  35   1
```

<sup>Created on 2022-01-18 by the [reprex package](https://reprex.tidyverse.org) (v2.0.1)</sup>

Source: <https://stats.stackexchange.com/a/7886>

## Apply CRAN checks locally to current package

```r
rcmdcheck::rcmdcheck(args = "--as-cran")
```

## Xaringan (Presentations with R)

### Some public templates

| Title | Slides | Code |
|---|---|---|
|Xaringan example - RU template| [Slides](https://www.jvcasillas.com/ru_xaringan/slides/index.html#1) | [Code](https://github.com/jvcasillas/ru_xaringan/blob/master/slides/index.Rmd) |
<!-- | Title | [Slides](url) | [Code](url) | -->

### Formatting slides

| Action | Command |
|---|---|
|C

### `class`es

The classes available for **vertically** aligning text are:

- `top` (default)
- `middle`
- `bottom`

The classes available for **horizontally** aligning text are:

- `left` (default)
- `center`
- `right`

Other classes:

- `inverse` (inverse colors - black background and white font)

([Source](https://github.com/gnab/remark/wiki/Formatting#whole-slide-text-alignment))

### `background-image`

```yaml
background-image: url(image.jpg)`
background-position: center;
background-repeat: no-repeat;
background-size: contain/cover;
```

## CRAN releases

```r
## Apply CRAN checks to local package before submitting to CRAN:
rcmdcheck::rcmdcheck(args = "--as-cran")

## Submit to CRAN:
devtools::submit_cran()
```

## Quarto

:info: See here: `[../quarto.md](../quarto.md)`

## Inspect a `data.table` or `data.frame` object

```r
dt |> skimr::skim()
```

## Special characters

```qmd
## Protected space:
&#160;

## Registered trademark (r):
&#174;
```

## Split vector `x` in chunks

([Source](https://stackoverflow.com/questions/3318333/split-a-vector-into-chunks))

### ... with maximum chunksize `max_size`

```r
split(x, ceiling(seq_along(x)/max_size))
```

### ... of `n` equal-sized chunks

```r
split(x, cut(seq_along(x), n, labels = FALSE))
```
