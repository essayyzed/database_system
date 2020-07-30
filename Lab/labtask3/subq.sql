mysql> SELECT EMP_FNAME,EMP_LNAME FROM EMPLOYEE WHERE EMP_NUM IN (SELECT EMP_NUM 
    -> FROM EMPLOYEE NATURAL JOIN HOURS 
    -> GROUP BY EMP_NUM HAVING SUM(HOURS_PER_ATTRACT) > (SELECT AVG(HOURS_PER_ATTRACT) FROM HOURS));
+-----------+------------+
| EMP_FNAME | EMP_LNAME  |
+-----------+------------+
| Emma      | Calderdale |
| Marshel   | Ricardo    |
| Arif      | Arshad     |
| Enrica    | Denver     |
| Mirrelle  | Namowa     |
+-----------+------------+
5 rows in set (0.01 sec)



mysql> SELECT DISTINCT PARK_CODE,PARK_NAME 
    -> FROM THEMEPARK NATURAL JOIN TICKET 
    -> WHERE TICKET_PRICE > (SELECT AVG(TICKET_PRICE) FROM TICKET);
+-----------+---------------+
| PARK_CODE | PARK_NAME     |
+-----------+---------------+
| SP4533    | AdventurePort |
| FR1001    | FairyLand     |
| ZA1342    | GoldTown      |
| UK3452    | PleasureLand  |
+-----------+---------------+
4 rows in set (0.01 sec)

mysql> SELECT DISTINCT(emp_fname), emp_lname, date_worked, 
    -> (SELECT AVG(hours_per_attract) FROM HOURS) AS AVGPRICE, hours_per_attract - 
    -> (SELECT AVG(hours_per_attract) FROM HOURS) 
    -> AS DIFF FROM HOURS NATURAL JOIN EMPLOYEE;
+-----------+------------+-------------+----------+---------+
| emp_fname | emp_lname  | date_worked | AVGPRICE | DIFF    |
+-----------+------------+-------------+----------+---------+
| Emma      | Calderdale | 2007-05-18  |   4.9091 |  1.0909 |
| Emma      | Calderdale | 2007-05-20  |   4.9091 |  1.0909 |
| Marshel   | Ricardo    | 2007-05-18  |   4.9091 |  1.0909 |
| Arif      | Arshad     | 2007-05-23  |   4.9091 | -1.9091 |
| Arif      | Arshad     | 2007-05-21  |   4.9091 |  1.0909 |
| Arif      | Arshad     | 2007-05-22  |   4.9091 | -1.9091 |
| Enrica    | Denver     | 2007-05-21  |   4.9091 |  1.0909 |
| Enrica    | Denver     | 2007-05-22  |   4.9091 |  1.0909 |
| Mirrelle  | Namowa     | 2007-05-18  |   4.9091 | -1.9091 |
| Mirrelle  | Namowa     | 2007-05-19  |   4.9091 |  1.0909 |
+-----------+------------+-------------+----------+---------+
10 rows in set (0.00 sec)



> SELECT PARK_NAME FROM THEMEPARK 
    -> WHERE PARK_CODE NOT IN (SELECT DISTINCT PARK_CODE FROM SALES);
+---------------+
| PARK_NAME     |
+---------------+
| Efling        |
| AdventurePort |
| Labyrinthe    |
| MiniLand      |
+---------------+
4 rows in set (0.00 sec)


> select DISTINCT(park_name) 
    -> FROM THEMEPARK NATURAL JOIN 
    -> SALES 
    -> WHERE THEMEPARK.park_code = SALES.park_code;
+--------------+
| park_name    |
+--------------+
| FairyLand    |
| PleasureLand |
| GoldTown     |
+--------------+
3 rows in set (0.01 sec)


| park_name    |
