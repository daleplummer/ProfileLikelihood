library(shiny)

# Define UI for dataset viewer application
shinyUI(fluidPage(
  
  # Application title.
  h3("Likelihood Ratio Statistics for 2X2 Tables"),
  h4("Choi et al. PLOS One 2015"),
  

  sidebarLayout(
    sidebarPanel(
      
      numericInput("y1", "the number of success for treatment 1", 20),
      numericInput("y2", "the number of success for treatment 2", 30),
      numericInput("n1", "the sample size for treatment 1", 50),
      numericInput("n2", "the sample size for treatment 2", 50),
      
      helpText("This calculator provides p-values based on the profile and conditional likelihood ratio (LR) statistics for 2 x 2 tables. The function also provides the profile and conditional likelihood support intervals (k=6.8) corresponding to a 95% confidence interval based on a normal approximation."), 
      helpText("For comparison purpose, p-values from Pearson's Chi-squared test, Fisher's exact test and Pearson's Chi-squared test with continuity correction are also provided."),
      
      numericInput("interval", "grid for evaluating a parameter of interest to obtain values for likelihoods (default=0.01)",0.01)
    ),


    mainPanel(
      #      h5("the maximum likelihood estimate for of ratio"),
      #      verbatimTextOutput("mle.lor.uncond"),
      #      h5("the maximum conditional likelihood estimate of odds ratio"),
      #      verbatimTextOutput("mle.lor.cond"),
      #      h5("profile likelihood support interval (k=6.8) corresponding to a 95% confidence interval based on a normal approximation"),
      #      verbatimTextOutput("LI.norm.profile"),
      #      h5("conditional likelihood support interval (k=6.8) corresponding to a 95% confidence interval based on a normal approximation"),
      #      verbatimTextOutput("LI.norm.cond"),
      #      h5("profile likelihood ratio"),
      #      verbatimTextOutput("LR.profile"),
      #      h5("conditional likelihood ratio"),
      #      verbatimTextOutput("LR.cond"),
      #      h5("p-value based on the profile LR statistic"),
      #      verbatimTextOutput("Pvalue.LR.profile"),
      #      h5("p-value based on the conditional LR statistic"),
      #      verbatimTextOutput("Pvalue.LR.cond"),
      #      h5("p-value from Pearson's Chi-squared test"),
      #      verbatimTextOutput("Pvalue.chisq.test"),
      #      h5("p-value from Fisher's exact test"),
      #      verbatimTextOutput("Pvalue.fisher.test"),
      #      h5("p-value from Pearson's Chi-squared test with continuity correction"),
      #      verbatimTextOutput("Pvalue.chisq.cont.correction"),
      
      h4("likelihood based statistics"),
      tableOutput("values1"),      
      h4("other traditional statistics"),
      tableOutput("values2")
      
      #tags$hr(),
      
      #h4(a("ProfileLikelihood Package", href="http://cran.r-project.org/web/packages/ProfileLikelihood/index.html")),
      
      #helpText("The ProfileLikelihood package provides profile likelihoods for a parameter of interest in commonly used statistical models. The models include linear models, generalized linear models, proportional odds models, linear mixed-effects models, and linear models for longitudinal responses fitted by generalized least squares. The package also provides plots for normalized profile likelihoods as well as the maximum profile likelihood estimates and the kth likelihood support intervals.")
    )
  )
))