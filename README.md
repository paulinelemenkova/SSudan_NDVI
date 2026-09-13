# R/terra Multi-Temporal NDVI — South Sudan (Sudd Wetlands)

R scripts that compute the Normalized Difference Vegetation Index (NDVI) for
South Sudan from Landsat surface-reflectance imagery, one script per year across
2014-2023. Together they form a multi-temporal vegetation-greenness series over
the Sudd Wetlands study area, suitable for tracking inter-annual vegetation
dynamics.

## Related publication

These R/terra NDVI scripts are an R companion to the author's South Sudan
environmental-analytics study. The related peer-reviewed article applies GRASS
GIS image segmentation to the same study area:

Lemenkova, P. Image Segmentation of the Sudd Wetlands in South Sudan for
Environmental Analytics by GRASS GIS Scripts. Analytics 2023, 2(3), 745-780.

- DOI:    https://doi.org/10.3390/analytics2030040
- Zenodo: https://doi.org/10.5281/zenodo.8367885
- HAL:    https://hal.science/hal-04214295v1
- SSRN:   https://papers.ssrn.com/sol3/papers.cfm?abstract_id=4579189
- MDPI:   https://www.mdpi.com/2813-2203/2/3/40 (ISSN 2813-2203, Scopus)

## Scripts

R-terra_NDVI_SSudan_2014.r ... R-terra_NDVI_SSudan_2023.r - one script per year.
Each script:

- Loads the seven Landsat surface-reflectance bands of the annual scene
  (path/row 173055; Landsat 8 OLI/TIRS for 2014-2021, Landsat 9 for later years)
  into a multi-band SpatRaster with terra::rast.
- Computes NDVI with a band-arithmetic function, NDVI = (NIR - Red) /
  (NIR + Red), i.e. (Band 5 - Band 4) / (Band 5 + Band 4).
- Maps the NDVI with a Red-Yellow-Green diverging ColorBrewer palette
  (brewer.pal(11, "RdYlGn")).
- Plots a histogram of the NDVI value distribution with major and minor ticks
  (Hmisc::minor.tick).

Running the full set produces a comparable NDVI map and distribution for each
year, i.e. a multi-temporal NDVI stack for change analysis.

## Methods and algorithms

- Spectral index computation (NDVI) by band arithmetic on surface-reflectance
  data (terra).
- Multi-temporal / time-series construction by repeating the computation per
  annual scene.
- Diverging colour mapping of a bounded index and distribution summary by
  histogram.

## Data

- Landsat Collection 2 Level-2 surface-reflectance scenes (LC08/LC09_L2SP_173055_...),
  seven bands each, covering the South Sudan / Sudd Wetlands study area. The
  GeoTIFF bands are expected in the working directory and are not stored in this
  repository.

## Requirements

- R (>= 4.0)
- Packages: terra, RColorBrewer, Hmisc, pals

Install with:

    install.packages(c("terra", "RColorBrewer", "Hmisc", "pals"))

## Usage

Place the annual Landsat bands in the working directory and run a given year:

    Rscript R-terra_NDVI_SSudan_2020.r

## Author and citation

Polina Lemenkova
ORCID: https://orcid.org/0000-0002-5759-1089

If you use these scripts, please cite:

Lemenkova, P. Image Segmentation of the Sudd Wetlands in South Sudan for
Environmental Analytics by GRASS GIS Scripts. Analytics 2023, 2(3), 745-780.
https://doi.org/10.3390/analytics2030040

## License

See the LICENSE file in this repository.
