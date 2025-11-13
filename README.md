# 🏥 Simulated Healthcare Database – ADA Project

This project was developed as part of the **Database and Algorithm Design and Analysis (ADA)** course at **Universidad Católica de Colombia**.  
It simulates the data management system of a healthcare institution, implementing a **relational database in PostgreSQL** and a **Python optimization module** comparing sorting algorithms.

---

## 📘 Overview

The project aims to model and simulate a hospital’s information system using modern database design principles and algorithmic optimization techniques.

Although the dataset is **simulated (not real hospital data)**, the project establishes a strong foundation for future work on interoperable and secure medical information systems.

---

## 🎯 Objectives

1. Design a **normalized Entity–Relationship Model (ERD)** for hospital data management.  
2. Implement the ERD in **PostgreSQL**, including data integrity and sample queries.  
3. Compare the efficiency of **Bubble Sort**, **Merge Sort**, and **Quick Sort** in organizing patient data by age using **Python**.  

---

## ⚙️ Technologies Used

| Component | Technology |
|------------|-------------|
| Database | PostgreSQL (via Supabase) |
| Programming | Python 3 |
| Visualization | Matplotlib |
| Version Control | Git + GitHub |
| Documentation | PDF report + Markdown |

---

## 🧩 Database Structure

Main entities implemented:

- **Patient**: stores personal and contact data.  
- **Doctor**: professional and specialty info.  
- **Appointment**: date, time, and status of medical visits.  
- **MedicalRecord**: diagnoses, treatments, and notes.  
- **Medication** and **Prescription**: medicine and dosage management.  
- **Department**, **Inventory**, and **User** tables for institutional control.  

Refer to [`database/schema.sql`](database/schema.sql) for full SQL structure.

---

## 🧠 Algorithm Comparison

The Python module compares three sorting algorithms used to order patient ages.

| Algorithm | Complexity | Execution Time (s) |
|------------|-------------|--------------------|
| Bubble Sort | O(n²) | 0.000542 |
| Merge Sort | O(n log n) | 0.000250 |
| Quick Sort | O(n log n) | 0.000085 |

> ⚙️ Since the dataset contains fewer than 100 records, the time differences are small.  
> However, the experiment shows how algorithmic complexity impacts performance for larger datasets.

Run the comparison locally:
```bash
python python/sorting_algorithms.py
