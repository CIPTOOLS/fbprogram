#' shiny UI element
#'
#' returns a re-usable user interface element
#'
#' @author Reinhard Simon
#' @param type of ui Element; default is a tab in a shiny dashboard
#' @param title display title
#' @param name a reference name
#' @param output name of output element
#' @export
ui_program <- function(type = "tab", title = "Breeding program configuration",
                       name = "resource_program",
                    output = "hot_program"){
  shinydashboard::tabItem(tabName = name,
          shiny::fluidRow(
            shinydashboard::box(height = 500,
              title = title,
              rhandsontable::rHandsontableOutput(output)
            )
            # ,
            # box(
            #   title = "Breeding program stage configuration",
            #   rHandsontableOutput("hot_program_stages")
            # )
          )
  )
}
