
#
# This is the user-interface for predicting the miles per gallon
# based on the number of cylinders and engine displacement.
#
#
#

library(shiny)

shinyUI(pageWithSidebar(

  # Application title
  headerPanel("Miles Per Gallon Prediction based on cyl and engine displacement"),

  # Sidebar with a slider input for number of bins
  sidebarPanel(
      sliderInput("cyl",
                  "Number of cylinders:",
                  min = 4,
                  max = 8,
                  value = 4),
      sliderInput("displ",
                "Engine Displacement:",
                min = 1.6,
                max = 7.0,
                step = .1,
                value = 1.6)
  ),
  # Show a plot of the generated distribution
  mainPanel(
      h4("Number of cylinders"),
      textOutput("inputCyl"),
      h4("Engine Displacement"),
      textOutput("inputDispl"),
      h4("Predicted Miles Per Galon"),
      textOutput("predMpg")
    )
  )
)


