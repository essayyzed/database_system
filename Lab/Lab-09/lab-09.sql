-- CREATE VIEW TPARKSSOLD AS
-- SELECT *
-- FROM THEMEPARK
-- WHERE EXISTS (SELECT PARK_CODE FROM SALES
-- WHERE SALES.PARK_CODE = THEMEPARK.PARK_CODE);

-- SELECT * FROM TPARKSSOLD;

-- describe TPARKSSOLD;


DROP VIEW EMPFRR;
CREATE VIEW EMPFRR AS
SELECT * 
FROM EMPLOYEE
WHERE PARK_CODE = 'FR1001';


SELECT * FROM EMPFRR;

UPDATE EMPFRR
SET PARK_CODE = 'UK3452'
WHERE EMP_NUM = 100;
