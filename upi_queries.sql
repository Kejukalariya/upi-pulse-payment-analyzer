-- ================================================
-- UPI Pulse Project - SQL Queries
-- Author: Keju Anilbhai Kalariya
-- Date: 2024
-- Database: upi_pulse
-- ================================================

USE upi_pulse;

-- ------------------------------------------------
-- Query 1 - Yearly Summary
-- ------------------------------------------------
SELECT
    year,
    COUNT(*) AS total_months,
    ROUND(SUM(upi_volume_mn), 2) AS total_volume_mn,
    ROUND(AVG(upi_volume_mn), 2) AS avg_monthly_volume,
    ROUND(SUM(upi_value_cr), 2) AS total_value_cr,
    ROUND(AVG(upi_value_cr), 2) AS avg_monthly_value,
    ROUND(AVG(avg_ticket_size), 2) AS avg_ticket_size,
    ROUND(AVG(vol_mom_growth), 2) AS avg_mom_growth_pct,
    ROUND(MAX(upi_volume_mn), 2) AS peak_volume_mn,
    ROUND(MIN(upi_volume_mn), 2) AS lowest_volume_mn
FROM upi_data
GROUP BY year
ORDER BY year;


-- ------------------------------------------------
-- Query 2 - Festive vs Non Festive Comparison
-- ------------------------------------------------
SELECT
    CASE
        WHEN is_festive = 1 THEN 'Festive Month'
        ELSE 'Non Festive Month'
    END AS month_type,
    COUNT(*) AS total_months,
    ROUND(SUM(upi_volume_mn), 2) AS total_volume_mn,
    ROUND(AVG(upi_volume_mn), 2) AS avg_volume_mn,
    ROUND(SUM(upi_value_cr), 2) AS total_value_cr,
    ROUND(AVG(upi_value_cr), 2) AS avg_value_cr,
    ROUND(AVG(avg_ticket_size), 2) AS avg_ticket_size,
    ROUND(AVG(vol_mom_growth), 2) AS avg_mom_growth
FROM upi_data
GROUP BY is_festive
ORDER BY is_festive DESC;


-- ------------------------------------------------
-- Query 3 - Top 10 Spike Months
-- ------------------------------------------------
SELECT
    month,
    year,
    ROUND(upi_volume_mn, 2) AS upi_volume_mn,
    ROUND(upi_value_cr, 2) AS upi_value_cr,
    ROUND(avg_ticket_size, 2) AS avg_ticket_size,
    ROUND(vol_mom_growth, 2) AS vol_mom_growth,
    COALESCE(festival, 'No Festival') AS festival
FROM upi_data
WHERE vol_mom_growth IS NOT NULL
ORDER BY vol_mom_growth DESC
LIMIT 10;


-- ------------------------------------------------
-- Query 4 - Quarterly Seasonality
-- ------------------------------------------------
SELECT
    CASE
        WHEN month IN ('Apr', 'May', 'Jun')
            THEN 'Q1 (Apr-Jun)'
        WHEN month IN ('Jul', 'Aug', 'Sep')
            THEN 'Q2 (Jul-Sep)'
        WHEN month IN ('Oct', 'Nov', 'Dec')
            THEN 'Q3 (Oct-Dec)'
        WHEN month IN ('Jan', 'Feb', 'Mar')
            THEN 'Q4 (Jan-Mar)'
    END AS fiscal_quarter,
    COUNT(*) AS total_months,
    ROUND(SUM(upi_volume_mn), 2) AS total_volume_mn,
    ROUND(AVG(upi_volume_mn), 2) AS avg_volume_mn,
    ROUND(SUM(upi_value_cr), 2) AS total_value_cr,
    ROUND(AVG(upi_value_cr), 2) AS avg_value_cr,
    ROUND(AVG(avg_ticket_size), 2) AS avg_ticket_size,
    ROUND(AVG(psi_score), 2) AS avg_psi_score
FROM upi_data
GROUP BY fiscal_quarter
ORDER BY avg_volume_mn DESC;


-- ------------------------------------------------
-- Query 5 - PSI Stress Periods
-- ------------------------------------------------
SELECT
    month,
    year,
    ROUND(psi_score, 2) AS psi_score,
    ROUND(upi_volume_mn, 2) AS upi_volume_mn,
    ROUND(avg_ticket_size, 2) AS avg_ticket_size,
    ROUND(vol_mom_growth, 2) AS vol_mom_growth,
    COALESCE(festival, 'No Festival') AS festival,
    CASE
        WHEN psi_score >= 75 THEN 'High Stress'
        WHEN psi_score >= 50 THEN 'Moderate Stress'
        WHEN psi_score >= 25 THEN 'Low Stress'
        ELSE 'Minimal Stress'
    END AS stress_level
FROM upi_data
WHERE psi_score IS NOT NULL
ORDER BY psi_score DESC
LIMIT 15;