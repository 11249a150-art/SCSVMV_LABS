"""Experiment 9: export a compact dashboard-style figure."""
from pathlib import Path
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd

source = Path(__file__).parents[1] / "05-data-preparation" / "sales_data.csv"
output = Path(__file__).parent / "outputs"
output.mkdir(exist_ok=True)
data = pd.read_csv(source)
fig, axes = plt.subplots(2, 2, figsize=(11, 8))
category_sales = data.groupby("Category")["Sales"].sum()
region_sales = data.groupby("Region")["Sales"].sum()
axes[0, 0].bar(category_sales.index, category_sales.values, color="#1f4e79")
axes[0, 0].set_title("Sales by Category")
axes[0, 1].pie(region_sales.values, labels=region_sales.index, autopct="%1.1f%%")
axes[0, 1].set_title("Sales by Region")
axes[1, 0].plot(data["Quantity"], data["Sales"], marker="o", color="#c56a00")
axes[1, 0].set_title("Sales vs Quantity")
axes[1, 0].set_xlabel("Quantity")
axes[1, 0].set_ylabel("Sales")
axes[1, 1].axis("off")
axes[1, 1].text(0.1, 0.6, f"Total Sales\n{data['Sales'].sum():,.0f}\n\nOrders\n{len(data)}", fontsize=18, va="center")
fig.suptitle("Sales Performance Dashboard", fontsize=18)
fig.tight_layout()
fig.savefig(output / "sales_dashboard.png", dpi=150)
print("Saved outputs/sales_dashboard.png")