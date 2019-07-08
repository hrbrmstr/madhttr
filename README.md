
[![Travis-CI Build
Status](https://travis-ci.org/hrbrmstr/madhttr.svg?branch=master)](https://travis-ci.org/hrbrmstr/madhttr)
[![Coverage
Status](https://codecov.io/gh/hrbrmstr/madhttr/branch/master/graph/badge.svg)](https://codecov.io/gh/hrbrmstr/madhttr)
[![CRAN\_Status\_Badge](https://www.r-pkg.org/badges/version/madhttr)](https://cran.r-project.org/package=madhttr)

# madhttr

Tidy Helper Methods for Many Types of Unkempt Internet Metadata and
Content

## Description

The ‘httr’, ‘openssl’, and ‘HARtools’ packages provide methods to
retrieve rich metadata and content from internet hosts but their return
objects are quite unkempt. Methods are provided to turn these objects
into tidy data frames along with other useful helper methods which
augment functionality in these packages.

## What’s Inside The Tin

The following functions are implemented:

  - `download_file`: Download file from the Internet (cache-aware)
  - `download_ssl_cert`: Doewnload X.509 certificates
  - `GET`: GET a URL
  - `nslookup`: Lookup a hostname
  - `POST`: POST file to a server
  - `read_har`: Read HAR objects
  - `tidy_cert`: Turn an openssl downloaded SSL certificate into a tidy
    data frame
  - `tidy_har`: Tidy HAR entries
  - `tidy_response`: Turn an httr response object into a tidy data frame
  - `write_har`: Write HAR objects

## Installation

``` r
install.packages("madhttr", repos = "https://cinc.rud.is")
# or
devtools::install_git("https://git.rud.is/hrbrmstr/madhttr.git")
# or
devtools::install_git("https://git.sr.ht/~hrbrmstr/madhttr")
# or
devtools::install_gitlab("hrbrmstr/madhttr")
# or
devtools::install_bitbucket("hrbrmstr/madhttr")
# or
devtools::install_github("hrbrmstr/madhttr")
```

## Usage

``` r
library(madhttr)
library(tibble) # for printing

# current version
packageVersion("madhttr")
## [1] '0.1.0'
```

### Certifiable

``` r
tidy_cert(download_ssl_cert("r-project.org"))
## # A tibble: 4 x 9
##   subject               issuer               algorithm   signature valid_start  valid_end  self_signed alt_names pub_key
##   <chr>                 <chr>                <chr>       <I<list>> <chr>        <chr>      <lgl>       <I<list>> <I<lis>
## 1 CN=*.r-project.org,O… CN=COMODO RSA Domai… sha256With… < [256]>  Aug 16 00:0… Aug 15 23… FALSE       <chr [2]> <pubke…
## 2 CN=COMODO RSA Domain… CN=COMODO RSA Certi… sha384With… < [512]>  Feb 12 00:0… Feb 11 23… FALSE       <NULL>    <pubke…
## 3 CN=COMODO RSA Certif… CN=AddTrust Externa… sha384With… < [256]>  May 30 10:4… May 30 10… FALSE       <NULL>    <pubke…
## 4 CN=AddTrust External… CN=AddTrust Externa… sha1WithRS… < [256]>  May 30 10:4… May 30 10… TRUE        <NULL>    <pubke…
```

### Responsive

``` r
tidy_response(GET("https://rud.is/b"))
## # A tibble: 1 x 7
##   url               status_code date                headers    cookies          content     times           
##   <chr>                   <int> <dttm>              <I<list>>  <I<list>>        <I<list>>   <I<list>>       
## 1 https://rud.is/b/         200 2019-07-08 20:15:36 <list [2]> <tibble [1 × 7]> < [60,585]> <tibble [6 × 2]>
```

### HARdy

``` r
tidy_har(readRDS(system.file("extdat", "example-har.rds", package = "madhttr")))
## # A tibble: 88 x 11
##    started   total_time page_ref timings  req_url        resp_url        resp_rdrurl resp_type  resp_size status headers
##    <chr>          <int> <chr>    <I<list> <chr>          <chr>           <chr>       <chr>          <int>  <int> <I<lis>
##  1 2019-07-…        352 1        <tibble… https://rud.i… https://rud.is… ""          text/html…        NA    200 <tibbl…
##  2 2019-07-…         35 1        <tibble… https://rud.i… https://rud.is… ""          applicati…        NA    200 <tibbl…
##  3 2019-07-…         41 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
##  4 2019-07-…         62 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
##  5 2019-07-…         82 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
##  6 2019-07-…         91 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
##  7 2019-07-…         86 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
##  8 2019-07-…         93 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
##  9 2019-07-…        109 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
## 10 2019-07-…        112 1        <tibble… https://rud.i… https://rud.is… ""          text/css          NA    200 <tibbl…
## # … with 78 more rows
```

## madhttr Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines | (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | --: | -------: | ---: |
| R    |        8 | 0.89 | 204 | 0.94 |          55 | 0.7 |      128 | 0.75 |
| Rmd  |        1 | 0.11 |  13 | 0.06 |          24 | 0.3 |       43 | 0.25 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
