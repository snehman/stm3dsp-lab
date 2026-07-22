library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
      numericInput("step", "Increment/Decrement amount:", value = 1, min = 1, step = 1),
      actionButton("inc", "Increment"),
      actionButton("dec", "Decrement"),
      actionButton("reset", "Reset"),
      numericInput("amount", "Amount:", value = 1, min = 1,step = 1)
    ),
    
    mainPanel(
      h3("Current count:"),
      textOutput("count")
    )
  )
)

server <- function(input, output, session) {
  # Create reactiveVal to store the count
  count <- reactiveVal(0)
  
  # Define an observer to update count based on button clicks
  observeEvent(input$inc, {
    count(count() + input$step)
  })
  
  observeEvent(input$dec, {
    count(count() - input$step)
  })
  
  observeEvent(input$reset, {
    count(0)
  })
  
  # Render the current count
  output$count <- renderText({
    count()
  })
}

shinyApp(ui, server)





