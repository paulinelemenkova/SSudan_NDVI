# ============================================================================
# Multi-temporal NDVI of South Sudan in R (terra) - one script per year.
#
# R companion to the author's South Sudan (Sudd Wetlands) environmental-
# analytics study. The related peer-reviewed article applies GRASS GIS image
# segmentation (these R/terra scripts compute NDVI for the same study area):
#   Lemenkova, P. (2023). Image Segmentation of the Sudd Wetlands in South Sudan
#   for Environmental Analytics by GRASS GIS Scripts.
#   Analytics, 2(3), 745-780.
#   DOI:    https://doi.org/10.3390/analytics2030040
#   Zenodo: https://doi.org/10.5281/zenodo.8367885
#   HAL:    https://hal.science/hal-04214295v1
#   SSRN:   https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4579189
#
# Author: Polina Lemenkova  |  ORCID: 0000-0002-5759-1089
# ============================================================================

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
filenames <- paste0('LC08_L2SP_173055_20171231_20200902_02_T1_SR_B', 1:7, ".tif")
filenames
landsat <- rast(filenames)
landsat
ndvi <- vi(landsat, 5, 4)
plot(ndvi, col=brewer.pal(11, "RdYlGn"), axes=FALSE, ann=FALSE)

# Plotting histogram of the NDVI
hist(ndvi, font.main = 1, main = "NDVI values for Landsat-8 OLI/TIRS C1 image \nSouth Sudan, Sudd Wetlands (2017)", xlab = "NDVI", ylab= "Frequency",
    col = "darkolivegreen1", xlim = c(-0.5, 1),  breaks = 30, xaxt = "n")
axis(side=1, at = seq(-0.6, 1, 0.1), labels = seq(-0.6, 1, 0.1))
minor.tick(nx = 10, ny = 10, tick.ratio = 0.3)
#
