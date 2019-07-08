#' Tidy Helper Methods for Many Types of Unkempt Internet Metadata and Content
#'
#' The 'httr', 'openssl', and 'HARtools' packages provide methods to retrieve
#' rich metadata and content from internet hosts but their return objects are quite
#' unkempt. Methods are provided to turn these objects into tidy data frames along with
#' other useful helper methods which augment functionality in these packages.
#'
#' @md
#' @name madhttr
#' @keywords internal
#' @author Bob Rudis (bob@@rud.is)
#' @import httr
#' @importFrom openssl download_ssl_cert
#' @importFrom curl nslookup
"_PACKAGE"

#' @name GET
#' @title GET a URL
#' @param url the URL of the page to retrieve
#' @param config,handle,... see [httr::GET()]
#' @export
NULL

#' @name POST
#' @title POST file to a server
#' @param url,config,body,encode,handle,... see [httr::POST()]
#' @export
NULL

#' Read HAR objects
#'
#' Snake-case re-exported alias for [HARtools::readHAR()].
#'
#' @param har a string, list/URL or a file containing JSON HAR data
#' @param ... additional arguments
#' @export
read_har <- HARtools::readHAR

#' @name nslookup
#' @title Lookup a hostname
#' @param host,ipv4_only,multiple,error see [curl::nslookup()]
#' @export
NULL

#' @name download_ssl_cert
#' @title Doewnload X.509 certificates
#' @param host,port,ipv4_only see [openssl::download_ssl_cert()]
#' @export
NULL