library(shiny)

# Define UI for random distribution application 
shinyUI(fluidPage(
  
  # Application title
  titlePanel("ANOVA Demo"),
  withMathJax(),

  sidebarLayout(
    sidebarPanel( 
      sliderInput("meanC", 
                  "\\(\\mu_C\\): ",
                  value = 0,
                  step = .1,
                  min = -5, 
                  max = 5),
      sliderInput("meanB",
                  "\\(\\mu_B\\): ",
                  value = 0,
                  step = .1,
                  min = -5,
                  max = 5),
      sliderInput("meanA",
                  "\\(\\mu_A\\): ",
                  value = 0,
                  step = .1,
                  min = -5,
                  max = 5),
      sliderInput("sig",
                 "\\(\\sigma\\): ",
                  value = 5,
                  step = .1,
                  min = 0,
                  max = 10),
      sliderInput('n', '\\(n\\): ', min = 5, max = 100, value = 30, step = 5),
      actionButton("resample", label = "Draw New Samples")
    ),
    
    mainPanel(
      helpText('The red bars denote population means. The blue bars denote sample means.'),
      plotOutput('aovPlot', height = 'auto'),
      h3('ANOVA Table'),
      tableOutput('aovSummary')
    )
  )
))