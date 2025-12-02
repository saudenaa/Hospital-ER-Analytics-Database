# Hospital ER Analytics Database

A clean and well-structured SQL database that models how an Emergency Room (ER) manages patients, staff, diagnoses, insurance, and visit activity. This project was built to make healthcare data easier to analyse and understand, especially for reporting, performance tracking, and operational insights.

---

## 📌 Project Overview
This project simulates a real hospital Emergency Room data system. It includes:

- **Patients** and their basic information  
- **Staff members** and their roles  
- **Diagnoses** with associated medical charges  
- **Insurance providers**  
- **ER visits**, connecting all the above together  

The database is designed to reflect how real hospitals and clinics structure their data behind the scenes.

---

## 📊 ER Diagram
This diagram shows how all tables are connected in the database.
![ERD Diagram](images/ERD_diagram.png)


---

## 📁 What’s Inside This Project

### **1. Database Structure**
A fully organised relational model with:
- Patient table  
- Staff table  
- Diagnosis table  
- Insurance table  
- Visit table  

### **2. Sample Data**
Includes realistic, synthetic ER data so the system can be tested and analysed.

### **3. Reporting Views**
Two built-in reports:
- **Patient Visit Report** – Complete visit history  
- **Staff Activity Summary** – Staff workload + revenue impact  

### **4. Security Roles**
Simulated hospital-style access:
- Admin  
- Limited access  
- Read-only  

---

## ▶️ How to Use This Project
1. Create a new SQL Server database  
2. Run the **schema file**  
3. Run the **data file**  
4. Run the **views file**  
5. (Optional) Run the **security file**

After that, the system is ready to query and explore.

---

## 📂 Folder Structure
/sql
01_database_schema.sql
02_insert_data.sql
03_analytics_views.sql
04_security_roles.sql

/images
ERD_diagram.png

/docs
project_documentation.pdf


---

## ✨ Future Improvements
- Add treatment & medication tables  
- Add billing & insurance claims  
- Build Power BI dashboards  
- Add machine learning–ready datasets  

---

## 👤 Author
**Amy Sauden**  
Cybersecurity & Data Technology Student  
Passionate about data modelling, healthcare analytics, and building practical systems.


