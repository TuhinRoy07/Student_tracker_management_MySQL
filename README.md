# 🎓 IBM–GIZ Digital Skilling Program — Database & SQL Analytics

A full-scale **MySQL project** simulating a real-world digital skilling program (modeled on the IBM–GIZ "LITE / LITE-DEEP" training initiative). It combines relational schema design, realistic synthetic data generation, and a 25-topic SQL interview-style query set covering everything from basic `SELECT`s to window functions.

---

## 📌 Overview

This project models a two-tier training program:

- **LITE Batch** — learners enrolled in a single foundational course.
- **LITE/DEEP Batch** — a subset of LITE learners who went on to complete additional courses, submit projects, and provide attendance/training proof.

The dataset (100 LITE learners, 20 of whom progress to LITE/DEEP) is fully relational, referentially linked via `learner_id`, and enriched with realistic fields — demographics, state/district/region, EWS & disability flags, course credentials, and performance marks — making it a solid base for both **database design** and **SQL analytics** practice.

---

## 🗃️ Database Schema

**Database:** `ibm_giz_training_db`

### Table 1 — `lite_batch`
Stores core learner records for the foundational (LITE) course.

| Column | Type | Notes |
|---|---|---|
| `learner_id` | VARCHAR(30) | **Primary Key** |
| `first_name`, `last_name` | VARCHAR(50) | |
| `email_id` | VARCHAR(150) | **Unique**, Not Null |
| `contact_no`, `alternative_contact` | VARCHAR(15) | |
| `beneficiary_state`, `district`, `region` | VARCHAR | Geographic segmentation |
| `batch_id` | VARCHAR(50) | |
| `date_of_birth` | DATE | |
| `gender` | VARCHAR(20) | |
| `disability` | VARCHAR(5) | `CHECK` constrained to Yes/No |
| `ews_category`, `ews_document` | VARCHAR | Economically Weaker Section flag + proof |
| `occupation`, `institution_type` | VARCHAR | |
| `lite_course_name` | VARCHAR(150) | |
| `credential_order_id` | VARCHAR(100) | **Unique** |
| `remarks` | VARCHAR(255) | |
| `marks` | INT | Randomly assigned (50–100) |
| `created_at` | DATETIME | Defaults to `CURRENT_TIMESTAMP` |

### Table 2 — `lite_deep_batch`
Tracks the subset of learners who advanced to additional courses.

| Column | Type | Notes |
|---|---|---|
| `tracking_id` | INT | **Primary Key**, Auto Increment |
| `learner_id` | VARCHAR(30) | **Foreign Key** → `lite_batch(learner_id)` |
| `first_name`, `last_name`, `email_id` | VARCHAR | |
| `course_1_name` / `_credential_id` | VARCHAR | |
| `course_2_name` / `_credential_id` | VARCHAR | |
| `course_3_name` / `_credential_id` | VARCHAR | Optional third course (nullable) |
| `project_submission_link` | VARCHAR(255) | |
| `training_pictures`, `attendance_proof` | VARCHAR(255) | |
| `region` | VARCHAR(50) | |
| `marks` | INT | Synced from `lite_batch` |
| `remarks` | VARCHAR(255) | |

**Relationship:** `lite_deep_batch.learner_id` → `lite_batch.learner_id` (one-to-one subset via `fk_deep_learner`)

---

## ⚙️ Key Features

- 🏗️ **Relational schema** with `PRIMARY KEY`, `FOREIGN KEY`, `UNIQUE`, and `CHECK` constraints
- 🧪 **120 synthetic records** (100 LITE + 20 LITE/DEEP) spanning 15+ Indian states across all major regions
- 🎯 **Randomized scoring logic** — marks generated with `RAND()`, then synced across related tables via `UPDATE ... INNER JOIN`
- 🔐 **Safe DML demonstrations** — `UPDATE` wrapped in `START TRANSACTION` / `ROLLBACK`, and a no-op `DELETE` using a guaranteed-nonexistent ID
- 📊 **25-topic SQL query suite** (Part 2), including:
  - Filtering: `WHERE`, `BETWEEN`, `IN`, `LIKE`
  - Sorting & limiting: `ORDER BY`, `LIMIT`, `DISTINCT`
  - Joins: `INNER JOIN`, `LEFT JOIN`
  - Aggregation: `COUNT`, `SUM`, `AVG`, `MIN`/`MAX`, `GROUP BY`, `HAVING`
  - Conditional logic: `CASE` expressions for performance banding
  - `NULL` handling
  - Subqueries (average comparison, second-highest value)
  - Window functions: `DENSE_RANK()`, `RANK() OVER (PARTITION BY ...)`

---

## 🚀 How to Run

```bash
mysql -u root -p < ibm_giz_training_db.sql
```

Or open the script in **MySQL Workbench** and execute it top to bottom. The script is self-contained — it drops and recreates the database, so it's safe to re-run.

---

## 🧠 What This Demonstrates

| Skill Area | Where |
|---|---|
| Schema design & constraints | Table creation (Part 1) |
| Referential integrity | `FOREIGN KEY` between the two tables |
| Bulk data seeding | 120-row multi-insert statements |
| Transactional safety | `START TRANSACTION` / `ROLLBACK` demo |
| Analytical SQL | Aggregations, `GROUP BY`/`HAVING`, subqueries |
| Window functions | `DENSE_RANK()`, `RANK() OVER (PARTITION BY)` |
| Real-world data modeling | EWS/disability flags, credential IDs, regional segmentation |

---

## 🛠️ Tech Stack

- **MySQL 8+** (uses window functions — requires MySQL 8.0 or later)
- Pure SQL — no external dependencies

---

## 📂 File Structure

```
├── ibm_giz_training_db.sql   # Full script: schema, seed data, and 25-query analytics suite
└── README.md
```

---

## ✍️ Author

**Tuhin** — BCA Final Year, JIS University, Kolkata
Focus: Data Analytics · SQL · AI/ML
