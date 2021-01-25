tmp1 <- c(1, 2, 3, 4, 2, 5, 2, 4, 6)
tmp2 <- duplicated(tmp1)

print(paste0(
  "There are ",
  length(tmp2[tmp2 == T]),
  " duplicates in the input. These are: '",
  paste(tmp1[tmp2], collapse = ", "),
  "'."
))
