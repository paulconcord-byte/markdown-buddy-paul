# Markdown Buddy — Monthly Sales Analysis (Synthetic Data)

> **AI Assistance Declaration**: I used Claude (Anthropic, Claude Fable 5, 2026-08-19) for ideation, layout suggestions, and writing assistance while drafting this documentation. Prompts used: see the [AI Assistance Disclosure](#ai-assistance-disclosure) section below and `Appendix_AI_Prompts` in my submission. I verified outputs using GitHub's Markdown preview, knitting the .Rmd in RStudio, and comparing the structure against tidyverse repository READMEs. All final calculations are done by myself. I am responsible for the accuracy and originality of this work.

A small, well-documented R project created for **BDA400 — Data Science Tools and Techniques (Assignment 1)**. It analyzes a fully **synthetic** retail sales dataset: it computes summary statistics, aggregates revenue by month and by product category, and produces a monthly revenue chart.

## Overview

The project answers three simple questions about a synthetic retail dataset of 300 transactions (January–June 2026):

1. How much revenue was generated in total, and what does a typical sale look like?
2. How does revenue change month over month?
3. Which product categories generate the most revenue?

All data is randomly generated with a fixed seed. **No real or personal data is used anywhere in this project.**

## Repository Structure

```text
markdown-buddy-paul/
├── README.md                    # This file
├── analysis.R                   # Main analysis script
├── analysis_documentation.Rmd   # R Markdown documentation for analysis.R
├── Reflection.md                # Responses to the reflection questions
└── data/
    └── synthetic_sales.csv      # Synthetic input dataset (300 rows)
```

## Installation

1. Install [R](https://cran.r-project.org/) (version 4.0 or later) and, optionally, [RStudio](https://posit.co/download/rstudio-desktop/) or [Posit Cloud](https://posit.cloud/).
2. Clone this repository:

```bash
git clone https://github.com/paulconcord-byte/markdown-buddy-paul.git
cd markdown-buddy-paul
```

No external R packages are required — the script uses **base R only**. To knit the documentation file you will also need the `rmarkdown` package:

```r
install.packages("rmarkdown")
```

## Example Usage

Run the full analysis from the project root:

```r
source("analysis.R")
```

Or from the command line:

```bash
Rscript analysis.R
```

The script prints summary statistics to the console and writes three files to an `output/` folder:

| Output file                      | Description                                |
|----------------------------------|--------------------------------------------|
| `output/monthly_revenue.csv`     | Total revenue aggregated by month          |
| `output/category_summary.csv`    | Revenue and units sold by product category |
| `output/monthly_revenue_plot.png`| Bar chart of monthly revenue               |

The `output/` folder is generated at run time and is intentionally not committed to the repository.

## Data

`data/synthetic_sales.csv` contains 300 synthetic transactions with the following columns: `transaction_id`, `date`, `category`, `product_id`, `units_sold`, `unit_price`, and `region`. The data was generated in R with `set.seed(400)` so results are reproducible.

## Documentation

`analysis_documentation.Rmd` documents the purpose, inputs, outputs, and logic of `analysis.R` section by section, with runnable code chunks. Knit it in RStudio or Posit Cloud to produce an HTML report.

## License

This project is released under the [MIT License](https://opensource.org/licenses/MIT). It was created for educational purposes as part of BDA400 at CDI College.

## AI Assistance Disclosure

- **AI tool used:** Claude (Anthropic) — Claude Fable 5, accessed 2026-08-19.
- **Main prompts given:**
  - *Seed:* "Explain what sections a good GitHub README for an R data analysis project should include."
  - *Seed:* "Here's a summary of my R project: [paste summary]. Generate a professional README.md file using Markdown."
  - *Refinement:* "Add sections for Installation, Example Code, and License. Keep tone concise and professional."
  - *Critique/Validation:* "Review the Markdown for syntax errors and suggest 2 improvements for clarity."
- **Changes made after reviewing the outputs:** I renamed the AI's generic "Usage" section to "Example Usage" to match the assignment terminology, replaced its placeholder file tree with the actual repository structure, converted the plain list of output files into a Markdown table for readability, added the Data section describing the synthetic dataset and seed, and verified every command by running it before including it. I also confirmed rendering with GitHub's preview and compared the structure against the tidyverse `dplyr` README.
