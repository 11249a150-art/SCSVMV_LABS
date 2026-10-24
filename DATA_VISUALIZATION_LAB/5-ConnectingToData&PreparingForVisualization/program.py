//program:
import pandas as pd
df = pd.read_csv("SalesData.csv")
print(df.head())
print(df.isnull().sum())
df = df.drop_duplicates()
df["Sales"] = pd.to_numeric(df["Sales"])
df.to_csv("cleaned_sales_data.csv", index=False)
print("Dataset cleaned and ready for Tableau.")


//Sample CSV File (SalesData.csv):
OrderID,Product,Category,Sales,Quantity,Region
101,Laptop,Electronics,55000,2,South
102,Mobile,Electronics,20000,3,North
103,Chair,Furniture,5000,5,West
104,Table,Furniture,7000,2,East
105,Headphones,Electronics,3000,4,South
106,Sofa,Furniture,25000,1,North

//sample output:
     OrderID     Product     Category  Sales  Quantity Region
0      101      Laptop  Electronics  55000         2  South
1      102      Mobile  Electronics  20000         3  North
2      103       Chair    Furniture   5000         5   West
3      104       Table    Furniture   7000         2   East
4      105  Headphones  Electronics   3000         4  South
OrderID     0
Product     0
Category    0
Sales       0
Quantity    0
Region      0
dtype: int64
Dataset cleaned and ready for Tableau