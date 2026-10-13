# Customer Shopping Behavior Analysis

An end-to-end retail analytics project that uses Python, MySQL, and Power BI to examine customer purchasing behavior and translate it into practical marketing, loyalty, and merchandising recommendations.

## Overview

The project answers one business question:

> How can a retailer use customer shopping data to identify trends, improve customer engagement, and optimize marketing and product strategies?

The workflow covers data inspection, cleaning, exploratory analysis, SQL analysis, dashboard development, and an executive report.

## Business Problem

A leading retail company convened its C-suite to understand recent changes in customer shopping behavior and determine how those changes can be used to improve sales, customer satisfaction, and long-term loyalty. Management is particularly interested in how purchasing patterns vary across customer demographics, product categories, and shopping preferences, and whether factors such as discounts, review ratings, seasons, subscriptions, shipping choices, payment methods, and purchase history influence customer decisions and repeat purchases.

The project addresses the following overarching business question:

> How can the company leverage customer shopping data to identify trends, improve customer engagement, and optimize marketing and product strategies?

To answer it, the analysis evaluates revenue and purchase behavior across customer and product segments, examines potential engagement and loyalty signals, and identifies practical opportunities for campaign targeting, merchandising, subscription design, and customer retention.

## Dataset

The dataset contains **3,900 customer purchase records** and 18 original fields.

| Area | Example fields |
| --- | --- |
| Customer | Customer ID, age, gender, location, subscription status |
| Product | Item purchased, category, size, color, season |
| Purchase | Purchase amount, discount applied, previous purchases |
| Experience | Review rating, shipping type, payment method, purchase frequency |

Data preparation included:

- imputing 37 missing review ratings with the category median;
- standardizing column names;
- creating age-group and purchase-frequency-day fields; and
- removing `promo_code_used` because it duplicated `discount_applied` in every record.

The raw and cleaned CSV files are included in the repository root.

## Tools

- **Python:** pandas, NumPy, Matplotlib, and Seaborn
- **Jupyter Notebook:** exploratory analysis and data cleaning
- **MySQL:** business queries and customer segmentation
- **Power BI:** interactive dashboard and KPI reporting
- **Microsoft Word and PDF:** executive project report

## Steps

1. Loaded the raw CSV with Python.
2. Reviewed data types, summary statistics, missing values, and duplicates.
3. Cleaned the data and created analysis-ready fields.
4. Exported the processed dataset for MySQL and Power BI.
5. Ran SQL queries for revenue, ratings, customer segments, discounts, and repeat buyers.
6. Built a Power BI dashboard with KPI cards, slicers, and category and age-group comparisons.
7. Summarized the findings, recommendations, and limitations in an executive report.

## Dashboard

![Customer Behavior Dashboard](customer_behavior_dashboard.png)

The dashboard includes:

- 3,900 customers;
- $59.76 average purchase amount;
- 3.75 average review rating;
- subscription, gender, category, and shipping filters; and
- revenue and sales comparisons by category and age group.

Open the [Power BI file](customer_behavior_dashboard.pbix) to use the interactive version.

## Results

- The 3,900 customer records generated **$233,081 in revenue**, with an **average purchase of $59.76** and an **average review rating of 3.75**.
- **Clothing was the strongest category**, producing $104,264, or **44.7% of total revenue**. Clothing and Accessories together accounted for **76.6% of revenue**, making them the most important categories for merchandising and cross-selling.
- **Young Adults ages 18–31** generated the highest age-group revenue at **$62,143**. However, average purchase amounts were similar across age groups, indicating that the revenue lead was driven mainly by customer volume rather than substantially higher spending per purchase.
- Only **27% of customers were subscribers**. Subscribers showed a slightly higher repeat-buyer share, but their current average purchase amount was nearly the same as that of non-subscribers, so subscription status alone did not indicate higher transaction value.
- Discounted purchases averaged **$59.28**, compared with **$60.13** for purchases without a discount. The data therefore does not show that discount use increased order value.
- Review ratings and previous-purchase counts had **very weak relationships with current purchase amount**. Higher ratings or a longer purchase history did not reliably translate into a larger transaction in this snapshot.
- Payment methods and shipping preferences were broadly distributed. No single option dominated strongly enough to justify reducing customer choice.
- The findings are descriptive rather than causal because the dataset does not contain transaction dates, profit margins, quantities, returns, marketing exposure, or a true sales-channel field.

## Recommendations

- **Prioritize Clothing and Accessories.** Protect inventory availability and visibility for Clothing, then use Accessories in bundles and personalized cross-sell campaigns. Test category combinations instead of treating all products equally.
- **Target customers by lifecycle stage.** Segment customers as New, Returning, and Loyal using previous purchases and stated buying frequency. Use onboarding offers for new customers, replenishment reminders for returning customers, and recognition or early-access benefits for loyal customers.
- **Use discounts selectively.** Replace broad discounting with controlled customer-level tests. Evaluate incremental conversion, average order value, and contribution margin against a non-discounted holdout group before expanding an offer.
- **Strengthen the subscription value proposition.** Test benefits such as early access, exclusive bundles, loyalty points, or shipping advantages. Measure retention and incremental profit before increasing subscriber-acquisition spending.
- **Address product-experience gaps.** Review high-volume products with below-average ratings—particularly Shirts and Blouses—to identify issues involving quality, fit, product descriptions, or fulfillment.
- **Preserve payment and fulfillment choice.** Maintain multiple payment and shipping options while testing whether personalized defaults can reduce checkout friction without removing customer flexibility.
- **Improve future measurement.** Add transaction date, sales channel, quantity, product cost, discount depth, returns, campaign exposure, and acquisition source. These fields will support cohort retention, customer lifetime value, channel performance, profitability analysis, and stronger causal testing.

## Next Steps and Limitations

The dataset is a cross-sectional snapshot. It does not include transaction dates, product costs, quantities, returns, discount depth, marketing cost, or a true online-versus-store channel field. The observed differences are descriptive and should not be interpreted as causal.

Recommended next steps are to create a dated transaction model, measure cohort retention and customer lifetime value, and validate promotional and subscription decisions through controlled experiments.

## How to Run

### 1. Clone and create a Python environment

```bash
git clone https://github.com/bkhao666/Customer-Trends-Data-Analysis.git
cd Customer-Trends-Data-Analysis
python -m venv .venv
```

Activate the environment and install dependencies:

```bash
# Windows
.venv\Scripts\activate

# macOS or Linux
source .venv/bin/activate

pip install -r requirements.txt
```

### 2. Run the Python analysis

```bash
jupyter lab customer_behavior_analysis.ipynb
```

Run all cells to recreate `customer_behavior_cleaned.csv` and the exploratory analysis.

### 3. Run the MySQL analysis

1. Open MySQL Workbench.
2. Import `customer_behavior_cleaned.csv` with the Table Data Import Wizard and name the table `customer`.
3. Run `customer_behavior_queries.sql`.

### 4. Open the dashboard and report

- Open `customer_behavior_dashboard.pbix` in Power BI Desktop.
- Read `customer_shopping_behavior_analysis.pdf` for the executive report.

## Repository Structure

```text
customer-trends-data-analysis/
|-- .gitignore
|-- customer_behavior_analysis.ipynb
|-- customer_behavior_cleaned.csv
|-- customer_behavior_dashboard.pbix
|-- customer_behavior_dashboard.png
|-- customer_behavior_queries.sql
|-- customer_shopping_behavior_analysis.pdf
|-- customer_shopping_behavior.csv
|-- README.md
`-- requirements.txt
```

