# https://shiny.rstudio.com/articles/bookmarking-modules.html

# A simple module that captializes input text
capitalizerUI <- function(id) {
  ns <- NS(id)
  wellPanel(
    h4("Text captializer module"),
    textInput(ns("txt"), "Enter text:"),
    verbatimTextOutput(ns("out"))
  )
}
capitalizerServer <- function(input, output, session) {
  output$out <- renderText({
    toupper(input$txt)
  })
}

# Main app code
ui <- function(request) {
  fluidPage(
    capitalizerUI("tc"),
    bookmarkButton()
  )
}
server <- function(input, output, session) {
  callModule(capitalizerServer, "tc")
}
shinyApp(ui, server, enableBookmarking = "url")