#' Demo application
#'
#' Builds a shinydashboard app from re-usable application elements
#'
#' @author Reinhard Simon
#' @export
run_program <- function(){
  try(
    shiny::runApp(system.file("app_program", package="fbprogram"))
  )
}
