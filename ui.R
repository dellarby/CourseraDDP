library(shiny)
shinyUI(pageWithSidebar(
  headerPanel("Comparison of Sheep Populations Over Time"),
  sidebarPanel(
    
    sliderInput("year", "Please Select a Year:", 
                min=1962, max=2007, value=1990)
    
    ),
  mainPanel(
    h4(textOutput("caption")),
    plotOutput("SheepPlot")
    )
  ))