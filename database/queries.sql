-- =================================================================
-- DONATION CENTER - COMPREHENSIVE ANALYTICS DASHBOARD
-- =================================================================
-- Author: Rodrigo Murilo Barros
-- Created for: Donation Program
-- Institution: [One of Canada's Top 3 Universities]
-- Date: February 2025
-- Purpose: Data-driven management of clothing donations for students
-- =================================================================

-- -------------------------------------------------------
-- BASIC CHECKOUT DETAILS REPORT
-- Lists individual checkout transactions with detailed item information
-- Useful for auditing specific donations and tracking item movement
-- -------------------------------------------------------

SELECT 
	   c.check_out_id,
       c.date,
       i.item_cat,
	   i.item_name,
	   c.quantity
FROM 
	check_out c
LEFT JOIN item i ON c.item_id = i.item_id

-- -------------------------------------------------------
-- ITEM POPULARITY REPORT
-- Summarizes total quantity checked out for each item
-- Helps identify most frequently donated items and inventory planning needs
-- -------------------------------------------------------

SELECT
	I.item_id,
    i.item_name,
    sum(c.quantity) AS check_out_quantity
FROM
	check_out c
    INNER JOIN item i ON c.item_id = i.item_id
GROUP BY
	 i.item_id,
     i.item_name
ORDER BY item_id ASC

-- -------------------------------------------------------
-- MONTHLY DONATION TRENDS REPORT
-- Provides comprehensive monthly metrics on donation center activity
-- Tracks student reach, transaction volume, and donation quantities over time
-- -------------------------------------------------------
SELECT 
    DATE_FORMAT(c.date, '%b %Y') AS month,
    COUNT(DISTINCT c.student_id) AS unique_students_that_checked_out,
    COUNT(*) AS total_transactions,
    SUM(c.quantity) AS total_checked_out_quantity,
    TRUNCATE(SUM(c.quantity) / COUNT(*), 0) AS avg_items_per_transaction
FROM 
    check_out c
GROUP BY
    DATE_FORMAT(c.date, '%b %Y')
ORDER BY
    month DESC

-- -------------------------------------------------------
-- STUDENT PROGRAM DISTRIBUTION REPORT
-- Analyzes student demographics by academic program
-- Calculates the percentage distribution to understand which programs utilize the service most
-- -------------------------------------------------------
SELECT 
   program,
   COUNT(*) AS student_count,
   TRUNCATE((COUNT(*) * 100.0) / (SELECT COUNT(*)FROM student), 2) AS percentage
FROM 
   student
WHERE 
   program IS NOT NULL
GROUP BY 
   program
ORDER BY 
   student_count DESC;
   
-- -------------------------------------------------------
-- INVENTORY USAGE REPORT (LAST 4 MONTHS)
-- Compares current stock levels against recent demand
-- Identifies high-turnover items and potential restocking needs
-- -------------------------------------------------------
SELECT 
   i.item_id,
   i.item_name,
   i.item_cat,
   i.item_size,
   inv.quantity AS current_stock,
   COALESCE(SUM(co.quantity), 0) AS checked_out_last_4_months
FROM 
   inventory inv
JOIN 
   item i ON inv.item_id = i.item_id
LEFT JOIN 
   check_out co ON i.item_id = co.item_id AND co.date >= DATE_SUB(CURDATE(), INTERVAL 4 MONTH)
GROUP BY 
   i.item_id, i.item_name, i.item_cat, i.item_size, inv.quantity
ORDER BY 
   checked_out_last_4_months DESC;
   
-- -------------------------------------------------------
-- STAFF PAYROLL REPORT (MONTHLY)
-- Calculates staff compensation based on actual hours worked
-- Tracks shift coverage, labor hours, and payroll expenses for budget management
-- -------------------------------------------------------
SELECT 
   s.staff_id,
   s.first_name,
   s.last_name,
   s.position,
   COUNT(r.row_id) AS total_shifts,
   SUM(TIMESTAMPDIFF(HOUR, sh.start_time, sh.end_time)) AS total_hours,
   s.hourly_rate,
   ROUND(SUM(TIMESTAMPDIFF(HOUR, sh.start_time, sh.end_time)) * s.hourly_rate, 2) AS total_pay
FROM 
   staff s
LEFT JOIN 
   rota r ON s.staff_id = r.staff_id
LEFT JOIN 
   shift sh ON r.shift_id = sh.shift_id
WHERE 
   r.date BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY 
   s.staff_id, s.first_name, s.last_name, s.hourly_rate
ORDER BY 
   total_pay DESC;
