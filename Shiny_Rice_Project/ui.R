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

regions = levels(data.pheno.mds$Region)
# We are going to ask user to chose one of these traits to plot




# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Phenotypes and Geographic Variation"),
  
  # Some helpful information
  helpText("This application creates boxplots to explore the relationship and variation within",
           "geographic region and between structured populations.  Please  choose a trait and region",
           ", and observe how the populations vary. 
           Note that phenotype data may not be available in some regions for some of the populations"),
  
  # Sidebar with a selectbutton to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      selectInput("Trait", #the input variable that the value will go into
                  "Choose a Traits to display except (Leaf.pubescence which is in
                  a true/false (1/0) scale:",
                  numeric.traits
      )
    ),
  
    sidebarLayout(
      sidebarPanel(
        selectInput("Subset",
                     "Choose a Region to display:",
                    regions
        )),
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )
)
))