server.R

library(shiny)

server <- function(input, output) {
  
  # Return the requested dataset ----
  datasetInput <- reactive({
    switch(input$dataset,
           "data" = data)
  })

  
  # Show the first "n" observations ----
  output$view <- renderTable({
    head(datasetInput(), n = input$obs)
  })
  
  output$distPlot <- renderPlot({
    
    x    <- y
    hist(x,
         xlab = "data",
         main = "data")
    
  })
  

  
}

***************** GET PARA EXPORTAR DATOS EN LA NUBE SE EJECUTA POR CONSOLA EN R STUDIO*************************

package:datasets

data <- read.table(textConnection(getURL(
                                               "https://s3.us-east-2.amazonaws.com/basededatosappsnube/amzn.csv"
                         )), sep=",", header=FALSE)
head(data)
