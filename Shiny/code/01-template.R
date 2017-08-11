library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", label = "Chose a number", value = "25", min = 1, max = 100),
  plotOutput("hist")
)

server <- function(input, output) {
  output$hist <- renderPlot({
    title <- paste(input$num, "Random Normal Numbers")
    hist((rnorm(input$num)), main = title)
  })
}

shinyApp(ui = ui, server = server)