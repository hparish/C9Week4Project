#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define server logic required to calculate the average of chosen points
shinyServer(function(input, output) {
  
  sliderValues <- reactive({
    #store the values chosen by the user into variables
    minvar <- input$range[1]
    maxvar <- input$range[2]
    numpoints <- input$numvar 
    
    #generate the random number of points chosen and take the average
    datapt <- runif(numpoints, minvar, maxvar)
    datavg <- mean(datapt)
    
    #store the values in a data frame for access to display in the table
    data.frame(
      Name = c("You picked: ",
               "In the range of: ","The average is: "),
            Value = as.character(c(input$numvar,
                             paste(input$range, collapse = " "),
                             datavg
                             )),
      stringsAsFactors = FALSE)
    
  })
  #output the values in the table
  output$values <- renderTable({
  sliderValues()  
    })
  
})
