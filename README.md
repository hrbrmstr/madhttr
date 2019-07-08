
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
  - `tidy_response`: Turn an httr response object into a tidy data frame

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
## 1 https://rud.is/b/         200 2019-07-08 18:35:49 <list [2]> <tibble [1 × 7]> < [60,585]> <tibble [6 × 2]>
```

## madhttr Metrics

| Lang | \# Files |  (%) | LoC |  (%) | Blank lines |  (%) | \# Lines |  (%) |
| :--- | -------: | ---: | --: | ---: | ----------: | ---: | -------: | ---: |
| R    |        7 | 0.88 | 149 | 0.93 |          43 | 0.66 |      112 | 0.74 |
| Rmd  |        1 | 0.12 |  12 | 0.07 |          22 | 0.34 |       40 | 0.26 |

## Code of Conduct

Please note that this project is released with a [Contributor Code of
Conduct](CONDUCT.md). By participating in this project you agree to
abide by its terms.
