# UPI Pulse — India's Digital Payment Ecosystem Analyzer

## Project Overview
A comprehensive data analytics project analyzing 6+ years of 
India's UPI transaction data (April 2019 — February 2026) to 
uncover digital payment growth patterns, festive spending 
behaviour and economic stress periods using a custom-built 
Payment Stress Index (PSI).

---

## Business Questions Answered
- How fast is India adopting UPI year over year?
- Do festivals genuinely impact UPI transaction behaviour?
- Is the average transaction value growing or declining?
- Can payment behaviour data detect economic stress periods?

---

## The Payment Stress Index (PSI)
A custom metric engineered from scratch combining two 
behavioral signals from UPI data:

Signal 1 — Volume Z-Score (55% weight)
Measures how unusually high or low transaction volume 
is compared to the 3-month rolling baseline.

Signal 2 — Ticket Size Z-Score (45% weight)
Measures how unusually low the average transaction value 
is compared to the 6-month rolling baseline.

Formula:
PSI Raw = (Volume Z-Score x 0.55) + (-Ticket Z-Score x 0.45)
PSI Score = Normalized to 0-100 scale

Interpretation:
PSI 0-40   = Minimal stress — economy healthy
PSI 40-60  = Moderate stress — some pressure
PSI 60-100 = High stress — economic strain detected

---

## Key Findings
1. UPI volume grew 30x from 2019 to 2025
2. 56% of all months (47/83) had PSI above 60
3. March is consistently the most stressed month
   due to fiscal year-end payment obligations
4. Holi drives stronger UPI growth than Diwali
   appearing 4 times in top 10 spike months
5. Average ticket size declined from Rs.1,855 (2021)
   to Rs.1,311 (2026) showing UPI democratization
6. Festive months show 4.8x higher MoM growth
   compared to non-festive months (7.35% vs 1.53%)

---

## Tools and Technologies
Tool              Purpose
Python            Data cleaning and PSI engineering
MySQL             Business queries and aggregations
Power BI          Interactive 3-page dashboard
Excel             Raw data collection

---

## Project Structure
project_upi_pulse/
├── data/
│   ├── upi_raw.xlsx
│   ├── festive_calendar.xlsx
│   ├── upi_cleaned.csv
│   └── sql_results/
│       ├── yearly_summary.csv
│       ├── festive_comparison.csv
│       ├── top10_spikes.csv
│       ├── quarterly_seasonality.csv
│       └── psi_stress_periods.csv
├── notebooks/
│   ├── 01_data_cleaning_upi_pulse.ipynb
│   └── 02_sql_analysis_upi_pulse.ipynb
├── sql/
│   └── upi_queries.sql
├── dashboard/
│   └── upi_pulse.pbix
└── README.md

---

## Dashboard Pages
Page 1 — Executive Overview
KPI cards, monthly volume trend, yearly growth
and average ticket size trend.

Page 2 — Payment Stress Index
PSI line chart with stress threshold, festive vs
non-festive comparison and top stress months table.

Page 3 — Deep Dive Analysis
Quarterly seasonality, top 10 spike months
and ticket size decline by year.

---

## Data Source
UPI Transaction Data: NPCI (npci.org.in)
Festive Calendar: Manually compiled
Analysis Period: April 2019 — February 2026
Total Records: 83 months

---

## How to Run
1. Clone this repository
2. Run notebooks in order:
   01_data_cleaning_upi_pulse.ipynb
   02_sql_analysis_upi_pulse.ipynb
3. Open upi_pulse.pbix in Power BI Desktop
4. Refresh data if needed

---

## Author
Keju Anilbhai Kalariya
Data Analytics | Python | SQL | Power BI