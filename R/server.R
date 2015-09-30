#' Server side logic
#'
#' Constructs table
#'
#' @param input shinyserver input
#' @param output shinyserver output
#' @param session shinyserver session
#' @param dom target dom element name
#' @author Reinhard Simon
#' @export
server_program <- function(input, output, session, dom="hot_program"){


  values = shiny::reactiveValues()
  setHot_program = function(x) values[[dom]] = x

  shiny::observe({
    input$saveBtn
    if (!is.null(values[[dom]])) {
      post_program_table(values[[dom]])
    }

  })

  output[[dom]] = rhandsontable::renderRHandsontable({
    if (!is.null(input[[dom]])) {
      DF = rhandsontable::hot_to_r(input[[dom]])
    } else {
      DF = get_program_table()
    }

    setHot_program(DF)

    rh <- rhandsontable::rhandsontable(DF)
    rhandsontable::hot_table(rh, highlightCol = TRUE, highlightRow = TRUE)

  })
}

