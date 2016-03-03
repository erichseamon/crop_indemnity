# server.R

library(maps)
library(mapproj)
counties <- read.table("data/USDA-indemnity.txt")

#setwd("/git/data/USDA/pdfs/")
#counties <- read.table("USDA-idemnity.txt")
source("helpers.R")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      data <- switch(input$var, 
        "Crop Indemnity" = counties$X4,
        "Percent Black" = counties$X8,
        "Percent Hispanic" = counties$X8,
        "Percent Asian" = counties$X8)
    
     color <- switch(input$var, 
        "Crop Indemnity" = "darkgreen",
        "Percent Black" = "black",
        "Percent Hispanic" = "darkorange",
        "Percent Asian" = "darkviolet")
    
      legend <- switch(input$var, 
        "Crop Indemnity" = "% crop losss ($)",
        "Percent Black" = "% Black",
        "Percent Hispanic" = "% Hispanic",
        "Percent Asian" = "% Asian")
  
      percent_map(var = data, 
        color = color, 
        legend.title = legend, 
        max = input$range[2], 
        min = input$range[1])
    })
  }
)




