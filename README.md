# Telco Customer Churn Analysis

This repository is organized as a production-style Data Analyst project for churn reduction use cases.

## 1) Business Goal

Reduce customer churn by identifying high-risk segments and translating model insights into actionable retention strategies.

## 2) Project Structure

```text
.
|-- archive/                         # Archived legacy notebooks
|-- config/                          # Project configuration
|   `-- project.yaml
|-- data/
|   |-- external/                    # Third-party data (optional)
|   |-- processed/                   # Cleaned/feature-ready data
|   |   `-- telco_customer_churn_clean.csv
|   `-- raw/                         # Raw source data
|       `-- telco_customer_churn.csv
|-- docs/                            # Business and project documents
|   |-- business_recommendation.md
|   `-- business_understanding.md
|-- models/                          # Trained model artifacts
|-- notebooks/
|   |-- 01_data_understanding/
|   |-- 02_data_preparation/
|   |-- 03_exploratory_analysis/
|   |-- 04_statistical_analysis/
|   |-- 05_modeling/
|   `-- 06_evaluation/
|-- reports/
|   `-- figures/                     # Exported charts and visuals
|-- src/                             # Reusable Python modules
|   |-- data/
|   |-- features/
|   |-- models/
|   |-- utils/
|   |   `-- paths.py
|   `-- visualization/
|-- tests/
|-- .gitignore
|-- requirements.txt
`-- README.md
```

## 3) Notebook Workflow

1. `notebooks/01_data_understanding/` inspect schema, data quality, and baseline profiling.
2. `notebooks/02_data_preparation/` apply business rules and data cleaning.
3. `notebooks/03_exploratory_analysis/` perform EDA and churn behavior analysis.
4. `notebooks/04_statistical_analysis/` run statistical tests.
5. `notebooks/05_modeling/` train and compare models.
6. `notebooks/06_evaluation/` evaluate performance and business impact.

## 4) Setup

```bash
pip install -r requirements.txt
```

## 5) Data Paths (Standard)

- Raw data: `data/raw/telco_customer_churn.csv`
- Processed data: `data/processed/telco_customer_churn_clean.csv`

## 6) Team Conventions

- Keep notebooks numbered by pipeline step.
- Save all reusable logic to `src/` and keep notebooks focused on analysis.
- Store model files in `models/` and plots in `reports/figures/`.
- Move obsolete experiments to `archive/`.

## 7) Text Encoding Policy (Important)

To prevent Thai/Unicode text corruption (mojibake), this project enforces UTF-8 workflow:

- VS Code is configured to use UTF-8 (`.vscode/settings.json`).
- Git text normalization is enforced via `.gitattributes`.
- Editor defaults are enforced via `.editorconfig`.

Before pushing changes, run:

```powershell
powershell -ExecutionPolicy Bypass -File scripts/check_mojibake.ps1
```

If the script reports files, fix the text before commit.


