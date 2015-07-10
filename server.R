library(shiny)
library(ggplot2)

# Define server logic for random distribution application
shinyServer(function(input, output) {
  
  newsamples <- reactive({
    input$resample
    xAbig <<- rnorm(100)
    xBbig <<- rnorm(100)
    xCbig <<- rnorm(100)
  })
  
  gen_data = reactive({
    n = input$n; mu1 = input$meanA; mu2 = input$meanB; mu3 = input$meanC; s = input$sig
    
    xA <- xAbig[1:n]*s + mu1
    xB <- xBbig[1:n]*s + mu2
    xC <- xCbig[1:n]*s + mu3
    
    input$resample
    
    data.frame(x = c(xA,xB,xC),
               group = rep(c("A","B","C"), each = n))
  })
  
  output$aovPlot = renderPlot({
    newsamples()
    d = gen_data()
    par(mar = c(4, 4, .1, .1), mgp = c(2.8, 1, 0), las = 1)
    plot(x ~ group, data = d, border = 'black', horizontal = TRUE, ylim = c(-25,25))
    points(group ~ x, data = d, col = rgb(0, 0, 0, .8))
    points(c(input$meanA, input$meanB, input$meanC), 1:3, pch = '|', cex = 3, col = 'red')
    points(unname(tapply(d$x,d[,2],mean)), 1:3, pch = '|', cex = 3, col = 'blue')
    abline(v=(seq(-20,20,by=5)), col="lightgray", lty="dotted",lwd=1.5)
  }, width = 600, height = 370)
  
  output$aovSummary = renderTable({
    summary(aov(x~group,data=gen_data()))
  })
    
})