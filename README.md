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
- REGEXP (Pattern matching with Regular Expressions)
- LIKE (`%a`, `a%`, `_`) with vowel examples
- Euclidean Distance (`SQRT`, `POW`) — nearest/farthest point problems
- Aliases (`AS`) — giving temporary names to columns and tables

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
- PRIMARY KEY & UNIQUE
- FOREIGN KEY (Referential Integrity & Actions)
- NOT NULL, DEFAULT, and CHECK constraints
- Data integrity and validation rules

### Interview Questions
- Company-specific SQL problems
- LeetCode-style database questions
- Real-world scenario queries

### Stored Procedures & Logic
**"Shows you can write database logic"**
- Creating Procedures (`DELIMITER`, `CREATE PROCEDURE`)
- Parameters (`IN`, `OUT`, `INOUT`)
- Control Flow (`IF/ELSE`, Loops)
- Transaction Management (`COMMIT`, `ROLLBACK`)

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
├── stored_procedures/ # Reusable logic (Procedures, Transactions)
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
- [x] Window functions
- [x] Stored procedures

## 🎓 Learning Resources

- [MySQL Official Documentation](https://dev.mysql.com/doc/)
- [LeetCode Database Problems](https://leetcode.com/problemset/database/)
- [HackerRank SQL](https://www.hackerrank.com/domains/sql)

## 📧 Contact

Feel free to reach out for SQL discussions or collaboration opportunities!

---

**⭐ If you find this repository helpful, please consider giving it a star!**
