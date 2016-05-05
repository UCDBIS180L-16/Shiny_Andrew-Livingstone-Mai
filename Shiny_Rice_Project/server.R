library(shiny)
library(ggplot2)
library(reshape2)

# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  # Expression that generates a boxplot. The expression is
  # wrapped in a call to renderPlot to indicate that:
  #
  #  1) It is "reactive" and therefore should re-execute automatically
  #     when inputs change
  #  2) Its output type is a plot
  
  output$boxPlot <- renderPlot({
    load("~/Shiny_Andrew-Livingstone-Mai/data_from_Rice_lab.Rdata")
    iris.sub <- subset(data.pheno.mds, popID == input$popID)
    # set up the plot
    pl <- ggplot(data = data.pheno.mds,
                 #Use aes_string below so that input$trait is interpreted
                 #correctly.  The other variables need to be quoted
                 aes_string(x="popID",
                            y= input$Trait,
                            fill="Region" #population compare traits in Regions
                 )
    )
    
    # draw the boxplot for the specified trait
    pl + geom_boxplot()
  })
})

