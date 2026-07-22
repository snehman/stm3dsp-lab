library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
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
    count(count() + input$amount)
  })
  
  observeEvent(input$dec, {
    count(count() - input$amount)
  })
  
  # Render the current count
  output$count <- renderText({
    count()
  })
}

shinyApp(ui, server)



