library(shiny)
library(markdown)

shinyUI(
  navbarPage("Data Science Project - Data Science Capstone",
             tabPanel("Shiny App",
                      sidebarLayout(
                        sidebarPanel(
                          helpText("Enter a text of maximum 3 words, and at least one word, separated by white space. The next word would be the prediction"),
                          hr(),
                          textInput("inputText", "Enter text here", value = "")
                        ),
                        mainPanel(
                          helpText("The prediction is:"),
                          verbatimTextOutput("prediction"),
                          helpText("These are some examples that you can play with"),
                          dataTableOutput('table')
                        )
                      )
             ),
             tabPanel("More Info",
                      mainPanel(
                        includeMarkdown("info.Rmd"))
             )
  )
)