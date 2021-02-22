
library(shiny) 
library(plotly)

shinyServer(function(input, output) {
    diamonds$caratsp <- ifelse(diamonds$carat - 2 > 0, diamonds$carat - 2, 0)
    fit <- lm(price ~ carat, data = diamonds)
    
    
    modelpred <- reactive({
      caratInput <- input$sliderCarat
      predict(fit, newdata = data.frame(carat = caratInput))
    })
   
    output$p <- renderPlot({ 
        caratInput <- input$sliderCarat
        
        plot(diamonds$carat, diamonds$price, 
             xlab = "Carat", ylab = "Price", 
             bty = "n", pch = 20,
             xlim = c(0,4), ylim = c(0,25000))
        
        if(input$showModel){
            abline(fit, col = "blue", lwd = 2)
        }
 
        legend(0, 25000, "Model Prediction", pch = 20, 
                 col = "blue", bty = "n", cex = 1.2)
           points(caratInput, modelpred(), col = "blue", pch = 20, cex = 2)
        })

        output$pred <- renderText({ 
            modelpred()
          
            })

    })
