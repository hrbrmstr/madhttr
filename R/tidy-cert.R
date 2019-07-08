.tidy_one_cert <- function(.x) {

  data.frame(
    subject = .x[["subject"]] %l0% NA_character_,
    issuer = .x[["issuer"]] %l0% NA_character_,
    algorithm = .x[["algorithm"]] %l0% NA_character_,
    signature = I(list(.x[["signature"]])) %l0% I(list(raw())),
    valid_start = .x[["validity"]][[1]] %l0% as.Date(NA),
    valid_end = .x[["validity"]][[2]] %l0% as.Date(NA),
    self_signed = .x[["self_signed"]] %l0% NA,
    alt_names = I(list(.x[["alt_names"]] %l0% c())),
    pub_key = I(list(.x[["pubkey"]]) %l0% list()),
    stringsAsFactors = FALSE
  )

}

#' Turn an {openssl} downloaded SSL certificate into a tidy data frame
#'
#' @param .x a certificate  list retrieved with [openssl::download_ssl_cert()] or
#'        a single `cert` object.
#' @export
#' @examples
#' tidy_cert(openssl::download_ssl_cert("rud.is"))
#' tidy_cert(openssl::download_ssl_cert("r-project.org")[[2]])
tidy_cert <- function(.x) {

  if (is.list(.x) && all(vapply(.x, inherits, FUN.VALUE = logical(1), what = "cert"))) {
    out <- do.call(rbind.data.frame, lapply(.x, .tidy_one_cert))
  } else if (inherits(.x, "cert")) {
    out <- .tidy_one_cert(.x)
  } else {
    stop("Input is not a list of certs or an individual cert.", call.=FALSE)
  }

  class(out) <- c("tbl_df", "tbl", "data.frame")
  out

}
