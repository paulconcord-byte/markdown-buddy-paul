# =============================================================================
# analysis.R
# Monthly Sales Analysis of a Synthetic Retail Dataset
#
# Author : Paul
# Course : BDA400 - Data Science Tools and Techniques
# Date   : 2026-08-19
#
# Purpose:
#   Load a synthetic retail sales dataset, compute summary statistics,
#   aggregate revenue by month and by product category, and save the
#   results to the output/ folder.
#
# Inputs :
#   data/synthetic_sales.csv  (synthetic data only - no real customer data)
#
# Outputs:
#   output/monthly_revenue.csv
#   output/category_summary.csv
#   output/monthly_revenue_plot.png
# =============================================================================

# ---- 1. Load the data -------------------------------------------------------
sales <- read.csv("data/synthetic_sales.csv", stringsAsFactors = FALSE)
sales$date <- as.Date(sales$date)

# ---- 2. Basic data checks ---------------------------------------------------
cat("Rows loaded:", nrow(sales), "\n")
cat("Missing values:", sum(is.na(sales)), "\n")
str(sales)

# ---- 3. Feature engineering -------------------------------------------------
# Revenue per transaction and a year-month key for aggregation
sales$revenue <- sales$units_sold * sales$unit_price
sales$month   <- format(sales$date, "%Y-%m")

# ---- 4. Summary statistics --------------------------------------------------
summary_stats <- data.frame(
  metric = c("Total revenue", "Mean revenue per sale",
             "Median units sold", "Number of transactions"),
  value  = c(round(sum(sales$revenue), 2),
             round(mean(sales$revenue), 2),
             median(sales$units_sold),
             nrow(sales))
)
print(summary_stats)

# ---- 5. Aggregations --------------------------------------------------------
monthly_revenue <- aggregate(revenue ~ month, data = sales, FUN = sum)
monthly_revenue$revenue <- round(monthly_revenue$revenue, 2)

category_summary <- aggregate(
  cbind(revenue, units_sold) ~ category, data = sales, FUN = sum
)
category_summary$revenue <- round(category_summary$revenue, 2)
category_summary <- category_summary[order(-category_summary$revenue), ]

# ---- 6. Save outputs --------------------------------------------------------
dir.create("output", showWarnings = FALSE)
write.csv(monthly_revenue,  "output/monthly_revenue.csv",  row.names = FALSE)
write.csv(category_summary, "output/category_summary.csv", row.names = FALSE)

png("output/monthly_revenue_plot.png", width = 800, height = 500)
barplot(monthly_revenue$revenue,
        names.arg = monthly_revenue$month,
        col       = "#4C72B0",
        las       = 2,
        main      = "Monthly Revenue (Synthetic Data)",
        ylab      = "Revenue ($)")
dev.off()

cat("Analysis complete. Results saved to the output/ folder.\n")
