# source('xrd_plot.R')
# setwd("~/GoogleDrive/1_CMU/0_Research/XRD")
# file = 'Simple Sum_1_Katrina-MnO2training2.csv'
# xrd_plot(file)

xrd_plot <- function(file){
  df <- read.csv(file = file, stringsAsFactors = F, na.strings="NA",row.names=NULL, header = T, sep = ",")
  metadata <- df[1:30,]
  xrd_df <- df[32:1817,]
  names(xrd_df) <- c("Angle","Intensity")
  x <- xrd_df$Angle
  y <- xrd_df$Intensity
  plot(x, y, type="n", main="test",ylim = c(0,100000)) 
  lines(x, y, type="l") 
}

