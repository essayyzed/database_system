-- DROP PROCEDURE PRG_PROD;
-- DELIMITER :
-- CREATE PROCEDURE PRG_PROD()
-- BEGIN

-- UPDATE PRODUCT
-- SET P_DISCOUNT = (P_DISCOUNT*0.05)+ P_DISCOUNT
-- WHERE P_ONHAND >= P_MIN*2;

-- END:
-- DELIMITER ;
-- call PRG_PROD();



-- DELIMITER :
-- CREATE PROCEDURE my_procedure_Local_Variables()
-- BEGIN 

-- DECLARE a INT DEFAULT 10;
-- DECLARE b, c INT;
-- SET a = a + 100;
-- SET b = 2;
-- SET c = a + b;

-- BEGIN
-- DECLARE c INT;
-- SET c = 5;
-- SELECT a, b, c;
-- END;

-- SELECT a, b, c;
-- END:

-- DELIMITER ;
--  call my_procedure_Local_Variables();

-- DELIMITER :
-- DROP PROCEDURE my_proc_IN;
-- CREATE PROCEDURE my_proc_IN (IN var1 INT)
-- BEGIN
--     SELECT * FROM PRODUCT WHERE P_ONHAND = var1;
-- END:

-- DELIMITER ;

-- call my_proc_IN(8);


-- DELIMITER :

-- CREATE PROCEDURE LIMIT_ROW (IN var1 INT)
-- BEGIN
--     SELECT * FROM PRODUCT LIMIT var1;
-- END:

-- DELIMITER ;

-- call LIMIT_ROW(8);

DELIMITER :
DROP PROCEDURE PRG_AVG_PRICE
CREATE PROCEDURE PRG_AVG_PRICE(out avg_price decimal)
BEGIN
    SELECT AVG(P_PRICE) INTO avg_price FROM PRODUCT;
END:
call PRG_AVG_PRICE(@out);