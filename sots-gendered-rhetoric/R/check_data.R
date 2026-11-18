# Check that the input data are in place before knitting.
# Run from the project root:  Rscript R/check_data.R

ok <- TRUE
check <- function(cond, msg) {
  cat(if (cond) "[ok]     " else "[MISSING]", msg, "\n")
  if (!cond) ok <<- FALSE
}

meta_file <- "data/sots_data/sots_metadata.csv"
raw_dir   <- "data/sots_data/raw"
dict_file <- "data/RobertsUtytch2020data/RobertsUtytch_GenderedLanguage.xlsx"

check(file.exists(meta_file), meta_file)
n_txt <- if (dir.exists(raw_dir)) length(list.files(raw_dir, pattern = "\\.txt$")) else 0
check(n_txt > 0, sprintf("%s (%d .txt files found; expected 3,274)", raw_dir, n_txt))
check(file.exists(dict_file), dict_file)

if (file.exists(meta_file)) {
  meta <- read.csv(meta_file, nrows = 5)
  need <- c("id", "year", "state", "governor", "party")
  check(all(need %in% names(meta)),
        paste("metadata columns:", paste(need, collapse = ", ")))
}

for (f in c("stm_model.rds", "passage_theta.rds", "searchK.rds")) {
  check(file.exists(file.path("output/models", f)), file.path("output/models", f))
}

if (ok) cat("\nEverything is in place. Knit SOTS_ch1_2.Rmd.\n") else
  cat("\nSee data/README.md for where to get the missing files.\n")
