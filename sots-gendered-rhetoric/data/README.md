# Data

The input data belong to other researchers and are **not included in this repository**. Put them in this folder with the layout below, then run `Rscript R/check_data.R` from the project root to confirm everything is in place.

```
data/
├── sots_data/
│   ├── sots_metadata.csv        # one row per speech: id, year, ordernum, state, governor, party, ...
│   └── raw/                     # one plain-text file per speech, named <id>.txt (3,274 files)
└── RobertsUtytch2020data/
    └── RobertsUtytch_GenderedLanguage.xlsx
```

## 1. State of the State addresses

Governors' State of the State addresses, collected for:

> Butler, Daniel M., and Joseph L. Sutherland. 2023. "Have State Policy Agendas Become More Nationalized?" *Journal of Politics* 85(1): 351–355. https://doi.org/10.1086/720792

The corpus version used here has 3,274 speeches (manifest dated 2024-02-03). Please obtain it from the authors or their replication materials and cite their article if you use it.

## 2. Gendered-language dictionary

Ratings of 700 words on a 1 (feminine) to 7 (masculine) scale, from:

> Roberts, Damon C., and Stephen M. Utych. 2020. "Linking Gender, Language, and Partisanship: Developing a Database of Masculine and Feminine Words." *Political Research Quarterly* 73(1): 40–50. https://doi.org/10.1177/1065912919874883

The analysis uses the `word` and `mean-a` columns of `RobertsUtytch_GenderedLanguage.xlsx`. Please obtain the file from the authors' replication materials and cite their article if you use it.

## Saved models

`output/models/` (committed) holds the fitted structural topic model and two derived files, so the document knits in about five minutes without refitting:

| File | What it is |
|---|---|
| `stm_model.rds` | STM, K = 50, 2,990 speeches, 10,858-word vocabulary (fit with stm 1.3.7) |
| `passage_theta.rds` | Topic assignment for each ~250-word passage, from `fitNewDocuments()` |
| `searchK.rds` | `searchK()` diagnostics for K = 10 to 70 |

Set `refit_stm <- TRUE` in the parameters chunk to re-estimate them (several hours).
