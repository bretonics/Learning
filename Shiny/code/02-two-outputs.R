# 02-two-outputs

library(shiny)

ui <- fluidPage(
  sliderInput(inputId = "num", 
    label = "Choose a number", 
    value = 25, min = 1, max = 100),
  plotOutput("hist"),
  verbatimTextOutput("stats")
)

server <- function(input, output) {
  dist <- reactive( {rnorm(input$num)} )
  
  output$hist <- renderPlot({
    hist(dist())
  })
  output$stats <- renderPrint({
    summary(dist())
  })
}

shinyApp(ui = ui, server = server)