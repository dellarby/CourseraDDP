library(shiny)
library(rdatamarket)


#dminit("d86902d3f92f411dad01c0f9f5726272")
#a <- dmlist("http://datamarket.com/data/set/1164/livestock-sheep#!ds=1164!a2n=2s.5g.c")
dminit("f92fa46ee2104e9c9480151880e2e3e6")
a <- dmlist("http://datamarket.com/data/set/1164/livestock-sheep#!ds=1164!a2n=2s.68.5g.2w.c")

shinyServer(
  function(input, output) {
    
    labelText <- reactive({
      paste("Year:", input$year)
    })
    
    output$caption <- renderText({
      labelText()
    })
    
    vals <- reactive({
      as.vector(t(subset(a, a$Year == input$year, select=c(Value))))/1000000
    })
    
    labels <- reactive({
      as.vector(t(subset(a, a$Year == input$year, select=c(Country.or.Area))))
    })
    
    output$SheepPlot <- renderPlot({
    barplot(vals(), names.arg = labels(), main="Number of Sheep by Country", xpd=FALSE,
            xlab="Country", ylab="In Millions",ylim=c(0,50) )
    })
    
  })