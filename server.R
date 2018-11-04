
library(shiny)
library(datasets)
library(dplyr)

#create a column kilometers per liter - kpl
# 1 mile per galon = 0.425143707 kilometers per liter
mtcars$kpl <-with(mtcars,mpg*0.425143707)

shinyServer(function(input, output) {
  output$table <- renderDataTable({
    
    data <- transmute(mtcars, Car = rownames(mtcars), KilometersPerLiter = kpl, 
                      PetrolExpenditure = input$dis/kpl*input$cost,
                      Gearbox = am)
    data <- filter(data, PetrolExpenditure <= input$budget,Gearbox %in% input$am)
    data <- mutate(data, Gearbox = ifelse(Gearbox==0, "Automatic", "Manual"))
    data <- arrange(data, PetrolExpenditure)
    data
  })
})