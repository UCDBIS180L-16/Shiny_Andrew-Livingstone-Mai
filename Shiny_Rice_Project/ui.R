library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Data"),
  
  # Some helpful information
  helpText("This application creates a boxplot to show difference between",
           "Regions and Populations.  Please use the select button below to choose a trait",
           "for plotting"),
  
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
    mainPanel(plotOutput("boxPlot"),
              plotOutput("point")
    )
  )
)
))