
import pandas as pd
import os
import re

# Define input and output paths

input_path = os.path.join("Data", "US Census", "ACS_CA_ZipCode_Original.csv")
output_path = os.path.join("Data", "US Census", "ACS_CA_ZipCode.csv")


# Load raw ACS file
df = pd.read_csv(input_path, encoding="latin1")

# Mapping for category to measure type
category_to_measure = {
    "HOUSEHOLDS BY TYPE": "Households",
    "RELATIONSHIP": "Population",
    "MARITAL STATUS": "Population",
    "FERTILITY": "Population",
    "GRANDPARENTS": "Population",
    "SCHOOL ENROLLMENT": "Population",
    "EDUCATIONAL ATTAINMENT": "Population",
    "VETERAN STATUS": "Population",
    "DISABILITY STATUS OF THE CIVILIAN NONINSTITUTIONALIZED POPULATION": "Population",
    "RESIDENCE 1 YEAR AGO": "Population",
    "PLACE OF BIRTH": "Population",
    "U.S. CITIZENSHIP STATUS": "Population",
    "YEAR OF ENTRY": "Population",
    "WORLD REGION OF BIRTH OF FOREIGN-BORN": "Population",
    "LANGUAGE SPOKEN AT HOME": "Population",
    "ANCESTRY": "Population",
    "COMPUTERS AND INTERNET USE": "Households"
}

# Normalize the data
records = []
for i in range(0, len(df), 5):
    try:
        zip_code = df.iloc[i, 0].split()[1]
        estimate = df.iloc[i+1]
        moe = df.iloc[i+2]
        percent = df.iloc[i+3]
        percent_moe = df.iloc[i+4]
    except (IndexError, AttributeError):
        continue

    for col in df.columns[1:]:
        parts = col.split("!!")
        if len(parts) <= 1:
            continue  # Skip non-nested columns

        category = parts[0].strip()
        variable_path = " / ".join([p.strip() for p in parts[1:]])
        measure = category_to_measure.get(category, "Unknown")

        # Clean and normalize values
        def clean_value(val):
            val = str(val).replace("±", "").replace("Â", "").strip()
            if val == "(X)":
                return "X"
            val = val.replace("%", "").strip()
            return val

        records.append({
            "zcta5": zip_code,
            "category": category,
            "variable": variable_path,
            "estimate": clean_value(estimate[col]),
            "margin_of_error": clean_value(moe[col]),
            "percent": clean_value(percent[col]),
            "percent_margin_of_error": clean_value(percent_moe[col]),
            "measure_type": measure,
            "year": 2023 # Latest ASC 5 yr dataset
        })

# Create DataFrame and drop records missing estimate
df_transformed = pd.DataFrame(records)
df_transformed = df_transformed.dropna(subset=["estimate"]).reset_index(drop=True)

# Ensure output directory exists
os.makedirs(os.path.dirname(output_path), exist_ok=True)

# Save to CSV
df_transformed.to_csv(output_path, index=False)
print(f"✅ Saved transformed data to '{output_path}'")
