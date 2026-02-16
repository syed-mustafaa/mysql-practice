# MySQL Practice Repository

This repository contains structured MySQL practice queries covering basic to advanced SQL concepts. All queries are organized by topic for easy navigation and revision.

## 🎯 Purpose

- **Learning**: Build and strengthen MySQL fundamentals through hands-on practice
- **Interview Prep**: Master SQL concepts commonly tested in technical interviews
- **Portfolio**: Demonstrate practical SQL skills to recruiters

## 📚 Topics Covered

### Basics
- SELECT statements
- WHERE clauses
- ORDER BY sorting
- LIMIT and pagination

### Joins
- INNER JOIN
- SELF JOIN
- LEFT/RIGHT JOIN
- Multiple table joins

### Subqueries
- Scalar subqueries
- Correlated subqueries
- EXISTS and NOT EXISTS
- Subqueries in SELECT, WHERE, and FROM

### Constraints
- PRIMARY KEY
- FOREIGN KEY
- UNIQUE
- NOT NULL
- CHECK constraints

### Interview Questions
- Company-specific SQL problems
- LeetCode-style database questions
- Real-world scenario queries

### Window Functions (Advanced)
- Ranking: `ROW_NUMBER`, `RANK`, `DENSE_RANK`, `NTILE`
- Analytic: `LEAD`, `LAG`, `FIRST_VALUE`
- Aggregates over windows: Running totals, moving averages

## 🛠️ Tools Used

- **MySQL Shell** (`mysqlsh`)
- **MySQL Server** 8.x
- **Database**: Custom practice schemas

## 📁 Repository Structure

```
mysql-practice/
├── basics/           # Fundamental SQL queries
├── joins/            # JOIN operations
├── subqueries/       # Nested queries
├── constraints/      # Database constraints
├── window_functions/ # Advanced analytics (RANK, LEAD/LAG)
└── interview_questions/  # Interview-style problems
```

## 🚀 Getting Started

1. **Clone the repository**
   ```bash
   git clone https://github.com/your-username/mysql-practice.git
   cd mysql-practice
   ```

2. **Set up MySQL**
   - Install MySQL 8.x
   - Create practice databases as needed

3. **Run queries**
   - Open any `.sql` file
   - Execute in MySQL Shell or your preferred SQL client

## 💡 Query Format

Each SQL file follows this structure:

```sql
-- Problem:
-- [Clear description of what the query accomplishes]

-- Schema:
-- [Relevant table structure if needed]

-- Solution:
SELECT ...
FROM ...
WHERE ...;

-- Expected Output:
-- [Sample result or explanation]
```

## 📈 Progress Tracker

- [x] Basic SELECT queries
- [x] WHERE and filtering
- [x] JOIN operations
- [x] Subqueries
- [ ] Advanced aggregations
- [ ] Window functions
- [ ] Stored procedures

## 🎓 Learning Resources

- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [LeetCode Database Problems](https://leetcode.com/problemset/database/)
- [HackerRank SQL](https://www.hackerrank.com/domains/sql)

## 📧 Contact

Feel free to reach out for SQL discussions or collaboration opportunities!

---

**⭐ If you find this repository helpful, please consider giving it a star!**
