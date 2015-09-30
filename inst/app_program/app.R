library(shiny)
library(shinydashboard)
library(rhandsontable)
library(fbglobal)
library(fbprogram)

tabName <- "resource_program"

server <- function(input, output, session) {
  fbprogram::server_program(input, output, session)
}

ui <- dashboardPage(skin = "yellow",
          dashboardHeader(title = "Demo Program"),
            dashboardSidebar(
              menuItem("Resources",
                 sidebarMenu(id = "menu",
                     menuSubItem("Programs", icon = icon("crop"),
                                     tabName = tabName)
                     )
                  )
              ),
              dashboardBody(
                  tabItems(
                    fbprogram::ui_program(name = tabName)
                  )
              )
)

shinyApp(ui = ui, server = server)
