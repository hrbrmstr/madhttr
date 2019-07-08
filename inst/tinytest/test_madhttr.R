library(madhttr)

x1 <- tidy_cert(download_ssl_cert("r-project.org"))
expect_true(inherits(x1, "data.frame"))
expect_true(nrow(x1) == 4)
expect_true(
  all(colnames(x1) %in% c(
    "subject", "issuer", "algorithm", "signature", "valid_start",
    "valid_end", "self_signed", "alt_names", "pub_key")
  )
)

x2 <- tidy_response(GET("https://rud.is/b"))
expect_true(inherits(x2, "data.frame"))
expect_true(nrow(x2) == 1)
expect_true(
  all(colnames(x2) %in% c("url", "status_code", "date", "headers", "cookies", "content", "times"))
)

x3 <- tidy_har(readRDS(system.file("extdat", "example-har.rds", package = "madhttr")))
expect_true(inherits(x3, "data.frame"))
expect_true(nrow(x3) == 88)
expect_true(
  all(colnames(x3) %in% c(
    "started", "total_time", "page_ref", "timings", "req_url", "resp_url",
    "resp_rdrurl", "resp_type", "resp_size", "status", "headers"
  ))
)
