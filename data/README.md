# Dataset Guide

## Files

- `raw/customer_shopping_behavior.csv` contains the original 3,900 customer purchase records.
- `processed/customer_behavior_cleaned.csv` contains the cleaned, analysis-ready data used in MySQL and Power BI.

## Data Dictionary

| Field | Description |
| --- | --- |
| `customer_id` | Unique customer identifier |
| `age` | Customer age in years |
| `gender` | Customer gender recorded in the source data |
| `item_purchased` | Purchased product |
| `category` | Product category |
| `purchase_amount` | Observed purchase amount in USD |
| `location` | Customer state |
| `size` | Product size |
| `color` | Product color |
| `season` | Season associated with the purchase |
| `review_rating` | Customer rating from 2.5 to 5.0 |
| `subscription_status` | Whether the customer has a subscription |
| `shipping_type` | Selected fulfillment or shipping option |
| `discount_applied` | Whether a discount was used |
| `previous_purchases` | Number of purchases before the current record |
| `payment_method` | Selected payment method |
| `frequency_of_purchases` | Stated purchase cadence |
| `age_group` | Quartile-based age segment created during cleaning |
| `purchase_frequency_days` | Numeric approximation of purchase cadence in days |

## Important Limitations

- Each customer ID appears once, so the data is a customer-level snapshot rather than a transaction history.
- No transaction date is available; trends over time and cohort retention cannot be measured.
- Revenue is not profit because costs, quantities, returns, and discount depth are unavailable.
- Shipping type is not a complete sales-channel field.
- Associations in the data do not establish causation.

