# server.R

library(maps)
library(mapproj)

counties <- readRDS("/srv/shiny-server/crop-indemnity/data/counties.rds")
source("/srv/shiny-server/crop-indemnity/helpers.R")

#counties <- read.csv("/agmesh-scenarios/scenario_52177/commodity/WHEAT                              .csv")

#setwd("/git/data/USDA/pdfs/")
#counties <- read.table("USDA-idemnity.txt")

shinyServer(
  function(input, output) {
    output$map <- renderPlot({
      data <- switch(input$var, 
        "Total Crop Loss by $" = counties$loss,
        "Total Crop Loss by Acres" = counties$acres)
    
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




