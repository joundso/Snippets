# FHIR Search with POST

- [FHIR Search with POST](#fhir-search-with-post)
  - [How to use](#how-to-use)
  - [Background / Motivation](#background--motivation)
    - [The `data-test.txt` file](#the-data-testtxt-file)
  - [Further readings](#further-readings)
  - [Thanks](#thanks)

## How to use

1. Copy the [`default.env`](./default.env) to `.env` and adapt the value(s) to your needs
2. Run [`test_post.sh`](./test_post.sh)

## Background / Motivation

* With `GET` requests, the request and all sent parameters (potentially containing sensitive information) may be logged
* With `POST` FHIR-Search requests, the URL is always like `https://your-fhir-server/fhir/Patient/_search` but with all sensitive content in its body
* `GET` requests are limited in length. The body of the `POST` request isn't

### The `data-test.txt` file

Scheme:

```bash
param1=value1&param2=value2
```

## Further readings

* <https://build.fhir.org/http.html#search>
* <https://docs.microsoft.com/en-us/azure/healthcare-apis/fhir/search-samples#search-using-post>
* <http://hl7.org/fhir/http.html#search>

## Thanks

Thanks to @subfuzion for his curl gist here: <https://gist.github.com/subfuzion/08c5d85437d5d4f00e58>!