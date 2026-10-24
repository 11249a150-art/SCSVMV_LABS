import pandas as pd
df = in_data.to_pandas_dfs()[0]
print("Total Sales:", df["Sales"].sum())
print("Average Sales:", df["Sales"].mean())
print("Minimum Sales:", df["Sales"].min())
print("Maximum Sales:", df["Sales"].max())
print("\nSales by Category:")
print(df.groupby("Category")["Sales"].sum())


//output:
Running script:
Total Sales: 115000.0
Average Sales: 19166.666666666668
Minimum Sales: 3000.0
Maximum Sales: 55000.0

Sales by Category:
Category
0.0    78000.0
1.0    37000.0
Name: Sales, dtype: float64