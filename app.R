#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#
library(tidyverse)
library(aws.s3)
library(caret)
library(e1071)
library(class)
library(dplyr)
library(plotly)
library(ggthemes)
library(car)



# Define UI for data upload app ----
ui <- fluidPage(
  
  
  # App title ----
  titlePanel("Case Study 2 Shiny App"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      fileInput("file", "Choose CSV File",
                multiple = TRUE,
                accept = c("text/csv",
                           "text/comma-separated-values,text/plain",
                           ".csv")),
      
      radioButtons("radio2", label = h3("Choose Explanatory Variables"),
                   choices = list("Age" = 1, "JobRole" = 2,"DistanceFromHome" =3, "TotalWorkingYears" = 4,"YearsAtCompany" = 5), 
                   selected = 1),
      
      hr(),
      fluidRow(column(3, verbatimTextOutput("value")))
      
    ),
    
    
    
    # Main panel for displaying outputs ----
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Histogram ----
      plotOutput(outputId = "distPlot"),
      verbatimTextOutput("summary")
    )
    
  )
)


# Define server logic required to draw a histogram ----
server <- function(input, output) {
  
  
  
  #FIRST PLOT AREA
  
  
  output$distPlot <- renderPlot({
    
    data <- read.csv(input$file$datapath, header = TRUE)
    
    attrition_plot = ggplot(data = data ,aes(x=Attrition,fill = Attrition)) + geom_bar() + theme_wsj()
    
    if(input$radio2 == 1){
      attrition_plot + facet_wrap(~Age)
      
    }
    
    else if(input$radio2 == 2){
      attrition_plot + facet_wrap(~JobRole)
    }
    else if(input$radio2 == 3){
      attrition_plot + facet_wrap(~DistanceFromHome)
    }
    else if(input$radio2 == 4){
      attrition_plot + facet_wrap(~TotalWorkingYears)
    }
    else if(input$radio2 == 5){
      attrition_plot + facet_wrap(~YearsAtCompany)
    }
    
    
  })
  
  
  
}





shinyApp(ui, server)
