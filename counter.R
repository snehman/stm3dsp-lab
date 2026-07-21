library(shiny)
# Loads the shiny package so we can use its functions (fluidPage, actionButton, etc.)

ui <- fluidPage(
  # Starts building the "front of the shop" — the visual layout of the app.
  # fluidPage() is a container that holds everything the user sees.
  
  titlePanel("Simple counter application"),
  # Displays a title/heading at the top of the app: "Simple counter application"
  
  sidebarLayout(
    # Creates a two-column layout: a sidebar on the left, main content on the right.
    
    sidebarPanel(
      # This defines what goes in the LEFT sidebar column.
      
      actionButton("inc", "Increment"),
      # Creates a clickable button. 
      # "inc" is its ID (how the server will refer to it later — input$inc).
      # "Increment" is the text displayed on the button itself.
    ),
    
    mainPanel(
      # This defines what goes in the RIGHT main column.
      
      h3("Current count:"),
      # Displays a level-3 heading (like a subtitle) saying "Current count:"
      
      textOutput("count")
      # Reserves an empty spot to display text. 
      # "count" is its ID — the server will send text here using output$count.
    )
  )
)

server <- function(input, output, session) {
  # Starts the "back room" logic. This function runs whenever inputs change,
  # and it's responsible for producing whatever goes into the outputs.
  # "session" is an extra technical argument some apps need — not used yet here.
  
  # TODO: Create reactiveVal to store the count
  # (This is where you'll add a reactiveVal() to remember the current count 
  #  even as the app keeps running — like a memory box.)
  
  # TODO: Define an observer to update count based on button clicks
  # (This is where you'll add observeEvent(input$inc, {...}) to watch the button
  #  and increase the count by 1 every time it's clicked.)
  
  # TODO: Render the current count
  # (This is where you'll add output$count <- renderText({...}) to display
  #  the current count value in the textOutput("count") spot in the UI.)
}

shinyApp(ui, server)
# This is the command that actually launches the app — it connects
# the ui and server pieces together and starts running the application.
server <- function(input, output, session) {
  # TODO: Create reactiveVal to store the count
  
  # TODO: Define an observer to update count based on button clicks
  
  # TODO: Render the current count
}
server <- function(input, output, session) {
  # TODO: Create reactiveVal to store the count
  counter <- reactiveVal(0)
  
  # TODO: Define an observer to update count based on button clicks
  
  output$count <- renderText({
    counter()
  })
}
server <- function(input, output, session) {
  # TODO: Create reactiveVal to store the count
  counter <- reactiveVal(0)
  
  observeEvent(input$inc, {
    counter(counter() + 1)
  })
  
  output$count <- renderText({
    counter()
  })
}

shinyApp(ui, server)


