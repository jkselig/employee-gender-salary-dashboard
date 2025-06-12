# 📊 Employee Gender & Salary Dashboard

This project analyzes employee demographics, salaries, and departmental structure using SQL and Tableau. It is based on a modified version of the MySQL Sample Employee Database and is designed to demonstrate data wrangling, analysis, and visualization techniques.

---

## 📁 Project Structure

employee-gender-salary-dashboard/
├── sql/
│ └── dashboard_queries.sql
├── tableau/
│ └── employee_dashboard.twbx
├── README.md


---

## 🧠 Insights & Analysis

The project consists of four key tasks:

### 1. 📅 **Employees by Gender and Year**
- Counted the number of employees by gender across each hire year since 1990.

### 2. 🧑‍💼 **Active Department Managers Over Time**
- Analyzed which managers were active during each calendar year by comparing their start and end dates to a list of calendar years.
- Visualized as an **area graph** showing total active managers over time by department.

### 3. 💵 **Average Salary by Department and Gender**
- Calculated the average salary across departments and gender, focusing on data before 2002.

### 4. ⚙️ **Dynamic Salary Range Analysis**
- Created a stored procedure to calculate average male and female salaries per department within a user-defined salary range.
- Visualized as a **dual bar chart** comparing gender pay gaps dynamically.

---

## 🗂 Data Source

The dataset used is a **modified version** of the [MySQL Sample Employee Database](https://github.com/datacharmer/test_db).

🔽 You can download the version used in this project here:  
📥 [employees_mod.sql (Dropbox)](https://www.dropbox.com/scl/fi/765wqr9asv49s6d80fbnn/employees_mod.sql?rlkey=udaohjkrma1g92lsl08ftn107&e=1&dl=0)

> ⚠️ For educational use only. All employee data is fictional.

---

## 📊 Tableau Dashboard

You can explore the interactive dashboard online here:  
🔗 [Employee Gender & Salary Dashboard on Tableau Public](https://public.tableau.com/app/profile/jeremy.selig/viz/employee_dashboard_17497543296230/Dashboard1?publish=yes)

The dashboard includes:
- Line graphs showing employee count by gender over time
- Area graph displaying department manager activity across years
- Bar charts showing average salary by department and gender
- A dual bar chart driven by a stored procedure that compares average male and female salaries within a user-defined salary range

---

## 🛠 Tools Used
- **SQL** (MySQL Workbench)
- **Tableau Public**
- **GitHub**

---

## 🚀 How to Use
1. Clone the repo or download the SQL file.
2. Import the `employees_mod.sql` file into your MySQL database.
3. Run the queries in `dashboard_queries.sql` to generate data views.
4. Open the `employee_dashboard.twbx` Tableau file in Tableau Public Desktop or view it online.

---

## 📬 Contact

**Jeremy Selig**  
[Tableau Public Profile](https://public.tableau.com/app/profile/jeremy.selig)

