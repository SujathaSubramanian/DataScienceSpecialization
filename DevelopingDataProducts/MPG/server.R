#
# Given number of cylinders for a car and engine displacement value,
# miles per gallon(fuel efficiency) for the car is predicted using 
# a linear model for prediction.

library(shiny)
library(ggplot2)

fitlm = lm(cty ~ cyl + displ,data=mpg)

shinyServer(function(input, output) {
  
  output$inputCyl <- renderPrint({input$cyl})
  output$inputDispl <- renderPrint({input$displ})
  output$predMpg <- renderPrint({

    newdata = data.frame(cyl = input$cyl,displ=input$displ)
    predict(fitlm,newdata)

  })
})

