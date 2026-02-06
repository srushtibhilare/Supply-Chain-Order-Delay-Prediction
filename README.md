# Supply Chain Order Delay Prediction 🚚📦



# Supply Chain Order Delay Prediction

## 📌 Problem Statement
Late deliveries increase logistics cost and reduce customer trust.  
This project predicts whether an order will be delayed and estimates the delay probability.

## 🧠 Solution Overview
- Historical supply chain data stored in PostgreSQL
- Machine Learning model predicts delay risk
- Predictions written back to SQL
- Power BI dashboard for business insights

## 🛠 Tech Stack
- Python (Pandas, Scikit-learn, XGBoost)
- PostgreSQL
- Power BI
- SQLAlchemy

## 🔁 Workflow
1. Load data from PostgreSQL
2. Clean & encode features
3. Train Random Forest model
4. Generate delay probability
5. Store predictions in SQL
6. Visualize insights in Power BI

## 📊 Key Outputs
- Delay probability per order
- High-risk order identification
- Feature importance analysis

## 🚀 Business Impact
Helps operations teams:
- Prioritize high-risk orders
- Optimize suppliers & shipping
- Reduce late delivery penalties
