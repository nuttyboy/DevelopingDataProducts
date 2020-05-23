

library(shiny)


shinyUI(fluidPage(
  
  # Application title
  titlePanel("Which is the Good Predictor of Fertility"),
  

  sidebarLayout(
        sidebarPanel(
            helpText("Have a look at swiss data using '?swiss' on Rstudio Console"),
            helpText("Here we are looking for the best predictor for Fertility using the linear regression model"),
            helpText("Below you can choose a predictor to see the respective Indicator plot and Root Mean Squeared error"),
            radioButtons(inputId="Indi",
                       label = "Indicators",
                     choices = c("Agriculture","Catholic","Infant.Mortality"),
                     inline = FALSE
        )
        
        
    ),
    
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("plot"),
      h3("The RMSE is:"),
      textOutput("pred1")
      
    )
  )
))
