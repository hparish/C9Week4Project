#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Random Variable Mean emulator"),
  
  # Sidebar with a slider input for number of bins 
  sidebarLayout(
    sidebarPanel(
      # Input: Single number of variables to average----
       sliderInput("numvar",
                   "Number of data points you want to average:",
                   min = 1,
                   max = 1000,
                   value = 30),
       
       # Input: Specification of range within an interval ----
       sliderInput("range", "Range of those data points that will be randomly generated:",
                   min = 1, max = 1000,
                   value = c(200,500))
       
    ),
    
    # Show a table of the values chosen and the final average
    mainPanel(
       tableOutput("values")
     
    )
  )
))
