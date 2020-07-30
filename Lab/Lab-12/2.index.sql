DROP INDEX idx_email on USERS;
DROP INDEX idx_usernme_pass ON USERS;

CREATE INDEX idx_email ON USERS (email);
CREATE INDEX idx_usernme_pass 
ON USERS(username,password);

SHOW INDEX FROM USERS;