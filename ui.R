library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  titlePanel("LR.pvalue"),
  

  sidebarLayout(
    sidebarPanel(
      
      numericInput("y1", "the number of success for treatment 1", 20),
      numericInput("y2", "the number of success for treatment 1", 30),
      numericInput("n1", "the sample size for treatment 1", 50),
      numericInput("n2", "the sample size for treatment 2", 50),
      numericInput("interval", "grid for evaluating a parameter of interest to obtain values for likelihoods",0.01),
      
      helpText("This function provides p-values based on the profile and conditional likelihood ratio (LR) statistics for 2 x 2 tables. The function also provides the profile and conditional likelihood support intervals(k=6.8) corresponding to a 95% confidence interval based on a normal approximation. For comparison purpose, p-values from Pearson's Chi-squared test, Fisher's exact test and Pearson's Chi-squared test with continuity correction are also provided.")
    ),


    mainPanel(
      h5("the maximum likelihood estimate for log odds ratio"),
      verbatimTextOutput("mle.lor.uncond"),
      h5("the maximum conditional likelihood estimate for log odds ratio"),
      verbatimTextOutput("mle.lor.cond"),
      h5("profile likelihood support interval (k=6.8) corresponding to a 95% confidence interval based on a normal approximation"),
      verbatimTextOutput("LI.norm.profile"),
      h5("conditional likelihood support interval (k=6.8) corresponding to a 95% confidence interval based on a normal approximation"),
      verbatimTextOutput("LI.norm.cond"),
      h5("profile likelihood ratio"),
      verbatimTextOutput("LR.profile"),
      h5("conditional likelihood ratio"),
      verbatimTextOutput("LR.cond"),
      h5("p-value based on the profile LR statistic"),
      verbatimTextOutput("Pvalue.LR.profile"),
      h5("p-value based on the conditional LR statistic"),
      verbatimTextOutput("Pvalue.LR.cond"),
      h5("p-value from Pearson's Chi-squared test"),
      verbatimTextOutput("Pvalue.chisq.test"),
      h5("p-value from Fisher's exact test"),
      verbatimTextOutput("Pvalue.fisher.test"),
      h5("p-value from Pearson's Chi-squared test with continuity correction"),
      verbatimTextOutput("Pvalue.chisq.cont.correction")
      
    )
  )
))