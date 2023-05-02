# [Quarto](https://quarto.org/)

- [Quarto](#quarto)
  - [Templates](#templates)
  - [Using R code in YAML syntax](#using-r-code-in-yaml-syntax)
  - [Chunk options](#chunk-options)
  - [Multiple newlines](#multiple-newlines)
  - [Non breaking space / no linebreak in word group](#non-breaking-space--no-linebreak-in-word-group)

## Templates

- [Journal template](https://github.com/quarto-journals/article-format-template/blob/main/template.qmd)
- [Bookdown template](https://github.com/joundso/quarto-book-test/tree/master/qmd-project)

## Using R code in YAML syntax

```quote
Chunk options included this way use YAML syntax rather than R syntax for consistency with options provided in YAML front matter. You can still however use R code for option values by prefacing them with !expr. For example:
```

`#| fig-cap: !expr paste("Air", "Quality")` 

([Source](https://jthomasmock.github.io/quarto-in-two-hours/materials/03-computation-editors.html#/quarto-chunk-options-1))

## Chunk options

<https://quarto.org/docs/reference/cells/cells-knitr.html>

## Multiple newlines

```r
## Option 1 - LaTeX:
$$
\\[5\baselineskip]
$$


## Option 2 - LaTeX:
\bigskip


## Option 3 - Word/HTML:
<br />

```

## Non breaking space / no linebreak in word group

```r
&nbsp;
```
