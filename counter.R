library(shiny)

ui <- fluidPage(
  titlePanel("Simple counter application"),
  
  sidebarLayout(
    sidebarPanel(
      actionButton("inc", "Increment"),
      actionButton("dec", "Decrement"),
      actionButton("reset", "Reset"),
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
    count(count() + 1)
  })
  
  observeEvent(input$dec, {
    count(count() - 1)
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



