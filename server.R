library(shiny)
library(ProfileLikelihood)

# Define server logic required to summarize and view the 
# selected dataset
shinyServer(function(input, output) {
  
  x <- reactive({
    LR.pvalue(input$y1,input$y2,input$n1,input$n2,input$interval)
  })
  
  output$mle.lor.uncond <- renderPrint({
    #x<-LR.pvalue(input$y1,input$y2,input$n1,input$n2,input$interval)
    cat(x()$mle.lor.uncond)
  })
  output$mle.lor.cond <- renderPrint({
    cat(x()$mle.lor.cond)
  })
  output$LI.norm.profile <- renderPrint({
    cat(x()$LI.norm.profile)
  })
  output$LI.norm.cond <- renderPrint({
    cat(x()$LI.norm.cond)
  })
  output$LR.profile <- renderPrint({
    cat(x()$LR.profile)
  })
  output$LR.cond <- renderPrint({
    cat(x()$LR.cond)
  })
  output$Pvalue.LR.profile <- renderPrint({
    cat(x()$Pvalue.LR.profile)
  })
  output$Pvalue.LR.cond <- renderPrint({
    cat(x()$Pvalue.LR.cond)
  })
  output$Pvalue.chisq.test <- renderPrint({
    cat(x()$Pvalue.chisq.test)
  })
  output$Pvalue.fisher.test <- renderPrint({
    cat(x()$Pvalue.fisher.test)
  })
  output$Pvalue.chisq.cont.correction <- renderPrint({
    cat(x()$Pvalue.chisq.cont.correction)
  })
  

#  
#  # Return the requested dataset
#  datasetInput <- reactive({
#   switch(input$dataset,
#           "rock" = rock,
#           "pressure" = pressure,
#           "cars" = cars)
#  })
#  
#  # Generate a summary of the dataset
#  output$summary <- renderPrint({
#    dataset <- datasetInput()
#    summary(dataset)
#  })
#  
#  # Show the first "n" observations
#  output$view <- renderTable({
#    head(datasetInput(), n = input$obs)
#  })
})