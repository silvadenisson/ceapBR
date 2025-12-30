#' senate
#'
#' @param year Valid options are 2008 to corrent.
#'
#' @export

senate <- function(year){

  if (nchar(year) != 4 || as.numeric(year) < 2008) {
    stop("Invalid year: must be 4 digits and cannot be before 2008.")
  }

  if(!curl::has_internet()) {
    stop("Internet connection required to download the dataset.")
  }

  message("Processing the data...")

  dados <- data.table::fread(paste0("https://adm.senado.gov.br/adm-dadosabertos/api/v1/senadores/despesas_ceaps/", year, "/csv"),
                             showProgress = FALSE,
                             tmpdir = tempdir())
  message("Done.\n")
  return(dados)

}
