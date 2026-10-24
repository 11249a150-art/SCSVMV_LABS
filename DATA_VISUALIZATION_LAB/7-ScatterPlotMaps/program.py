"""Experiment 7: companion scatter plot for Tableau map analysis."""
from pathlib import Path
import matplotlib
matplotlib.use("Agg")
import matplotlib.pyplot as plt
import pandas as pd

root = Path(__file__).parent
source = root / "sales_map_data.csv"
output = root / "outputs"
output.mkdir(exist_ok=True)
data = pd.read_csv(source)
plt.figure(figsize=(7, 5))
for region, group in data.groupby("Region"):
    plt.scatter(group["Sales"], group["Quantity"], label=region, s=80)
plt.title("Scatter Plot: Sales vs Quantity")
plt.xlabel("Sales")
plt.ylabel("Quantity")
plt.legend(title="Region")
plt.tight_layout()
plt.savefig(output / "sales_quantity_scatter.png", dpi=150)
print("Saved outputs/sales_quantity_scatter.png")