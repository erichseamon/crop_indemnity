# ui.R

shinyUI(fluidPage(
  titlePanel("crop_indemnity"),

  
  sidebarLayout(
    sidebarPanel(
      helpText("Explore areas of crop loss related  
        to the Pacific Northwest."),
    
      selectInput("var", 
        label = "Choose a variable to display",
        choices = c("Crop Indemnity", "Historical Crop Yield",
          "Temperature", "Soil Moisture"),
        selected = "Crop Indemnity"),
    
      sliderInput("range", 
        label = "Range of interest:",
        min = 0, max = 100, value = c(0, 100))
    ),
  
    mainPanel(plotOutput("map"))
  )
))

