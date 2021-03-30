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
