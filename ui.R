# Prediction Carat

library(shiny) 
library(plotly)


shinyUI(fluidPage(
    titlePanel("Predict Price from Carat Size"), 
    sidebarLayout(
        sidebarPanel(
            sliderInput("sliderCarat", "What is the Carat size?", 0, 4, value = 2),
            checkboxInput("showModel", "Show/Hide Prediction Model", value = TRUE),

        ),
        mainPanel(
            plotOutput("p"),
            h3("Predicted Price:"), 
            textOutput("pred"),

        )
    )
))
