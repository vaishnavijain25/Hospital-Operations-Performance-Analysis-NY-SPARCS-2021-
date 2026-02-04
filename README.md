#  Hospital Operations & Performance Analysis  
### (NY SPARCS Inpatient Discharges – 2021)

---

##  Project Overview

This project analyzes **hospital inpatient operations, efficiency, and costs** using the **NY SPARCS De-Identified Inpatient Discharges (2021)** dataset.

The goal is to evaluate whether hospitals are running smoothly and identify opportunities for improving:

- Staff planning  
- Bed utilization  
- Cost control  
- Emergency workload management  

The project follows a **real-world data analyst workflow** using **Excel, SQL, Python, and Power BI**, designed for **executive, operations, and finance stakeholders**.

---

##  Business Goals

- Assess hospital operational efficiency  
- Identify high-cost and high length-of-stay (LOS) drivers  
- Improve:
  -  Bed utilization  
  -  Staff planning  
  -  Cost control  
  -  Emergency admissions management  

---

##  Dataset

**Source:** NY SPARCS Inpatient Discharges (De-Identified) – 2021  

**Original Dataset Size**
- Rows: 2.13 million  
- Columns: 33  

**Used in This Project**
- Rows: 100,000 (sampled due to system limitations)

**Key Fields Used**
- Admission type  
- Length of stay (LOS)  
- Diagnosis (CCSR)  
- Hospital / Facility  
- Payment typology  
- Emergency indicator  
- Total charges  
- Total costs  

>  *Note:* Sampling was done only due to hardware constraints.  
> The analysis logic is fully scalable to the complete dataset.

---

##  Tools & Workflow

### 1. Excel – Data Cleaning & Exploration

**Purpose:** Initial data validation and understanding  

**Steps Performed**
- Opened and explored raw data  
- Checked date formats  
- Handled missing values  
- Removed duplicates  
- Performed consistency checks  
- Validated numeric columns (LOS, costs, charges)  

**Analysis**
- Pivot tables for patient counts, LOS, and costs  
- Quick charts for high-level insights  

---

### 2️. SQL – Business Impact Analysis

**Purpose:** Answer stakeholder-driven business questions  

**SQL Concepts Used**
- `COUNT`, `SUM`, `AVG`  
- `MIN`, `MAX`  
- `GROUP BY`, `ORDER BY`  
- `WHERE`, `HAVING`  
- `CASE WHEN`  
- `DISTINCT`, `TOP`  
- `JOIN`, `LEFT JOIN`  

**Key Insights Generated**
- Top diagnoses by patient volume and cost  
- Emergency vs non-emergency cost comparison  
- Length of stay by hospital and age group  
- Revenue vs cost by payment type  

---

### 3️. Python – Data Cleaning, EDA & Insights

**Purpose:** Deeper exploratory analysis and validation  

**Steps Performed**
- Data cleaning & preprocessing  
- Exploratory Data Analysis (EDA)  
- Visualization of:
  - Cost drivers  
  - Length of stay patterns  
  - Age-group trends  

---

### 4️. Power BI – Stakeholder Dashboards

**Purpose:** Communicate insights clearly to decision-makers  

####  Dashboard Pages

##### 🔹 Page 1: Executive Overview  
**Audience:** Hospital Directors / Senior Management  

##### 🔹 Page 2: Operations View  
**Audience:** Hospital Operations & Admin  

##### 🔹 Page 3: Cost & Clinical View  
**Audience:** Finance & Medical Teams  

---

##  Key Insights

- Emergency admissions contribute **disproportionately higher costs**
- Older age groups (50+) have **longer average hospital stays**
- Certain diagnoses drive **both high costs and long LOS**
- Government insurance dominates patient volume but shows **margin pressure**
- Private insurance demonstrates **more stable revenue-to-cost balance**

---
