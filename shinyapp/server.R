library(shiny)
data(iris)
library(rattle)
library(caret)
library(rpart.plot)

fit <- train(Species ~ ., method="rpart", data=iris)

shinyServer(
  function(input, output) {
    output$irisSpeciesPrediction<-renderText({
      userInput <-data.frame(input$sw,input$pl,input$pw,input$sl)
      names(userInput)<-c("Sepal.Width","Petal.Length","Petal.Width","Sepal.Length")
      levels(iris$Species)[predict(fit,newdata=userInput)]
    })
    output$tree <- renderPlot({          
      fancyRpartPlot(fit$finalModel)                                       
    })
  }
)



