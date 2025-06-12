-- Task 1: Count the number of employees grouped by hire year and gender
SELECT 
    YEAR(de.from_date) AS calendar_year,  -- Extract year from department entry date
    e.gender,                              -- Employee gender
    COUNT(e.emp_no) AS num_of_employees    -- Total number of employees in each group
FROM
    t_employees e
    JOIN t_dept_emp de ON e.emp_no = de.emp_no
WHERE
    YEAR(de.from_date) >= 1990             -- Only include employees from 1990 onward
GROUP BY 
    YEAR(de.from_date), e.gender
ORDER BY 
    calendar_year;
    
-- Task 2: Identify department managers active during each calendar year
SELECT 
    d.dept_name,                                -- Department name
    ee.gender,                                  -- Manager gender
    dm.emp_no,                                  -- Manager employee number
    dm.from_date,                               -- Manager start date
    dm.to_date,                                 -- Manager end date
    e.calendar_year,                            -- Year being analyzed
    CASE 
        WHEN YEAR(dm.to_date) >= e.calendar_year 
          AND YEAR(dm.from_date) <= e.calendar_year 
        THEN 1 ELSE 0 
    END AS active                               -- Flag if manager was active in that year
FROM
    (SELECT 
        YEAR(hire_date) AS calendar_year
     FROM t_employees
     GROUP BY calendar_year) e                  -- All distinct years from hire dates
    CROSS JOIN t_dept_manager dm                -- Pair each year with every manager
    JOIN t_departments d ON d.dept_no = dm.dept_no
    JOIN t_employees ee ON dm.emp_no = ee.emp_no
ORDER BY 
    dm.emp_no, calendar_year;
    
-- Task 3: Average salary by department and gender for years up to 2002
SELECT 
    e.gender,                                   -- Employee gender
    d.dept_name,                                -- Department name
    ROUND(AVG(s.salary), 2) AS salary,          -- Average salary (rounded)
    YEAR(s.from_date) AS calendar_year          -- Year from salary record
FROM
    t_salaries s
    JOIN t_employees e ON e.emp_no = s.emp_no
    JOIN t_dept_emp de ON e.emp_no = de.emp_no
    JOIN t_departments d ON d.dept_no = de.dept_no
GROUP BY 
    d.dept_no, e.gender, calendar_year
HAVING 
    calendar_year <= 2002                       -- Filter to only years 2002 and earlier
ORDER BY 
    d.dept_no;
    
-- Task 4: Create a stored procedure to filter salary averages by department and gender, within a salary range

-- Remove the procedure if it exists
DROP PROCEDURE IF EXISTS filter_salary;

-- Create procedure with two input parameters: min and max salary
DELIMITER $$

CREATE PROCEDURE filter_salary (
    IN p_min_salary FLOAT, 
    IN p_max_salary FLOAT
)
BEGIN
    SELECT 
        e.gender, 
        d.dept_name, 
        AVG(s.salary) AS avg_salary             -- Average salary for gender & department within range
    FROM
        t_salaries s
        JOIN t_employees e ON s.emp_no = e.emp_no
        JOIN t_dept_emp de ON de.emp_no = e.emp_no
        JOIN t_departments d ON d.dept_no = de.dept_no
    WHERE 
        s.salary BETWEEN p_min_salary AND p_max_salary
    GROUP BY 
        d.dept_no, e.gender;
END$$

DELIMITER ;

-- Example procedure call
CALL filter_salary(50000, 90000);



