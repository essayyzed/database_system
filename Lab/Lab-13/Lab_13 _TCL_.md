```mysql
MariaDB [university]> SET AUTCOMMIT = 0
    -> ;
ERROR 1193 (HY000): Unknown system variable 'AUTCOMMIT'
MariaDB [university]> SET AUTOCOMMIT = 0
    -> ;
Query OK, 0 rows affected (0.00 sec)

MariaDB [university]> UPDATE USERS
    -> SET PASSWORD ='teatime'
    -> WHERE uid = 1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [university]> UPDATE USERS
    -> SET type = 'academic'
    -> WHERE uid = 12;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [university]> SELECT * FROM USERS;
+-----+-----------+----------+----------+
| uid | user_name | password | type     |
+-----+-----------+----------+----------+
|   1 | zahoor    | teatime  | academic |
|   2 | fahad     | teatime  | student  |
|   4 | waqar     | teatime  | student  |
|   5 | amjad     | teatime  | academic |
|   6 | Majid     | teatime  | academic |
|   8 | Uzair     | teatime  | student  |
|   9 | Majeed    | teatime  | academic |
|  10 | Wajid     | teatime  | academic |
|  11 | Sajid     | teatime  | academic |
|  12 | Sajjad    | teatime  | academic |
|  13 | Rashid    | teatime  | academic |
|  14 | waqas.ali | teatime  | admin    |
|  15 | salman    | teatime  | student  |
+-----+-----------+----------+----------+
13 rows in set (0.00 sec)

MariaDB [university]> rollback;
Query OK, 0 rows affected (0.01 sec)

MariaDB [university]> SELECT * FROM USERS;
+-----+-----------+-----------+----------+
| uid | user_name | password  | type     |
+-----+-----------+-----------+----------+
|   1 | zahoor    | lunchtime | academic |
|   2 | fahad     | teatime   | student  |
|   4 | waqar     | teatime   | student  |
|   5 | amjad     | teatime   | academic |
|   6 | Majid     | teatime   | academic |
|   8 | Uzair     | teatime   | student  |
|   9 | Majeed    | teatime   | academic |
|  10 | Wajid     | teatime   | academic |
|  11 | Sajid     | teatime   | academic |
|  12 | Sajjad    | teatime   | student  |
|  13 | Rashid    | teatime   | academic |
|  14 | waqas.ali | teatime   | admin    |
|  15 | salman    | teatime   | student  |
+-----+-----------+-----------+----------+
13 rows in set (0.00 sec)

MariaDB [university]> DELETE FROM STUDENT;
Query OK, 9 rows affected (0.00 sec)

MariaDB [university]> SELECT * FROM USERS;
+-----+-----------+-----------+----------+
| uid | user_name | password  | type     |
+-----+-----------+-----------+----------+
|   1 | zahoor    | lunchtime | academic |
|   2 | fahad     | teatime   | student  |
|   4 | waqar     | teatime   | student  |
|   5 | amjad     | teatime   | academic |
|   6 | Majid     | teatime   | academic |
|   8 | Uzair     | teatime   | student  |
|   9 | Majeed    | teatime   | academic |
|  10 | Wajid     | teatime   | academic |
|  11 | Sajid     | teatime   | academic |
|  12 | Sajjad    | teatime   | student  |
|  13 | Rashid    | teatime   | academic |
|  14 | waqas.ali | teatime   | admin    |
|  15 | salman    | teatime   | student  |
+-----+-----------+-----------+----------+
13 rows in set (0.00 sec)

MariaDB [university]> SELECT * FROM STUDENT;
Empty set (0.00 sec)

MariaDB [university]> ROLLBACK;
Query OK, 0 rows affected (0.01 sec)

MariaDB [university]> SELECT * FROM STUDENT;
+----------+--------------+---------------+--------+-------------+--------------+
| roll_no  | st_name      | f_name        | gender | contact     | address      |
+----------+--------------+---------------+--------+-------------+--------------+
| P19-1000 | tre          | uyi           | Male   | 03331234560 | Lahore       |
| P19-1001 | tre          | uyi           | Male   | 03331234561 | Lahore       |
| P19-1003 | Ali Azmat    | Azmat Khan    | Male   | 03339177703 | Peshawar     |
| P19-1004 | Jamal Khan   | Samandar Khan | Male   | 03339177707 | peshawar     |
| P19-1005 | Kamran Jamal | Jamal Ali     | Male   | 03339177777 | Islamabad    |
| P19-1009 | Wajid        | Amjad         | Male   | 03339177702 | Lahore       |
| P19-6015 | Ali Khan     | Khan sb       | Male   | 03339174258 | asdjflasdjfl |
| p20-1234 | Majid Kamal  | Kamal Ahmad   | Male   | 123         | Kohat        |
| P20-6005 | Zubair Shah  | Shah Saud     | Male   | 75675       | hello        |
+----------+--------------+---------------+--------+-------------+--------------+
9 rows in set (0.00 sec)

MariaDB [university]> SHOW TABLES;
+----------------------+
| Tables_in_university |
+----------------------+
| academic_users       |
| student              |
| temporary            |
| users                |
+----------------------+
4 rows in set (0.00 sec)

MariaDB [university]> DELETE FROM STUDENT;
Query OK, 9 rows affected (0.00 sec)

MariaDB [university]> DELETE FROM USERS;
Query OK, 13 rows affected (0.00 sec)

MariaDB [university]> DELETE FROM TEMPORARY;
Query OK, 0 rows affected (0.01 sec)

MariaDB [university]> DELETE FROM ACADEMIC_USERS;
Query OK, 0 rows affected (0.01 sec)

MariaDB [university]> ROLLBACK;
Query OK, 0 rows affected (0.01 sec)

MariaDB [university]> SELECT * FROM STUDENT;
+----------+--------------+---------------+--------+-------------+--------------+
| roll_no  | st_name      | f_name        | gender | contact     | address      |
+----------+--------------+---------------+--------+-------------+--------------+
| P19-1000 | tre          | uyi           | Male   | 03331234560 | Lahore       |
| P19-1001 | tre          | uyi           | Male   | 03331234561 | Lahore       |
| P19-1003 | Ali Azmat    | Azmat Khan    | Male   | 03339177703 | Peshawar     |
| P19-1004 | Jamal Khan   | Samandar Khan | Male   | 03339177707 | peshawar     |
| P19-1005 | Kamran Jamal | Jamal Ali     | Male   | 03339177777 | Islamabad    |
| P19-1009 | Wajid        | Amjad         | Male   | 03339177702 | Lahore       |
| P19-6015 | Ali Khan     | Khan sb       | Male   | 03339174258 | asdjflasdjfl |
| p20-1234 | Majid Kamal  | Kamal Ahmad   | Male   | 123         | Kohat        |
| P20-6005 | Zubair Shah  | Shah Saud     | Male   | 75675       | hello        |
+----------+--------------+---------------+--------+-------------+--------------+
9 rows in set (0.00 sec)

MariaDB [university]> SELECT * FROM USERS;
+-----+-----------+-----------+----------+
| uid | user_name | password  | type     |
+-----+-----------+-----------+----------+
|   1 | zahoor    | lunchtime | academic |
|   2 | fahad     | teatime   | student  |
|   4 | waqar     | teatime   | student  |
|   5 | amjad     | teatime   | academic |
|   6 | Majid     | teatime   | academic |
|   8 | Uzair     | teatime   | student  |
|   9 | Majeed    | teatime   | academic |
|  10 | Wajid     | teatime   | academic |
|  11 | Sajid     | teatime   | academic |
|  12 | Sajjad    | teatime   | student  |
|  13 | Rashid    | teatime   | academic |
|  14 | waqas.ali | teatime   | admin    |
|  15 | salman    | teatime   | student  |
+-----+-----------+-----------+----------+
13 rows in set (0.00 sec)

MariaDB [university]> INSERT INTO USERS VALUES(16, 'ALI', 'TEATIME', 'ADMIN');
Query OK, 1 row affected (0.00 sec)

MariaDB [university]> COMMIT;
Query OK, 0 rows affected (0.01 sec)

MariaDB [university]> SELECT * FROM USERS;
+-----+-----------+-----------+----------+
| uid | user_name | password  | type     |
+-----+-----------+-----------+----------+
|   1 | zahoor    | lunchtime | academic |
|   2 | fahad     | teatime   | student  |
|   4 | waqar     | teatime   | student  |
|   5 | amjad     | teatime   | academic |
|   6 | Majid     | teatime   | academic |
|   8 | Uzair     | teatime   | student  |
|   9 | Majeed    | teatime   | academic |
|  10 | Wajid     | teatime   | academic |
|  11 | Sajid     | teatime   | academic |
|  12 | Sajjad    | teatime   | student  |
|  13 | Rashid    | teatime   | academic |
|  14 | waqas.ali | teatime   | admin    |
|  15 | salman    | teatime   | student  |
|  16 | ALI       | TEATIME   | ADMIN    |
+-----+-----------+-----------+----------+
14 rows in set (0.00 sec)

MariaDB [university]> ROLLBACK;
Query OK, 0 rows affected (0.00 sec)

MariaDB [university]> SELECT * FROM USERS;
+-----+-----------+-----------+----------+
| uid | user_name | password  | type     |
+-----+-----------+-----------+----------+
|   1 | zahoor    | lunchtime | academic |
|   2 | fahad     | teatime   | student  |
|   4 | waqar     | teatime   | student  |
|   5 | amjad     | teatime   | academic |
|   6 | Majid     | teatime   | academic |
|   8 | Uzair     | teatime   | student  |
|   9 | Majeed    | teatime   | academic |
|  10 | Wajid     | teatime   | academic |
|  11 | Sajid     | teatime   | academic |
|  12 | Sajjad    | teatime   | student  |
|  13 | Rashid    | teatime   | academic |
|  14 | waqas.ali | teatime   | admin    |
|  15 | salman    | teatime   | student  |
|  16 | ALI       | TEATIME   | ADMIN    |
+-----+-----------+-----------+----------+
14 rows in set (0.00 sec)

MariaDB [university]> update users
    -> set type = 'academic'
    -> where uid = 16;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [university]> SAVEPOINT UPDATE_USER
    -> ;
Query OK, 0 rows affected (0.00 sec)

MariaDB [university]> INSERT INTO USERS VALUES(17, 'ABC','DEF','ADMIN');
Query OK, 1 row affected (0.00 sec)

MariaDB [university]> SAVEPOINT NEW_USER;
Query OK, 0 rows affected (0.00 sec)

MariaDB [university]> UPDATE USERS
    -> SET PASSWORD = 'teatime'
    -> where uid 1;
ERROR 1064 (42000): You have an error in your SQL syntax; check the manual that corresponds to your MariaDB server version for the right syntax to use near '1' at line 3
MariaDB [university]> UPDATE USERS
    -> SET PASSWORD = 'teatime'
    -> where uid =1;
Query OK, 1 row affected (0.00 sec)
Rows matched: 1  Changed: 1  Warnings: 0

MariaDB [university]> select * from users;
+-----+-----------+----------+----------+
| uid | user_name | password | type     |
+-----+-----------+----------+----------+
|   1 | zahoor    | teatime  | academic |
|   2 | fahad     | teatime  | student  |
|   4 | waqar     | teatime  | student  |
|   5 | amjad     | teatime  | academic |
|   6 | Majid     | teatime  | academic |
|   8 | Uzair     | teatime  | student  |
|   9 | Majeed    | teatime  | academic |
|  10 | Wajid     | teatime  | academic |
|  11 | Sajid     | teatime  | academic |
|  12 | Sajjad    | teatime  | student  |
|  13 | Rashid    | teatime  | academic |
|  14 | waqas.ali | teatime  | admin    |
|  15 | salman    | teatime  | student  |
|  16 | ALI       | TEATIME  | academic |
|  17 | ABC       | DEF      | ADMIN    |
+-----+-----------+----------+----------+
15 rows in set (0.00 sec)

MariaDB [university]> rollback to update_user;
Query OK, 0 rows affected (0.00 sec)

MariaDB [university]> select * from users;
+-----+-----------+-----------+----------+
| uid | user_name | password  | type     |
+-----+-----------+-----------+----------+
|   1 | zahoor    | lunchtime | academic |
|   2 | fahad     | teatime   | student  |
|   4 | waqar     | teatime   | student  |
|   5 | amjad     | teatime   | academic |
|   6 | Majid     | teatime   | academic |
|   8 | Uzair     | teatime   | student  |
|   9 | Majeed    | teatime   | academic |
|  10 | Wajid     | teatime   | academic |
|  11 | Sajid     | teatime   | academic |
|  12 | Sajjad    | teatime   | student  |
|  13 | Rashid    | teatime   | academic |
|  14 | waqas.ali | teatime   | admin    |
|  15 | salman    | teatime   | student  |
|  16 | ALI       | TEATIME   | academic |
+-----+-----------+-----------+----------+
14 rows in set (0.00 sec)

MariaDB [university]>
```

