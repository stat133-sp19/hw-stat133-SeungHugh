#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(reshape)

# Define UI for application that draws a histogram
ui <- fluidPage(
   
   # Application title
   titlePanel("Graph and Chart for Saving & Investing Modalities"),
   
   fluidRow(
     column(4, 
            sliderInput(inputId = "amount",
                        label = "Initial Amount:",
                        min = 0,
                        max = 100000,
                        step = 500,
                        value = 1000)),
     column(4, 
            sliderInput(inputId = "rate",
                        label = "Return Rate (in %)",
                        min = 0,
                        max = 20,
                        step = 0.1,
                        value = 5)),
     column(4, 
            sliderInput(inputId = "year",
                        label = "Years",
                        min = 0,
                        max = 50,
                        step = 1,
                        value = 20))
   ),
   fluidRow(
     column(4, 
            sliderInput(inputId = "contribution",
                        label = "Annual Contribution",
                        min = 0,
                        max = 50000,
                        step = 500,
                        value = 2000)),
     column(4, 
            sliderInput(inputId = "grate",
                        label = "Growth Rate (in %)",
                        min = 0,
                        max = 20,
                        step = 0.1,
                        value = 2)),
     column(4, 
            selectInput(inputId = "facet",
                        label = "Facet?",
                        choices = c("Yes", "No"),
                        selected = "No"))
   ), 
   
    # Show a plot of the generated distribution
    mainPanel(
      h4("Timelines"),
      plotOutput("linePlot", width = "150%", height = "400"),
      h4("Balances"),
      dataTableOutput("saveTable")
    )
   
)

# Define server logic required to draw a histogram
server <- function(input, output) {
   
   output$linePlot <- renderPlot({
      mod <- modality(input$amount, input$rate / 100, input$contribution, input$grate / 100, input$year)
      mod_melted <- melt(mod[, c("year", "no_contrib", "fixed_contrib", "growing_contrib")], id.vars = 1)
      mod_melted$variable <- factor(mod_melted$variable, levels = c("no_contrib", "fixed_contrib", "growing_contrib"))
      gg <- ggplot(mod_melted, aes(x = year, y = value, colour = variable)) +
        geom_line() +
        geom_point() +
        scale_x_continuous(breaks = seq(0, input$year, input$year * 0.25)) +
        labs(x = "year", y = "value", title = "Three modes of investing")
      if (input$facet == "Yes")
        gg <- gg + geom_area(alpha = 0.5, aes(fill = variable)) + facet_grid(.~variable) + theme_bw()
      gg
   })
   
   output$saveTable <- renderDataTable({
     mod_table <- modality(input$amount, input$rate / 100, input$contribution, input$grate / 100, input$year)
     mod_table
   })
   
   
   #Functions
   future_value <- function(amount, rate, years) amount * (1 + rate)^years
   annuity <- function(contrib, rate, years) contrib * (((1 + rate)^years) - 1) / rate
   growing_annuity <- function(contrib, rate, growth, years) contrib * (((1 + rate)^years) - ((1 + growth)^years)) / (rate - growth)
   modality <- function(a, r, c, gr, y) {
     mode1 <- c()
     mode2 <- c()
     mode3 <- c()
     for (i in 0:y) {
       mode1[i + 1] <- future_value(a, r, i)
       mode2[i + 1] <- mode1[i + 1] + annuity(c, r, i)
       mode3[i + 1] <- mode1[i + 1] + growing_annuity(c, r, gr, i)
     }
     modalities <- data.frame("year" = seq(0, y),
                              "no_contrib" = mode1,
                              "fixed_contrib" = mode2,
                              "growing_contrib" = mode3)
     return(modalities)
   }
}

# Run the application 
shinyApp(ui = ui, server = server)

