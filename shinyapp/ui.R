library(shiny)

shinyUI(
  pageWithSidebar(
    headerPanel("Predict Iris Species"),  
    
    sidebarPanel(
      p(strong("Documentation:",style="color:red"), a("Help Page",href="https://nblakhani.shinyapps.io/project/Help")),    
      h3('Please enter your inputs'),
      numericInput('sw', strong('Sepal.Width'), 3.5, min = 2, max = 4.5, step = 0.1),
      numericInput('pl', strong('Petal.Length)'), 1.5, min = 1, max = 7.0, step = 0.1),
      numericInput('pw', strong('Petal.Width)'), 0.1, min = 0.1, max = 2.5, step = 0.1),
      numericInput('sl', strong('Sepal.Length'), 5.0, min = 4.5, max = 8, step = 0.1),
      submitButton('Submit')
    ),
    mainPanel(
      h3('Prediction'),
      h4('Predicted species:'),
      verbatimTextOutput("irisSpeciesPrediction"),
      h4('Model partition tree based on classification tree model:'),
      plotOutput('tree')
    )
  )
)