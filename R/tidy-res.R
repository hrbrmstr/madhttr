#' Turn an {httr} response object into a tidy data frame
#'
#' @param .x a `response` object retrieved with one of the [httr::VERB()] functions.
#' @export
#' @examples
#' tidy_response(httr::GET("https://rud.is"))
tidy_response <- function(.x) {

  `%l0%` <- function(a, b) if (length(a)) a else b

  if (length(.x[["times"]])) {
    data.frame(
      stage = names(.x[["times"]]),
      value = as.numeric(.x[["times"]]),
      stringsAsFactors = FALSE
    ) -> times
  } else {
    times <- data.frame(stringsAsFactors = FALSE)
  }
  class(times) <- c("tbl_df", "tbl", "data.frame")

  if (length(.x[["all_headers"]])) {

    lapply(.x[["all_headers"]], function(.y) {
      status <- .y[["status"]] %l0% NA_character_
      version <- .y[["version"]] %l0% NA_character_
      data.frame(
        name = c(names(.y[["headers"]]), "status", "version"),
        value = c(as.character(.y[["headers"]]), status, version),
        stringsAsFactors = FALSE
      )
    }) -> hdrs

  } else {
    hdrs <- list()
  }

  cookies <- .x[["cookies"]] %l0% data.frame(stringsAsFactors=FALSE)
  class(cookies) <- c("tbl_df", "tbl", "data.frame")

  data.frame(
    url = .x[["url"]] %l0% NA_character_,
    status_code = .x[["status_code"]] %l0% NA_integer_,
    date = .x[["date"]] %l0% as.POSIXct(NA),
    headers = I(list(hdrs)),
    cookies = I(list(cookies)),
    content = I(list(.x[["content"]] %l0% c())),
    times = I(list(times)),
    stringsAsFactors = FALSE
  ) -> out

  class(out) <- c("tbl_df", "tbl", "data.frame")

  out

}