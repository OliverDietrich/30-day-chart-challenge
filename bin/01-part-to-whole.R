# Day 1 - Part to Whole

# Libraries --------------------------------------------------------------------

library(dplyr)
library(ggplot2)

# Variables --------------------------------------------------------------------

in_url <- "https://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing?file=data/ilc_mdes04.tsv.gz"

in_url <- "https://ec.europa.eu/eurostat/estat-navtree-portlet-prod/BulkDownloadListing?file=data/lfst_hhwahchi.tsv.gz"
in_file <- "data/day1.tsv.gz"

out_dir <- "analysis/"
dir.create(out_dir)

# Read data -------------------------------------------------------------------

# Download
download.file(in_url, in_file)

df <- read.csv(gzfile(in_file))

index <- which(stringr::str_detect(names(df), "geo.time"))
time <- stringr::str_split(df[[index]], "\t", simplify = TRUE)
cols <- stringr::str_split(names(df)[[index]], "\\.")[[1]]
cols <- cols[cols != ""]
colnames(time) <- cols

# Analyze ----------------------------------------------------------------------

df <- tidyr::gather(data, "index", "value")

# Plot
fn <- "part-to-whole.png"
ggplot(df, aes(index, value)) +
  geom_line()
