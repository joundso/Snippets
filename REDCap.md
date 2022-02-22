# REDCap snippets

## Snippets using R

:info:

- R package to interact with REDCap: [`REDCapR`](https://github.com/OuhscBbmc/REDCapR)
- REDCap information: <https://www.project-redcap.org/>

### Assign records to a data access group (DAG)

```r
REDCapR::redcap_write(
  ds_to_write = data.table::data.table(
    record_id = c(1, 3),
    redcap_data_access_group = c("dag_2", "dag_2")
  ),
  redcap_uri = uri,
  token = token
)
```

### Get data access groups (DAGs)

```r
REDCapR::redcap_read_dag(redcap_uri = uri,
                         token = token)
#> 2 data access groups were read from REDCap in 0.8 seconds.  The http status code was 200.
#> $data
#>   data_access_group_name unique_group_name
#> 1                  dag_1             dag_1
#> 2                  dag_2             dag_2
#> 
#> $success
#> [1] TRUE
#> 
#> $status_code
#> [1] 200
#> 
#> $outcome_message
#> [1] "2 data access groups were read from REDCap in 0.8 seconds.  The http status code was 200."
#> 
#> $elapsed_seconds
#> [1] 0.8321903
#> 
#> $raw_text
#> [1] ""

REDCapR::redcap_read(redcap_uri = uri, token = token, export_data_access_groups = T)
#> The data dictionary describing 17 fields was read from REDCap in 0.5 seconds.  The http status code was 200.
#> 5 records and 1 columns were read from REDCap in 0.4 seconds.  The http status code was 200.
#> Starting to read 5 records  at 2022-02-10 14:15:53.
#> Reading batch 1 of 1, with subjects 1 through 5 (ie, 5 unique subject records).
#> 5 records and 26 columns were read from REDCap in 0.3 seconds.  The http status code was 200.
#> 
#> ── Column specification ────────────────────────────────────────────────────────
#> cols(
#>   .default = col_double(),
#>   redcap_data_access_group = col_character(),
#>   name_first = col_character(),
#>   name_last = col_character(),
#>   address = col_character(),
#>   telephone = col_character(),
#>   email = col_character(),
#>   dob = col_date(format = ""),
#>   comments = col_character(),
#>   mugshot = col_character()
#> )
#> ℹ Use `spec()` for the full column specifications.
#> $data
#>   record_id redcap_data_access_group name_first name_last
#> 1         1                    dag_1     Nutmeg  Nutmouse
#> 2         2                    dag_1     Tumtum  Nutmouse
#> 3         3                    dag_1     Marcus      Wood
#> 4         4                     <NA>      Trudy       DAG
#> 5         5                    dag_2   John Lee    Walker
#>                                   address      telephone               email
#> 1 14 Rose Cottage St.\nKenning UK, 323232 (405) 321-1111     nutty@mouse.com
#> 2 14 Rose Cottage Blvd.\nKenning UK 34243 (405) 321-2222    tummy@mouse.comm
#> 3          243 Hill St.\nGuthrie OK 73402 (405) 321-3333        mw@mwood.net
#> 4          342 Elm\nDuncanville TX, 75116 (405) 321-4444 peroxide@blonde.com
#> 5      Hotel Suite\nNew Orleans LA, 70115 (405) 321-5555  left@hippocket.com
#>          dob age sex demographics_complete height weight   bmi
#> 1 2003-08-30  11   0                     2   7.00      1 204.1
#> 2 2003-03-10  11   1                     2   6.00      1 277.8
#> 3 1934-04-09  80   1                     2 180.00     80  24.7
#> 4 1952-11-02  61   0                     2 165.00     54  19.8
#> 5 1955-04-15  59   1                     2 193.04    104  27.9
#>                                                                                                      comments
#> 1                                                                     Character in a book, with some guessing
#> 2                                                                          A mouse character from a good book
#> 3                                                                                          completely made up
#> 4 This record doesn't have a DAG assigned\n\nSo call up Trudy on the telephone\nSend her a letter in the mail
#> 5                 Had a hand for trouble and a eye for cash\n\nHe had a gold watch chain and a black mustache
#>         mugshot health_complete race___1 race___2 race___3 race___4 race___5
#> 1 mugshot-1.jpg               1        0        0        0        0        1
#> 2 mugshot-2.jpg               0        0        0        1        0        1
#> 3 mugshot-3.jpg               2        0        0        0        1        1
#> 4 mugshot-4.jpg               2        0        1        0        0        1
#> 5 mugshot-5.jpg               0        1        0        0        0        0
#>   race___6 ethnicity interpreter_needed race_and_ethnicity_complete
#> 1        0         1                  0                           2
#> 2        0         1                  0                           0
#> 3        0         0                  1                           2
#> 4        0         1                 NA                           2
#> 5        1         2                  0                           2
#> 
#> $success
#> [1] TRUE
#> 
#> $status_codes
#> [1] "200"
#> 
#> $outcome_messages
#> [1] "5 records and 26 columns were read from REDCap in 0.3 seconds.  The http status code was 200."
#> 
#> $records_collapsed
#> [1] ""
#> 
#> $fields_collapsed
#> [1] ""
#> 
#> $forms_collapsed
#> [1] ""
#> 
#> $events_collapsed
#> [1] ""
#> 
#> $filter_logic
#> [1] ""
#> 
#> $datetime_range_begin
#> [1] NA
#> 
#> $datetime_range_end
#> [1] NA
#> 
#> $elapsed_seconds
#> [1] 1.827723
```
