MariaDB [(none)]> create database sales_co;
Query OK, 1 row affected (0.008 sec)


MariaDB [(none)]> use sales_co;
Database changed


MariaDB [sales_co]> describe p;
+------------+--------------+------+-----+---------+-------+
| Field      | Type         | Null | Key | Default | Extra |
+------------+--------------+------+-----+---------+-------+
| P_CODE     | varchar(10)  | NO   | PRI | NULL    |       |
| P_DESCRIPT | varchar(35)  | NO   |     | NULL    |       |
| P_INDATE   | datetime     | NO   |     | NULL    |       |
| P_ONHAND   | int(11)      | NO   |     | NULL    |       |
| P_MIN      | int(11)      | NO   |     | NULL    |       |
| P_PRICE    | decimal(8,2) | NO   |     | NULL    |       |
| P_DISCOUNT | decimal(4,2) | NO   |     | NULL    |       |
| V_CODE     | int(11)      | YES  | MUL | NULL    |       |
+------------+--------------+------+-----+---------+-------+
8 rows in set (0.051 sec)

MariaDB [sales_co]> select * from p;
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                         | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
| 11QER/31 | Power painter, 15 psi., 3-nozzle   | 2007-11-07 00:00:00 |        8 |     5 |  109.99 |       0.00 |  25595 |
| 13-Q2/P2 | 7.25-cm. pwr. saw blade            | 2007-12-14 00:00:00 |       32 |    15 |   14.99 |       0.05 |  21344 |
| 14-Q1/L3 | 9.00-cm. pwr. saw blade            | 2007-11-13 00:00:00 |       18 |    12 |   17.49 |       0.00 |  21344 |
| 1546-QQ2 | Hrd. cloth, 1/4-cm., 2x50          | 2008-01-15 00:00:00 |       15 |     8 |   39.95 |       0.00 |  23119 |
| 1558-QW1 | Hrd. cloth, 1/2-cm., 3x50          | 2008-01-15 00:00:00 |       23 |     5 |   43.99 |       0.00 |  23119 |
| 2232/QTY | B&D jigsaw, 12-cm. blade           | 2007-12-30 00:00:00 |        8 |     5 |  109.92 |       0.05 |  24288 |
| 2232/QWE | B&D jigsaw, 8-cm. blade            | 2007-12-30 00:00:00 |        6 |     5 |   99.87 |       0.05 |  24288 |
| 2238/QPD | B&D cordless drill, 1/2-cm.        | 2008-01-20 00:00:00 |       12 |     5 |   38.95 |       0.05 |  25595 |
| 23109-HB | Claw hammer                        | 2008-01-20 00:00:00 |       23 |    10 |    9.95 |       0.10 |  21225 |
| 23114-AA | Sledge hammer, 6kg.                | 2008-01-02 00:00:00 |        8 |     5 |   14.40 |       0.05 |   NULL |
| 54778-2T | Rat-tail file, 1/8-cm. fine        | 2007-12-15 00:00:00 |       43 |    20 |    4.99 |       0.00 |  21344 |
| 89-WRE-Q | Hicut chain saw, 16 cm.            | 2008-02-07 00:00:00 |       11 |     5 |  256.99 |       0.05 |  24288 |
| PVC23DRT | PVC pipe, 3.5-cm., 4-m             | 2008-02-20 00:00:00 |      188 |    75 |    5.87 |       0.00 |   NULL |
| SM-18277 | 1.25-cm. metal screw, 25           | 2008-03-01 00:00:00 |      172 |    75 |    6.99 |       0.00 |  21225 |
| SW-23116 | 2.5-cm. wd. screw, 50              | 2008-02-24 00:00:00 |      237 |   100 |    8.45 |       0.00 |  21231 |
| WR3/TT3  | Steel matting, 4x8x1/6cm, .5m mesh | 2008-01-17 00:00:00 |       18 |     5 |  119.95 |       0.10 |  25595 |
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
16 rows in set (0.001 sec)

MariaDB [sales_co]> Delimiter $$
MariaDB [sales_co]> CREATE PROCEDURE PRG_PROD()
    -> BEGIN
    -> UPDATE P
    -> SET P_DISCOUNT = (P_DISCOUNT*0.05)+ P_DISCOUNT
    -> WHERE P_ONHAND >= P_MIN*2;
    -> END $$
Query OK, 0 rows affected (0.114 sec)

MariaDB [sales_co]> Delimiter ;
MariaDB [sales_co]> call PRG_PROD();
Query OK, 2 rows affected, 5 warnings (0.001 sec)

MariaDB [sales_co]> select * from p;
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                         | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
| 11QER/31 | Power painter, 15 psi., 3-nozzle   | 2007-11-07 00:00:00 |        8 |     5 |  109.99 |       0.00 |  25595 |
| 13-Q2/P2 | 7.25-cm. pwr. saw blade            | 2007-12-14 00:00:00 |       32 |    15 |   14.99 |       0.05 |  21344 |
| 14-Q1/L3 | 9.00-cm. pwr. saw blade            | 2007-11-13 00:00:00 |       18 |    12 |   17.49 |       0.00 |  21344 |
| 1546-QQ2 | Hrd. cloth, 1/4-cm., 2x50          | 2008-01-15 00:00:00 |       15 |     8 |   39.95 |       0.00 |  23119 |
| 1558-QW1 | Hrd. cloth, 1/2-cm., 3x50          | 2008-01-15 00:00:00 |       23 |     5 |   43.99 |       0.00 |  23119 |
| 2232/QTY | B&D jigsaw, 12-cm. blade           | 2007-12-30 00:00:00 |        8 |     5 |  109.92 |       0.05 |  24288 |
| 2232/QWE | B&D jigsaw, 8-cm. blade            | 2007-12-30 00:00:00 |        6 |     5 |   99.87 |       0.05 |  24288 |
| 2238/QPD | B&D cordless drill, 1/2-cm.        | 2008-01-20 00:00:00 |       12 |     5 |   38.95 |       0.05 |  25595 |
| 23109-HB | Claw hammer                        | 2008-01-20 00:00:00 |       23 |    10 |    9.95 |       0.11 |  21225 |
| 23114-AA | Sledge hammer, 6kg.                | 2008-01-02 00:00:00 |        8 |     5 |   14.40 |       0.05 |   NULL |
| 54778-2T | Rat-tail file, 1/8-cm. fine        | 2007-12-15 00:00:00 |       43 |    20 |    4.99 |       0.00 |  21344 |
| 89-WRE-Q | Hicut chain saw, 16 cm.            | 2008-02-07 00:00:00 |       11 |     5 |  256.99 |       0.05 |  24288 |
| PVC23DRT | PVC pipe, 3.5-cm., 4-m             | 2008-02-20 00:00:00 |      188 |    75 |    5.87 |       0.00 |   NULL |
| SM-18277 | 1.25-cm. metal screw, 25           | 2008-03-01 00:00:00 |      172 |    75 |    6.99 |       0.00 |  21225 |
| SW-23116 | 2.5-cm. wd. screw, 50              | 2008-02-24 00:00:00 |      237 |   100 |    8.45 |       0.00 |  21231 |
| WR3/TT3  | Steel matting, 4x8x1/6cm, .5m mesh | 2008-01-17 00:00:00 |       18 |     5 |  119.95 |       0.11 |  25595 |
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
16 rows in set (0.001 sec)

MariaDB [sales_co]> Delimiter $$
MariaDB [sales_co]> 
MariaDB [sales_co]> CREATE PROCEDURE my_procedure_Local_Variables() 
    -> BEGIN /* declare local variables */ 
    -> DECLARE a INT DEFAULT 10; 
    -> DECLARE b, c INT; /* using the local variables */ 
    -> SET a = a + 100; 
    -> SET b = 2;
    -> SET c = a + b; 
    -> BEGIN /* local variable in nested block */ 
    -> DECLARE c INT; 
    -> SET c = 5; /* local variable c takes precedence over the one of the same name declared in the enclosing block. */ 
    -> SELECT a, b, c; 
    -> END; 
    -> SELECT a, b, c; 
    -> END$$
Query OK, 0 rows affected (0.101 sec)

MariaDB [sales_co]> call my_procedure_Local_Variables()$$
+------+------+------+
| a    | b    | c    |
+------+------+------+
|  110 |    2 |    5 |
+------+------+------+
1 row in set (0.001 sec)

+------+------+------+
| a    | b    | c    |
+------+------+------+
|  110 |    2 |  112 |
+------+------+------+
1 row in set (0.011 sec)

Query OK, 0 rows affected (0.015 sec)

MariaDB [sales_co]> CREATE PROCEDURE my_proc_IN (IN var1 INT) 
    -> BEGIN 
    -> SELECT * FROM P where P_ONHAND = var1; 
    -> END$$
Query OK, 0 rows affected (0.200 sec)

MariaDB [sales_co]> call my_proc_IN(8)$$
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                       | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| 11QER/31 | Power painter, 15 psi., 3-nozzle | 2007-11-07 00:00:00 |        8 |     5 |  109.99 |       0.00 |  25595 |
| 2232/QTY | B&D jigsaw, 12-cm. blade         | 2007-12-30 00:00:00 |        8 |     5 |  109.92 |       0.05 |  24288 |
| 23114-AA | Sledge hammer, 6kg.              | 2008-01-02 00:00:00 |        8 |     5 |   14.40 |       0.05 |   NULL |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
3 rows in set (0.001 sec)

Query OK, 0 rows affected (0.038 sec)

MariaDB [sales_co]> call my_proc_IN(18)$$
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                         | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
| 14-Q1/L3 | 9.00-cm. pwr. saw blade            | 2007-11-13 00:00:00 |       18 |    12 |   17.49 |       0.00 |  21344 |
| WR3/TT3  | Steel matting, 4x8x1/6cm, .5m mesh | 2008-01-17 00:00:00 |       18 |     5 |  119.95 |       0.11 |  25595 |
+----------+------------------------------------+---------------------+----------+-------+---------+------------+--------+
2 rows in set (0.001 sec)

Query OK, 0 rows affected (0.026 sec)

MariaDB [sales_co]> CREATE PROCEDURE LIMIT_ROW (IN var1 INT) 
    -> BEGIN 
    -> SELECT * FROM P LIMIT var1; 
    -> END$$
Query OK, 0 rows affected (0.132 sec)

MariaDB [sales_co]> call LIMIT_ROW(8)$$
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                       | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| 11QER/31 | Power painter, 15 psi., 3-nozzle | 2007-11-07 00:00:00 |        8 |     5 |  109.99 |       0.00 |  25595 |
| 13-Q2/P2 | 7.25-cm. pwr. saw blade          | 2007-12-14 00:00:00 |       32 |    15 |   14.99 |       0.05 |  21344 |
| 14-Q1/L3 | 9.00-cm. pwr. saw blade          | 2007-11-13 00:00:00 |       18 |    12 |   17.49 |       0.00 |  21344 |
| 1546-QQ2 | Hrd. cloth, 1/4-cm., 2x50        | 2008-01-15 00:00:00 |       15 |     8 |   39.95 |       0.00 |  23119 |
| 1558-QW1 | Hrd. cloth, 1/2-cm., 3x50        | 2008-01-15 00:00:00 |       23 |     5 |   43.99 |       0.00 |  23119 |
| 2232/QTY | B&D jigsaw, 12-cm. blade         | 2007-12-30 00:00:00 |        8 |     5 |  109.92 |       0.05 |  24288 |
| 2232/QWE | B&D jigsaw, 8-cm. blade          | 2007-12-30 00:00:00 |        6 |     5 |   99.87 |       0.05 |  24288 |
| 2238/QPD | B&D cordless drill, 1/2-cm.      | 2008-01-20 00:00:00 |       12 |     5 |   38.95 |       0.05 |  25595 |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
8 rows in set (0.001 sec)

Query OK, 0 rows affected (0.047 sec)

MariaDB [sales_co]> call LIMIT_ROW(10)$$
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                       | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| 11QER/31 | Power painter, 15 psi., 3-nozzle | 2007-11-07 00:00:00 |        8 |     5 |  109.99 |       0.00 |  25595 |
| 13-Q2/P2 | 7.25-cm. pwr. saw blade          | 2007-12-14 00:00:00 |       32 |    15 |   14.99 |       0.05 |  21344 |
| 14-Q1/L3 | 9.00-cm. pwr. saw blade          | 2007-11-13 00:00:00 |       18 |    12 |   17.49 |       0.00 |  21344 |
| 1546-QQ2 | Hrd. cloth, 1/4-cm., 2x50        | 2008-01-15 00:00:00 |       15 |     8 |   39.95 |       0.00 |  23119 |
| 1558-QW1 | Hrd. cloth, 1/2-cm., 3x50        | 2008-01-15 00:00:00 |       23 |     5 |   43.99 |       0.00 |  23119 |
| 2232/QTY | B&D jigsaw, 12-cm. blade         | 2007-12-30 00:00:00 |        8 |     5 |  109.92 |       0.05 |  24288 |
| 2232/QWE | B&D jigsaw, 8-cm. blade          | 2007-12-30 00:00:00 |        6 |     5 |   99.87 |       0.05 |  24288 |
| 2238/QPD | B&D cordless drill, 1/2-cm.      | 2008-01-20 00:00:00 |       12 |     5 |   38.95 |       0.05 |  25595 |
| 23109-HB | Claw hammer                      | 2008-01-20 00:00:00 |       23 |    10 |    9.95 |       0.11 |  21225 |
| 23114-AA | Sledge hammer, 6kg.              | 2008-01-02 00:00:00 |        8 |     5 |   14.40 |       0.05 |   NULL |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
10 rows in set (0.001 sec)

Query OK, 0 rows affected (0.056 sec)

MariaDB [sales_co]> call LIMIT_ROW(2)$$
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| P_CODE   | P_DESCRIPT                       | P_INDATE            | P_ONHAND | P_MIN | P_PRICE | P_DISCOUNT | V_CODE |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
| 11QER/31 | Power painter, 15 psi., 3-nozzle | 2007-11-07 00:00:00 |        8 |     5 |  109.99 |       0.00 |  25595 |
| 13-Q2/P2 | 7.25-cm. pwr. saw blade          | 2007-12-14 00:00:00 |       32 |    15 |   14.99 |       0.05 |  21344 |
+----------+----------------------------------+---------------------+----------+-------+---------+------------+--------+
2 rows in set (0.001 sec)

Query OK, 0 rows affected (0.023 sec)

MariaDB [sales_co]> CREATE PROCEDURE PRG_AVG_PRICE(out avg_price decimal)
    -> BEGIN
    -> SELECT AVG(P_PRICE) INTO avg_price FROM P;
    -> END$$
Query OK, 0 rows affected (0.115 sec)

MariaDB [sales_co]> call PRG_AVG_PRICE(@out)$$
Query OK, 1 row affected, 1 warning (0.001 sec)

MariaDB [sales_co]> select @out$$
+------+
| @out |
+------+
|   56 |
+------+
1 row in set (0.001 sec)

MariaDB [sales_co]> 
MariaDB [sales_co]> drop procedure PRG_PROD$$
Query OK, 0 rows affected (0.493 sec)

MariaDB [sales_co]> drop procedure my_procedure_Local_Variables$$
Query OK, 0 rows affected (0.495 sec)

MariaDB [sales_co]> drop procedure my_proc_IN$$
Query OK, 0 rows affected (0.498 sec)

MariaDB [sales_co]> drop procedure  prg_avg_price$$
Query OK, 0 rows affected (0.500 sec)

MariaDB [sales_co]> exit
