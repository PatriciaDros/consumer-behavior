# MySQL & Workbench Quick Start / Stop Guide

This guide provides step-by-step instructions for stopping and restarting MySQL and Workbench, plus a handy cheat sheet for common MySQL operations. Perfect for quick reference in your **Customer Behavior** project.

---

## Part 1: Stopping MySQL and Workbench

1. **Close MySQL Workbench**

   - Quit the app (`Cmd+Q`). Workbench is just a client—it does **not** run MySQL.

2. **Stop MySQL server** (Homebrew installation)
   ```bash
   brew services stop mysql
   ```

````

3. **Verify MySQL has stopped**

   ```bash
   ps aux | grep mysql
   ```

   * Only the `grep mysql` process should appear. No `mysqld` or `mysqld_safe`.

---

## Part 2: Restarting MySQL and Workbench

1. **Start MySQL server**

   ```bash
   brew services start mysql
   ```

2. **Verify MySQL is running**

   ```bash
   ps aux | grep mysql
   ```

   * You should see the `mysqld` process.

3. **Open MySQL Workbench**

   * Launch Workbench from Applications.
   * Select your saved **Local MySQL connection** and click **Connect**.

---

## Part 3: Common MySQL Workbench Operations Cheat Sheet

| Task                  | Command / Action                                                                 |
| --------------------- | -------------------------------------------------------------------------------- |
| Show all databases    | `SHOW DATABASES;`                                                                |
| Select a database     | `USE my_database;`                                                               |
| Create a new database | `CREATE DATABASE my_database;`                                                   |
| Drop a database       | `DROP DATABASE my_database;`                                                     |
| Show all tables       | `SHOW TABLES;`                                                                   |
| Create a table        | `sql CREATE TABLE users (id INT PRIMARY KEY, name VARCHAR(50)); `                |
| Drop a table          | `DROP TABLE users;`                                                              |
| Insert data           | `sql INSERT INTO users (id, name) VALUES (1, 'Tricia'); `                        |
| Select data           | `SELECT * FROM users;`                                                           |
| Update data           | `UPDATE users SET name='Tricia Q' WHERE id=1;`                                   |
| Delete data           | `DELETE FROM users WHERE id=1;`                                                  |
| Change root password  | `sql ALTER USER 'root'@'localhost' IDENTIFIED BY 'NewPass1!'; FLUSH PRIVILEGES;` |
| Exit MySQL query tab  | `EXIT;` or close the tab                                                         |

💡 **Tips**

* Always **start MySQL server** before opening Workbench.
* Create **multiple connections** for different projects or users.
* Use **SQL Editor tabs** in Workbench for running repetitive queries efficiently.

---

*Saved for the Customer Behavior project repository.*

```

---

I can also **push this directly to your `customer-behavior` repo** in a file called `mysql_workbench_guide.md` if you want.

Do you want me to do that?
```
````
