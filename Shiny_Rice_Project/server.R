library(shiny)
library(ggplot2)
library(reshape2)

# Load the data here so that the app doesn't have to do it each time user selects output
load("~/Shiny_Andrew-Livingstone-Mai/data_from_Rice_lab.Rdata")

# This creates the data.pheno.mds object which we will use

####
# colnames() function shows you all the column names. Columns 10 to 46 are traits.

# Save the name of traits in this object which we can then use. We will ask user to choose one of the traits
rice_traits = colnames(data.pheno.mds)[10:46] # all the rice traits. 

# check to see which traits are quantitative. This give you a logical object. i.e TRUE or FALSE
# We want to plot only quantitative traits
is.trait.numeric = sapply(data.pheno.mds[, rice_traits], is.numeric)

# Lets subset only those traits that are TRUE i.e are quantitative
numeric.traits = is.trait.numeric[is.trait.numeric==TRUE]

# Let's get the names of those traits
numeric.traits = names(numeric.traits)

# We are going to ask user to chose one of these traits to plot



# Define server logic required to draw a boxplot
shinyServer(function(input, output) {
  
  output$boxPlot <- renderPlot({
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
