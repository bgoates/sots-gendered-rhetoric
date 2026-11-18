# Install the R packages used by SOTS_ch1_2.Rmd.
# Run once from the project root:  Rscript R/install_packages.R
#
# Versions the analysis was last run with (R 4.3.3):
#   stm 1.3.10 (the saved model was fit with stm 1.3.7), tidytext 0.4.1,
#   dplyr 1.1.4, ggplot2 3.4.4, modelsummary 1.4.5, igraph 1.6.0,
#   sandwich 3.1.0, lmtest 0.9.40, readxl 1.4.3, rmarkdown 2.25

pkgs <- c(
  # data handling
  "readr", "readxl", "dplyr", "tidyr", "stringr", "purrr", "forcats",
  # text analysis and topic model
  "tidytext", "stm", "tm", "SnowballC",
  # figures
  "ggplot2", "scales", "ggrepel", "igraph",
  # models and tables
  "broom", "sandwich", "lmtest", "modelsummary",
  # rendering
  "rmarkdown", "knitr"
)

missing <- setdiff(pkgs, rownames(installed.packages()))
if (length(missing) > 0) {
  install.packages(missing)
} else {
  message("All packages are already installed.")
}
