library(shiny)
library(ProfileLikelihood)

shinyServer(function(input, output) {
  
  x <- reactive({
    LR.pvalue(input$y1,input$y2,input$n1,input$n2,input$interval)
  })
  
  #  output$mle.lor.uncond <- renderPrint({
  #    cat(x()$mle.lor.uncond)
  #  })
  #  output$mle.lor.cond <- renderPrint({
  #    cat(x()$mle.lor.cond)
  #  })
  #  output$LI.norm.profile <- renderPrint({
  #    cat(x()$LI.norm.profile)
  #  })
  #  output$LI.norm.cond <- renderPrint({
  #    cat(x()$LI.norm.cond)
  #  })
  #  output$LR.profile <- renderPrint({
  #    cat(x()$LR.profile)
  #  })
  #  output$LR.cond <- renderPrint({
  #    cat(x()$LR.cond)
  #  })
  #  output$Pvalue.LR.profile <- renderPrint({
  #    cat(x()$Pvalue.LR.profile)
  #  })
  #  output$Pvalue.LR.cond <- renderPrint({
  #    cat(x()$Pvalue.LR.cond)
  #  })
  #  output$Pvalue.chisq.test <- renderPrint({
  #    cat(x()$Pvalue.chisq.test)
  #  })
  #  output$Pvalue.fisher.test <- renderPrint({
  #    cat(x()$Pvalue.fisher.test)
  #  })
  #  output$Pvalue.chisq.cont.correction <- renderPrint({
  #    cat(x()$Pvalue.chisq.cont.correction)
  #  })

  resultValues <- reactive({
  data.frame(
    Result = c("the maximum likelihood estimate for log odds ratio",
             "the maximum conditional likelihood estimate for log odds ratio",
             "profile likelihood support interval k=6.8 corresponding to a 95% CI",
             "conditional likelihood support interval k=6.8 corresponding to a 95% CI",
             "profile likelihood ratio",
             "conditional likelihood ratio",
             "p-value based on the profile LR statistic",
             "p-value based on the conditional LR statistic",
             "p-value from Pearson's Chi-squared test",
             "p-value from Fisher's exact test",
             "p-value from Pearson's Chi-squared test with continuity correction"),
    Value = as.character(c(round(x()$mle.lor.uncond,2),
                           round(x()$mle.lor.cond,2),
                           paste(x()$LI.norm.profile, collapse=', '),
                           paste(x()$LI.norm.cond, collapse=', '),
                           round(x()$LR.profile,2),
                           round(x()$LR.cond,2),
                           round(x()$Pvalue.LR.profile,2),
                           round(x()$Pvalue.LR.cond,2),
                           round(x()$Pvalue.chisq.test,2),
                           round(x()$Pvalue.fisher.test,2),
                           round(x()$Pvalue.chisq.cont.correction,2))),
    stringsAsFactors=FALSE)
  }) 

# Show the values using an HTML table
  output$values <- renderTable({
    resultValues()
  })

})