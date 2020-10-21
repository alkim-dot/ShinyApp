##required packages.

library(shinydashboard)
require(shiny)
require(highcharter)
require(audio)
require(tuneR)
require(ggiraph)
##there is two input, language: Dutch, Chinese, acoustic parameter: 10 different, 

language <- c("Dutch", "Chinese") 
acoustic_parameter <- c("loudness_sma3_amean",
                        "loudness_sma3_pctlrange0-2",
                        "mfcc3_sma3_amean",
                        "F1amplitudeLogRelF0_sma3nz_amean",
                        "hammarbergIndexV_sma3nz_amean",
                        "F0semitoneFrom27.5Hz_sma3nz_percentile20.0",
                        "loudness_sma3_percentile50.0",
                        "mfcc1_sma3_amean",
                        "HNRdBACF_sma3nz_amean",
                        "F2amplitudeLogRelF0_sma3nz_amean")

Emotion <- sounds$Emotion


dashboardPage(
  #defines header of dashboard
  skin = "red",
  dashboardHeader(
    title="Shiny Project Deneme" ,
    dropdownMenu()
  ),
  
  ##define sidebar 
  dashboardSidebar(
    sidebarMenu(
      menuItem("Dashboard", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("About", tabName = "about", icon = icon("th")),
      menuItem("Project",tabName="unions",icon=icon("signal"))
      
    )
  ),
  ##defines body
  
  dashboardBody(
    tags$head(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css")
    ),
    
    #First TAB Menu-Dashboard  
    tabItem(tabName = "dashboard",
            
            
            fluidRow(
             
              column(12,
                     box(selectInput("Emotion", label  = "Emotion", choices = Emotion))),
              
              actionButton("play", "Play the Audio"),
              
              column(12,
                     box(selectInput("language", label = "Language", choices = language))),
              column(12,
                     box(selectInput("acoustic_parameter", label = "acoustic parameter", choices = acoustic_parameter))),
              
              column(12,
                     
                     box(
                       
                       girafeOutput("plot"),
                       
                        width="12") #end of the box
              ), #close the column
              
          hr(),
          h4("Plot of the these Project", align = "center"),
          br(),
          column(12, 
                 
                 box(
                   highchartOutput("hc2"), width=12
                 ))
            ), ## close the row 
          
          h4("First trial", strong("Alkim Karakurt")), 
          
    ), # close the first tab item 
    
    #second tab menu 
      tabItem(tabName = "about", 
              fluidPage(
      br(),
      br(),
      box(width = 12, height = "300px",
          p(style ="font-size:18px", strong("Center for Data Science"), "Project Type"),
          
          ) #close box
              ) #close fluid
      ), #close tab item
      
      
  )
  
)


      
    
  
