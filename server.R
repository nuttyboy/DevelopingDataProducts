#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(caret)
data(swiss)

shinyServer(function(input, output) {
  #Model 1
  model1 <-  lm(Fertility~Agriculture,data=swiss)
  #Model 2
  model2 <-  lm(Fertility~Catholic,data=swiss)
  #Model 3
  model3 <-  lm(Fertility~Infant.Mortality,data=swiss)

#RMSE  
  
  modelpred <- reactive({
    
    if(input$Indi=="Agriculture") {
    RMSE(predict(model1,swiss),swiss$Fertility)
    }
    else
    if(input$Indi=="Catholic") {
      RMSE(predict(model2,swiss),swiss$Fertility)
    }
    
    else
      if(input$Indi=="Infant.Mortality") {
        RMSE(predict(model3,swiss),swiss$Fertility)
      }
  
    })
  
#Plot outputs
  output$plot <- renderPlot({
    if(input$Indi=="Agriculture") {
    plot(swiss$Agriculture,swiss$Fertility, xlab = "Agriculture(%)",ylab = "Fertility(lg)", bty = "n", pch = 16,main="Fertility ~ Agriculture")
    abline(model1,col="red")
    }
    else
      if(input$Indi=="Catholic") {
        plot(swiss$Catholic,swiss$Fertility, xlab = "Catholic(%)",ylab = "Fertility(lg)", bty = "n", pch = 16,main="Fertility ~ Catholic")
        abline(model2,col="blue")
      }
    else
      if(input$Indi=="Infant.Mortality") {
        plot(swiss$Infant.Mortality,swiss$Fertility, xlab = "Infant.Mortality(%)",ylab = "Fertility(lg)", bty = "n", pch = 16,main="Fertility ~ Infant.Mortality")
        abline(model3,col="green")
      }
    
    
  })
  
  output$pred1 <- renderText({
    modelpred()
  })
  
  
  
  })
