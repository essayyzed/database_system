DROP TABLE SUMMARY;
DROP TABLE USERS;

create table USERS(
    user_id numeric(3) NOT NULL PRIMARY KEY,
    username varchar(20) NOT NULL,
    password varchar(100) NOT NULL,
    email varchar(255) NOT NULL
);

create table SUMMARY(
    id numeric(3) NOT NULL PRIMARY KEY,
    total_users numeric(3) NOT NULL,
    Yahoo numeric(3) NOT NULL,
    Hotmail numeric(3) NOT NULL,
    Gmail numeric(3) NOT NULL
);

INSERT INTO USERS VALUES (1,'abc123','def321','abc123@yahoo.com');
INSERT INTO USERS VALUES (2, 'xyz789','vbn123','xyz789@yahoo.com' );

INSERT INTO SUMMARY VALUES (1, 2, 1, 0, 1);

DROP PROCEDURE INSERTION_USERS;
DELIMITER :
CREATE PROCEDURE INSERTION_USERS(
    IN user_id INT,
    IN username varchar(50),
    IN password_ varchar(255),
    IN email varchar(50)
)
BEGIN
    INSERT INTO 
    USERS 
    VALUES(user_id,username,password_,email);
END:
DELIMITER ;

call INSERTION_USERS(3,'zamm','zam123','zam@gmail.com');
SELECT * FROM USERS;

DROP PROCEDURE INSERTION_SUMMARY;
DELIMITER :
CREATE PROCEDURE INSERTION_SUMMARY(
    IN id INT,
    IN total_users INT,
    IN yahoo INT,
    IN hotmail INT,
    IN gmail INT
)
BEGIN
    INSERT INTO 
    SUMMARY 
    VALUES(id,total_users,yahoo,hotmail,gmail);
END:
DELIMITER ;

call INSERTION_SUMMARY(3,4,2,1,0);
SELECT * FROM SUMMARY;


DROP PROCEDURE AVERAGE_YAHOO;
DELIMITER :
CREATE PROCEDURE AVERAGE_YAHOO(out avrg int)
BEGIN
    SELECT AVG(yahoo) 
    AS 'YAHOO AVERAGE'
    INTO avrg 
    FROM SUMMARY;
END:
DELIMITER ;
call AVERAGE_YAHOO(@out);
SELECT @out;

DROP PROCEDURE MIN_GMAIL;
DELIMITER :
CREATE PROCEDURE MIN_GMAIL(out min_gmail int)
BEGIN
    SELECT min(gmail) 
    AS 'MINIMUM GMAIL'
    INTO  min_gmail
    FROM SUMMARY;
END:
DELIMITER ;
call MIN_GMAIL(@out);
SELECT @out;

DROP PROCEDURE MAX_HOTMAIL;
DELIMITER :
CREATE PROCEDURE MAX_HOTMAIL(out max_hotmail int)
BEGIN
    SELECT max(hotmail) 
    AS 'MAXIMIMUM HOTMAIL' INTO max_hotmail
    FROM SUMMARY;
END:
DELIMITER ;
call MAX_HOTMAIL(@out);
SELECT @out;


DROP PROCEDURE update_Summary;
DELIMITER :
CREATE PROCEDURE update_Summary()
BEGIN
    UPDATE SUMMARY
    SET Yahoo = Yahoo + 1
    where Yahoo <= Hotmail ;
END :
DELIMITER ;
call update_Summary();
SELECT * FROM SUMMARY;