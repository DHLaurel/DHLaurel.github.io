#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)
library(dplyr)


# # Define UI for application that draws a histogram
# fluidPage(
# 
#     # Application title
#     titlePanel("Old Faithful Geyser Data"),
# 
#     # Sidebar with a slider input for number of bins
#     sidebarLayout(
#         sidebarPanel(
#             sliderInput("bins",
#                         "Number of bins:",
#                         min = 1,
#                         max = 50,
#                         value = 30)
#         ),
# 
#         # Show a plot of the generated distribution
#         mainPanel(
#             plotOutput("distPlot")
#         )
#     )
# )


# Load data
brew_dat <- read.csv("./Breweries.csv")

# Define UI
fluidPage(
  p("Back home: ",
    a("https://dhlaurel.github.io/Projects.html", "", target="_blank")),
  titlePanel("Beer Data Explorer"),
  sidebarLayout(
    sidebarPanel(
      fileInput("data_file", label = "Upload data file (.csv)"),
      selectInput("State", label = "Select a state", 
                  choices = c("All", unique(brew_dat$State))),
      radioButtons("plot_type", label = "Select a plot type", 
                   choices = c("Histogram" = "hist", "Boxplot" = "box")),
      checkboxInput("show_lm", label = "Show linear regression line", value = FALSE)
    ),
    mainPanel(
      plotOutput("ibu_plot"),
      plotOutput("abv_plot"),
      plotOutput("ibu_abv_plot"),
      plotOutput("additional_plot"),
      plotOutput("final_plot")
    )
  )
)
