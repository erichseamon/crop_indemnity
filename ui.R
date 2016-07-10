# ui.R
library(maps)
library(mapproj)
shinyUI(fluidPage(
  titlePanel("crop_indemnity"),

  
  sidebarLayout(
    sidebarPanel(
      helpText("Explore areas of crop loss related  
        to the Pacific Northwest."),



      selectInput("state",
                  label = "Choose which state to display",
                  choices = c("Idaho", "Washington",
                              "Oregon", "Montana"),
                  selected = "Washington"),

     selectInput("year",
        label = "Choose which year to display",
        choices = c("2015", "2014",
          "2013"),
        selected = "2015"),

     selectInput("month",
        label = "Choose which month to display",
        choices = c("jan", "feb",
          "mar", "apr", "may", "june", "july", "aug", "sep", "oct", "nov", "dec"),
        selected = "jan"),
     
     selectInput("commodity",
                 label = "Choose which commodity to display",
                 choices = c("jan", "feb",
                             "mar", "apr", "may", "june", "july", "aug", "sep", "oct", "nov", "dec"),
                 selected = "jan"),
    
      selectInput("var", 
        label = "Choose a variable to display",
        choices = c("Total Crop Loss by $", "Total Crop Loss by Acres"),
        selected = "Total Crop Loss by $"),
    
      sliderInput("range", 
        label = "Range of interest:",
        min = 0, max = 100, value = c(0, 100))
    ),
  
    mainPanel(plotOutput("map"))
  )
))

