import pandas as pd

#Load dataset
df = pd.read_csv("sales_data.csv")

#Basic dataset
print(df.head())
print(df.shape)
#missing value checking
print(df.isnull().sum())
#check duplicates
print("Duplicates:", df.duplicated().sum())
#show column names
print("Columns:", df.columns.tolist())
#category wise toot revenue
category_revenue = df.groupby("category")["total_price"].sum().sort_values(ascending=False)
print("\nCategory-wise Total Revenue:")
print(category_revenue)
subcategory_revenue = df.groupby("sub_category")["total_price"].sum().sort_values(ascending=False)
print("\nSub-Category-wise Total Revenue:")
print(subcategory_revenue)
# Region-wise Total Revenue
region_revenue = df.groupby("region")["total_price"].sum().sort_values(ascending=False)

print("\nRegion-wise Total Revenue:")
print(region_revenue)

# Customer-wise Total Revenue
customer_revenue = df.groupby("customer_name")["total_price"].sum().sort_values(ascending=False)

print("\nCustomer-wise Total Revenue:")
print(customer_revenue)
#category and total price
sorted_data = df.sort_values(
    by=["category", "total_price"],
    ascending=[True, False]
)
print("\nData sorted by Category and Total Price:")
print(sorted_data.head(10))
#correlation matrix
correlation_matrix = df.corr(numeric_only=True)

print("\nCorrelation Matrix:")
print(correlation_matrix)