# Computing vegetation indices
library(terra)
library(RColorBrewer)
setwd("/Users/polinalemenkova/Documents/R/52_Image_Processing/NDVI")
library(Hmisc)
library(pals)
# 1. Normalized Difference Vegetation Index (NDVI) = (NIR - R) / (NIR + R), i.e., NDVI = (Band 5 – Band 4) / (Band 5 + Band 4).
vi <- function(img, k, i) {
  bk <- img[[k]]
  bi <- img[[i]]
  vi <- (bk - bi) / (bk + bi)
  return(vi)
}
# For Landsat NIR = 5, red = 4.
filenames <- paste0('LC08_L2SP_173055_20140411_20200911_02_T1_SR_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
ndvi <- vi(landsat, 5, 4)
# options(scipen=10000)
plot(ndvi, col=brewer.pal(11, "RdYlGn"), cex.main=0.9, axes=FALSE, ann=FALSE)
