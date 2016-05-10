library(shiny)

# Define UI for application that draws a histogram
shinyUI(fluidPage( #create the overall page
  
  # Application title
  titlePanel("Rice Data"),
  
  # Some helpful information
  helpText("This application creates a boxplot to show difference between",
<<<<<<< HEAD
           "Regions and Populations.  Please use the select button below to choose a trait",
=======
           "iris species.  Please use the select button below to choose a trait",
>>>>>>> 2c62fab528fc35870a857ad3e2c71e06c3806a9b
           "for plotting"),
  
  # Sidebar with a selectbutton to input which trait will be plotted
  sidebarLayout(
    sidebarPanel(
      selectInput("Trait", #the input variable that the value will go into
<<<<<<< HEAD
                  "Choose a Traits to display except (Leaf.pubescence which is in
                  a true/false (1/0) scale:",
                  numeric.traits
=======
                   "Choose a Traits to display except (Leaf.pubescence which is in
                  a true/false (1/0) scale:",
                   numeric.traits
>>>>>>> 2c62fab528fc35870a857ad3e2c71e06c3806a9b
      )
    ),
    
    
    # Show a plot of the generated distribution
    mainPanel(plotOutput("boxPlot")
    )
  )
))
