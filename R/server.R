#' server_program
#'
#' Constructs table
#'
#' @param input shinyserver input
#' @param output shinyserver output
#' @param session shinyserver session
#' @param dom target dom element name
#' @param values reactive values
#' @author Reinhard Simon
#' @export
server_program <- function(input, output, session, dom="hot_program", values){
  #values = shiny::reactiveValues()
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
      DF = fbprogram::get_program_table()
    }

    if(!is.null(values[["hot_crops"]])){
      # merge crop levels
      crops <- values[["hot_crops"]]
      DF$crop_id <- as.character(DF$crop_id)
      cs_id <- as.character(crops$crop_id)

      crop_levels = unique(c(DF$crop_id, cs_id ))
      DF$crop_id <- factor(DF$crop_id, levels = crop_levels)
    }


    setHot_program(DF)

    rh <- rhandsontable::rhandsontable(DF, height = 400)
    rhandsontable::hot_table(rh, highlightCol = TRUE, highlightRow = TRUE)

  })
}

