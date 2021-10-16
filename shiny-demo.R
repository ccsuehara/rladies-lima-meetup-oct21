## Haciendo  una shiny app básica. Tomado de los materiales de enseñanza oficiales de shiny app:
# Por favor encuentra los materiales aquí: https://github.com/rstudio-education/shiny.rstudio.com-tutorial

library(shiny)
library(shinythemes)
ui <- fluidPage(
  #theme = shinytheme("cyborg"),  # Aquí le agregamos un theme, si es de nuestro agrado
  
  #h1("Vamos a hacer una shiny app!"), #Aquí podemos insertar elementos html, como un título, en nuestra shiny app. 
  sliderInput(inputId = 'num',
              label = 'Choose a number',
              value = 25,  min = 1, max = 100),
  plotOutput("hist")
)

server <- function(input, output){
  # output$hist <- renderPlot({hist(rnorm(100))
  # })
  output$hist <- renderPlot({
    hist(rnorm(input$num))
    
  })
}
  
shinyApp(ui = ui, server = server)
