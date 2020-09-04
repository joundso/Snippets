letter_mid <- letters[13] ## = m
length_min <- 5
length_max <- 7

increment_first_and_last_letter <- function(string) {
  ## Current first letter:
  cur_f <- substr(string, 0, 1)
  ## Next first letter:
  next_f_pos <- match(cur_f, letters) + 1
  ## Only continue if the new last letter does not exeed the range of letters:
  if (next_f_pos < length(letters)) {
    next_f <- letters[next_f_pos]
    ## Next last letter:
    next_l <- letters[next_f_pos + 1]
    ## Current string without first and last letter:
    cur_short <- substr(x = string,
                        start = 2,
                        stop = nchar(string) - 1)
    ## Add new first and new last letter:
    return(paste0(next_f, cur_short, next_l))
  } else{
    return(NULL)
  }
}

add_first_and_last_letters <- function(string) {
  len_letters <- length(letters)
  res <- c()
  for (l_i in seq_along(letters)) {
    if (l_i < len_letters) {
      new_string <- paste0(letters[l_i],
                           string,
                           letters[l_i + 1])
      res <- c(res, new_string)
    }
  }
  return(res)
}

result_set <- last_set <- c(letter_mid)
len <- nchar(result_set[1])
while(len <= length_max){
  for(string in last_set){
    last_set <- add_first_and_last_letters(string)
    result_set <- c(result_set, last_set)
  }
  len <- len + 2
}

final_len <- 25+25*25+25*25*25

"schmidt" %in% result_set



## Loop throug all length-possibilities:
result_set_total <- c()
len <- length_min
while (len <= length_max) {
## Loop through all letters within this length:
result_set <- c()
for(l_i in seq_along(letters)){
  ## current letter:
  l = letters[l_i]
  ## Initialize the first name:
  if(length(result_set) == 0){
    result_set <-
      c(result_set, paste0(
        strrep(letters[1], (len - 1) / 2),
        letter_mid,
        strrep(letters[2], (len - 1) / 2)
        )
      )
  } else if (l_i < length(letters)) {
    ## Then just replace the first and last letter:
    ## Get the last name:
    last_name <- result_set[length(result_set)]
    ## Replace the first letter with the next one:
    current_name <- gsub(pattern = "^.", replacement = letters[l_i], x = last_name)
    ## Replace the last letter with the next one:
    current_name <- paste0(substr(x = current_name, start = 0, stop = nchar(current_name)-1), letters[l_i+1])
    ## Add current name to result_set:
    result_set <- c(result_set, current_name)
  }
}
## Add nameset for this length to total set:
result_set_total <- c(result_set_total, result_set)
## Inkrement the current length:
len <- len + 2
}

DIZutils::firstup(result_set_total)
