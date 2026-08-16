import pandas as pd

# 1. Load Data

customers=pd.read_csv("ecommerce_project/customers.csv")
orders=pd.read_csv("ecommerce_project/orders.csv")
products=pd.read_csv("ecommerce_project/products.csv")
returns=pd.read_csv("ecommerce_project/returns.csv")

# 2. Inspect Data

print("CUSTOMERS")
print(customers.shape)
print(customers.isnull().sum())
print(customers.duplicated().sum())

print("\nPRODUCTS")
print(products.shape)
print(products.isnull().sum())
print(products.duplicated().sum())

print("\nORDERS")
print(orders.shape)
print(orders.isnull().sum())
print(orders.duplicated().sum())

print("\nRETURNS")
print(returns.shape)
print(returns.isnull().sum())
print(returns.duplicated().sum())

# 3. Investigate Missing Values

print("\nMissing customer cities:")
print(customers[customers["City"].isna()])

print("\nMissing discounts:")
print(orders[orders["Discount"].isna()])

print("\nMissing payment methods:")
print(orders[orders["Payment_Method"].isna()])

# 4. Data Cleaning

# Missing City
customers["City"] = customers["City"].fillna("Unknown")

# Missing Discount
orders["Discount"] = orders["Discount"].fillna(0)

# Missing Payment Method
orders["Payment_Method"] = orders["Payment_Method"].fillna("Unknown")

# Duplicate Rows
print(orders[orders.duplicated()])

# Remove Exact Duplicate Rows
orders = orders.drop_duplicates()

# 5. Data Validation

print("Customers:", customers.shape)
print("Products:", products.shape)
print("Orders:", orders.shape)
print("Returns:", returns.shape)

print("\nCustomer missing values:")
print(customers.isnull().sum())

print("\nOrder missing values:")
print(orders.isnull().sum())

print("\nOrder duplicates:")
print(orders.duplicated().sum())

# 6. Check Data Types

print(customers.dtypes)
print()
print(products.dtypes)
print()
print(orders.dtypes)
print()
print(returns.dtypes)

# 7. Convert Date columns To Datetime

customers["Signup_Date"] = pd.to_datetime(customers["Signup_Date"])

orders["Order_Date"] = pd.to_datetime(orders["Order_Date"])

returns["Return_Date"] = pd.to_datetime(returns["Return_Date"])

#  8. Data Feature Engineering

orders["Year"] = orders["Order_Date"].dt.year
orders["Month"] = orders["Order_Date"].dt.month
orders["Month_Name"] = orders["Order_Date"].dt.month_name()
orders["Quarter"] = orders["Order_Date"].dt.quarter

# 9. Merge Order With Product

orders = orders.merge(
    products[
        [
            "Product_ID",
            "Product_Name",
            "Category",
            "Sub_Category",
            "Unit_Price",
            "Unit_Cost"
        ]
    ],
    on="Product_ID",
    how="left")

# 10. Calculate Business Metrics

orders["Revenue"] = (
    orders["Quantity"]
    * orders["Unit_Price"]
    * (1 - orders["Discount"])
)

orders["Cost"] = orders["Quantity"] * orders["Unit_Cost"]

orders["Profit"] = orders["Revenue"] - orders["Cost"]

orders["Profit_Margin"] = (
    orders["Profit"] / orders["Revenue"].replace(0, pd.NA)
) * 100

# 11. Merge Orders with Customers

orders = orders.merge(
    customers[
        ["Customer_ID", "Customer_Name", "Gender", "Age", "City", "State"]
    ],
    on="Customer_ID",
    how="left"
)

# 12. Validate Final Dataset

print("\nFinal Dataset Shape:")
print(orders.shape)

print("\nMissing Values:")
print(orders.isnull().sum())

print("\nDuplicate Rows:")
print(orders.duplicated().sum())

print("\nData Types:")
print(orders.dtypes)

# 13. Export Cleaned Dataset

# Export CSV
orders.to_csv("cleaned_sales_data.csv", index=False)

# Export Excel
orders.to_excel("cleaned_sales_data.xlsx", index=False)

print("Dataset exported successfully.")