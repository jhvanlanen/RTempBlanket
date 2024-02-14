
library(shiny)
library(shinythemes)



ui <- fluidPage( 
  theme = shinytheme("yeti"),
  tags$style(HTML('.js-irs-0 .irs-single, .js-irs-0 .irs-bar-edge, .js-irs-0 .irs-bar {
                                                  background: #eeeeee;
                                                  border-top: 1px solid #cccccc ;
                                                  border-bottom: 1px solid #cccccc ;}

                            /* changes the colour of the number tags */
                           .irs-from, .irs-to, .irs-single { background: #eeeeee }')),
  verticalLayout(
  titlePanel("Make yourself a birth year temperature blanket"),
  wellPanel(
    sliderInput("year", "What year were you born?", 1923, 2023,
                value = 1995, step = 1, sep = "")
  )
 )
)
  
server <- function(input, output, server) {
#  output$plot1 <- renderPlot({
#    plot() # temp plot
#  })
}

shinyApp(ui, server)



























