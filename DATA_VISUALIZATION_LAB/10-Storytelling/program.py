"""Experiment 10: export three story views for Tableau."""
from pathlib import Path
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd

source = Path(__file__).parents[1] / "05-data-preparation" / "sales_data.csv"
output = Path(__file__).parent / "outputs"
output.mkdir(exist_ok=True)
data = pd.read_csv(source)
views = [
    ("story_1_category_performance", "bar", data.groupby("Category")["Sales"].sum()),
    ("story_2_regional_contribution", "pie", data.groupby("Region")["Sales"].sum()),
]
for name, chart_type, values in views:
    plt.figure(figsize=(7, 5))
    if chart_type == "bar":
        values.plot(kind="bar", title="Story 1: Sales by Category")
        plt.xlabel("Category")
        plt.ylabel("Total Sales")
    else:
        values.plot(kind="pie", autopct="%1.1f%%", title="Story 2: Sales by Region")
        plt.ylabel("")
    plt.tight_layout()
    plt.savefig(output / f"{name}.png", dpi=150)
    plt.close()

plt.figure(figsize=(7, 5))
plt.scatter(data["Quantity"], data["Sales"], s=80, color="#1f4e79")
plt.title("Story 3: Sales vs Quantity")
plt.xlabel("Quantity")
plt.ylabel("Sales")
plt.tight_layout()
plt.savefig(output / "story_3_sales_quantity.png", dpi=150)
plt.close()
print("Story created: category performance, regional contribution, and sales relationship.")