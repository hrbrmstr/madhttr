.tidy_one_entry <- function(.x) {

  stopifnot(inherits(.x, "harentry"))

  if (length(.x[["timings"]])) {
    data.frame(
      stage = names(.x[["timings"]]),
      value = unlist(.x[["timings"]], use.names = FALSE),
      stringsAsFactors = FALSE
    ) -> timings
  } else {
    timings <- data.frame(stringsAsFactors = FALSE)
  }
  class(timings) <- c("tbl_df", "tbl", "data.frame")

  if (length(.x[["response"]][["headers"]])) {
    data.frame(
      name =vapply(.x[["response"]][["headers"]], `[[`, character(1), "name", USE.NAMES = FALSE),
      value = vapply(.x[["response"]][["headers"]], `[[`, character(1), "value", USE.NAMES = FALSE),
      stringsAsFactors = FALSE
    ) -> headers
  } else {
    headers <- data.frame(stringsAsFactors = FALSE)
  }
  class(headers) <- c("tbl_df", "tbl", "data.frame")

  data.frame(
    started = .x[["startedDateTime"]] %l0% NA_character_,
    total_time = .x[["time"]] %l0% NA_integer_,
    page_ref = .x[["pageref"]] %l0% NA_character_,
    timings = I(list(timings)),
    req_url = .x[["request"]][["url"]] %l0% NA_character_,
    resp_url = .x[["response"]][["url"]] %l0% NA_character_,
    resp_rdrurl = .x[["response"]][["redirectURL"]] %l0% NA_character_,
    resp_type = .x[["response"]][["content"]][["mimeType"]] %l0% NA_character_,
    resp_size = .x[["resonse"]][["bodySize"]] %l0% NA_integer_,
    status = .x[["response"]][["status"]] %l0% NA_character_,
    headers = I(list(headers)),
    stringsAsFactors = FALSE
  ) -> out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}

#' Tidy HAR entries
#'
#' Given a single `harentry` or a `harentries` list/`harlog`/`har`, return a data frame
#' with selected columns.
#'
#' @param a `harentry` or `harentries`/`harlog`/`har` object
#' @export
#' @examples
#' tidy_har(readRDS(system.file("extdat", "example-har.rds", package = "madhttr")))
tidy_har <- function(.x) {

  if (inherits(.x, "har")) {
    out <- tidy_har(.x[["log"]][["entries"]])
  } else if (inherits(.x, "harlog")) {
    out <- tidy_har(.x[["entries"]])
  } else if (inherits(.x, "harentries")) {
    out <- do.call(rbind.data.frame, lapply(.x, .tidy_one_entry))
    class(out) <- c("tbl_df", "tbl", "data.frame")
  } else if (inherits(.x, "harentry")) {
    out <- .tidy_one_entry(.x)
  } else {
    stopifnot(inherits(.x, "harentries"))
  }

  out

}
