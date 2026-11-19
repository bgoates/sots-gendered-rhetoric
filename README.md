# What governors talk about, and how: gendered language in State of the State addresses

Analysis code for two chapters of my dissertation (Political Science, Michigan State University). It uses about 3,000 U.S. governors' State of the State addresses from 1924 on to ask:

1. **What** do women and men governors talk about? (structural topic model)
2. **How** do they talk about the same topics? (gendered-language dictionary, measured within topic)

The full analysis is one R Markdown file, [`SOTS_ch1_2.Rmd`](SOTS_ch1_2.Rmd), which knits to an HTML report with every table and figure.

## Methods

- **Corpus:** State of the State addresses (Butler & Sutherland 2023), Democrats and Republicans, 1924 onward. 2,990 speeches after cleaning; women governors identified by name and checked against the metadata.
- **Text cleaning:** whole-word edits only (state names, demonyms, applause markers, line-break hyphenation) so dictionary words are not damaged.
- **Chapter 1: topics.** Structural topic model (`stm`, K = 50, chosen with `searchK()`) with governor gender × party and a year spline as prevalence covariates. Gender and party differences in attention come from `estimateEffect()` with state fixed effects.
- **Chapter 2: gendered language.** Each word scored with the Roberts & Utych (2020) dictionary (`4 − mean rating`; positive = feminine-coded). Speeches are split into ~250-word passages, each passage is assigned a topic with the Chapter 1 model (`fitNewDocuments()`), and scores are pooled into speech × topic cells so women and men can be compared **within the same topic**.
- **Inference:** OLS with year and state fixed effects; standard errors clustered by governor. Robustness checks drop the 25 most common dictionary words and use the feminine share of dictionary words.

## Main findings

- **Topics.** Holding party, year and state constant, women governors spend about 2 percentage points more of a speech on jobs and the workforce. No other substantive topic shows a clear gender difference.
- **Language.** Women's speeches lean somewhat more feminine-coded than men's in both parties, more so among Republicans; the estimates are imprecise, and the size depends on the measure.
- **Composition vs. style.** Adding topic fixed effects cuts the female coefficient from 0.015 to 0.006, so roughly 60% of the gap reflects *which* topics women discuss rather than *how* they discuss them.
- **Within topic.** The clearest style differences are in fiscal topics: women's language about budgets and taxes is more feminine-coded than men's.

<p align="center">
  <img src="output/figures/ch1_fig02_topic_gender.png" width="48%" alt="Female minus male difference in topic attention">
  <img src="output/figures/ch2_fig07_within_topic_gap.png" width="48%" alt="Female minus male gap in gendered language within each topic">
</p>

All figures are in [`output/figures/`](output/figures).

## Repository layout

```
├── SOTS_ch1_2.Rmd            # the full analysis (Ch. 1 and Ch. 2)
├── R/
│   ├── install_packages.R    # installs the R packages used
│   └── check_data.R          # confirms the data are in place before knitting
├── data/
│   └── README.md             # where to get the data (not redistributed here)
├── output/
│   ├── models/               # saved STM and passage topics, so knitting takes ~5 minutes
│   └── figures/              # every figure as PNG (PDFs are created on knit)
└── sots-gendered-rhetoric.Rproj
```

## How to run it

1. Clone the repository and open `sots-gendered-rhetoric.Rproj` in RStudio (or set the working directory to the project folder).
2. Install packages: `Rscript R/install_packages.R`
3. Get the data and place it as described in [`data/README.md`](data/README.md), then run `Rscript R/check_data.R`.
4. Knit: `rmarkdown::render("SOTS_ch1_2.Rmd")`

The saved models in `output/models/` are loaded by default, so the document knits in about five minutes. To re-estimate everything, set `refit_stm <- TRUE` in the parameters chunk (several hours). All random steps use a fixed seed (`20260427`), so figures are identical across runs.

Last run with R 4.3.3, stm 1.3.10, tidytext 0.4.1, ggplot2 3.4.4, modelsummary 1.4.5.

## Data sources

- Butler, Daniel M., and Joseph L. Sutherland. 2023. "Have State Policy Agendas Become More Nationalized?" *Journal of Politics* 85(1): 351–355.
- Roberts, Damon C., and Stephen M. Utych. 2020. "Linking Gender, Language, and Partisanship: Developing a Database of Masculine and Feminine Words." *Political Research Quarterly* 73(1): 40–50.

## License

Code: MIT (see [`LICENSE`](LICENSE)). The data belong to their original authors and are not included.

## Contact

Bailey G. Oates · [github.com/bgoates](https://github.com/bgoates)
