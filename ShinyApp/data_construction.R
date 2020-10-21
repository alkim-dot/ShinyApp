library(shinyjs)
library(rsconnect)
library(audio)
library(tuneR)
library(plotly)
library(readxl)
library(dplyr)
install.packages("rdrop2")
library(rdrop2)
setwd("C:/Users/alkim/Dropbox/ShinyEnvironment")
all_acoustics_10dimensional <- read_excel("all_acoustics_10dimensional.xlsx")
sounds <- read_excel("sounds.xlsx")


Emotion <- sounds$Emotion


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



library(tidyr)


data <- gather(all_acoustics_10dimensional, key="acoustics", value = "values", loudness_sma3_amean,
       loudness_sma3_pctlrange0_2,
       mfcc3_sma3_amean,
       F1amplitudeLogRelF0_sma3nz_amean,
       hammarbergIndexV_sma3nz_amean,
       F0semitoneFrom27.5Hz_sma3nz_percentile20.0,
       loudness_sma3_percentile50.0,
       mfcc1_sma3_amean,
       HNRdBACF_sma3nz_amean,
       F2amplitudeLogRelF0_sma3nz_amean)




