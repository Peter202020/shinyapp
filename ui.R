library(shiny)
library(markdown)

shinyUI(fluidPage(
  titlePanel(title = "Select a car based on your distance and budget for the trip"),
 
  
#creating a side bar options for interaction with the data set 'mtcars'
  sidebarLayout(position = "left",
      sidebarPanel(("Enter the required parameters"),
          sliderInput("dis", "Distance (in km):", min = 0, max = 3000, value=50, step = 10,animate = TRUE),
          sliderInput("cost", "Petrol Price (in Euro per liter):",min = 1.2, max = 1.4, step = 0.005,"1.3"),
          numericInput("budget", "Budget for the trip (in Euro):", 50),
          checkboxGroupInput("am", "Gearbox:", c("Automatic"=0, "Manual"=1), selected = c(0,1))
      ),

#displaying the output - a table with results based on input from customer      
      mainPanel(
        tabsetPanel(type="tab",
                    tabPanel("Suitable cars",
                          dataTableOutput("table")),
                    
                    tabPanel("Help",
                          paste("Use the input interface on the left side to select a car from the offer based on your budget and distance you want to travel. One further criterion, the petrol price can also play a role in the selection process. In case you have a preference when it comes to a gearbox, mark it there as well.")   
                             
                             ))))))
