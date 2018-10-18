library(shiny)
library(stringr)
library(tm)
library(tidyverse)

shinyServer(function(input, output) {
  output$prediction <- renderPrint({
    result <- predictWord(input$inputText)
    output$sentence2 <- renderText({message})
    result
  })
  
  output$table <- renderDataTable({
    df_sample
  })
})
