require(shinydashboard)
require(ggplot2)
require(dplyr)
require(highcharter) 
library(readxl)
require(tidyr)
require(ggiraph)


server <- function(input, output) {  
  ##filtering sounds 
  
  
  ##playing audio
  observeEvent(input$play, { 
    
    hadi <- filter(sounds, Emotion == input$Emotion)  %>%  select(sound)
    
    insertUI(selector = "#play",
             where = "afterEnd",
             ui = tags$audio(src = as.character(hadi) , type = "audio/wav", autoplay = NA, controls = NA)
             
    )
  }
  )
  

  output$plot <- renderGirafe ({
  
    used_data <- data %>% filter(Language == input$language & acoustics == input$acoustic_parameter) ##create used data frame

    ##plot 

    gg_scatter <- ggplot(used_data, aes(x = Emotion, y = values, tooltip = Emotion, data_id = Emotion, color= Vocalization) ) + 
      geom_point_interactive(size=3)
    girafe(ggobj = gg_scatter,
           options = list(opts_selection(type = "single", only_shiny = FALSE)) )

  })
  

  
  
}