library(shiny)
library(shinydashboard)
library(rhandsontable)
library(fbglobal)
library(fbcrops)
library(fbprogram)

tabNameC <- "resource_crop"
tabNameP <- "resource_program"

server <- function(input, output, session) {
  values = shiny::reactiveValues()
  fbprogram::server_program(input, output, session, values = values)
  fbcrops::server_crop(input, output, session, values = values)
}

ui <- dashboardPage(skin = "yellow",
          dashboardHeader(title = "Demo Program"),
            dashboardSidebar(
             sidebarMenu(id = "menu",
              menuItem("Resources",
                menuSubItem("Crops", icon = icon("crop"),
                             tabName = tabNameC),
                menuSubItem("Programs", icon = icon("crop"),
                                     tabName = tabNameP)
              )
              )
              ),
              dashboardBody(
                  tabItems(
                    fbcrops::ui_crop(name = tabNameC),
                    fbprogram::ui_program(name = tabNameP)
                  )
              )
)

shinyApp(ui = ui, server = server)
