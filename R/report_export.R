#' Export list of data frames to separate excel tabs
#'
#' Supply list of data frames and export to an excel file
#' in an existing or new directory with optional timestamp
#'
#' @param tabs data frames to export
#' @param export_dest export destination
#' @param fname export file name
#' @param export_time logical. If true the current time is added to the file name
#'
#' @return none
#' @export
#' @examples
#' \dontrun{
#' report_export(list(mtcars, airquality), export_dest = "new_reports", fname = "curr_report")
#' }

report_export <- function(tabs, export_dest = "report_exports",
                          fname = "export", export_time = TRUE) {

  if(!dir.exists(glue::glue("{getwd()}/{export_dest}"))) {
    dir.create(glue::glue("{getwd()}/{export_dest}"))
  }

  if(export_time) {
    writexl::write_xlsx(x = tabs,
                        path = glue::glue("{getwd()}/{export_dest}/{fname}_\\
                                          {format(Sys.time(), '%Y-%m_%H.%M')}.xlsx"),
                        format_headers = FALSE)
  } else {
    writexl::write_xlsx(x = tabs,
                        path = glue::glue("{getwd()}/{export_dest}/{fname}.xlsx"),
                        format_headers = FALSE)
  }
}
