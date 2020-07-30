create table USERS(
    user_id numeric(3) NOT NULL,
    username varchar(20) NOT NULL,
    password varchar(100) NOT NULL,
    email varchar(255) NOT NULL,
    deleted tinyint(1) unsigned NOT NULL DEFAULT '0',
    PRIMARY KEY (user_id),
    KEY ix_deleted (deleted)
);

create table SUMMARY(
    id numeric(3) NOT NULL,
    total_users numeric(3) NOT NULL,
    changetype enum('NEW','EDIT','DELETE') NOT NULL,
    changetime timestamp NOT NULL DEFAULT CURRENT_TIME 
    ON UPDATE CURRENT_TIME,
    Yahoo numeric(3) NOT NULL,
    Hotmail numeric(3) NOT NULL,
    Gmail numeric(3) NOT NULL,
    PRIMARY KEY (id),
    KEY ix_id (id),
    KEY ix_total_users (total_users),
    KEY ix_change_type (changetype),
    KEY ix_change_time (changetime),
    KEY ix_Yahoo (Yahoo),
    KEY ix_Hotmail (Hotmail),
    KEY ix_Gmail (Gmail),
    CONSTRAINT FK_SUMMARY_ID FOREIGN KEY(id) REFERENCES SUMMARY(user_id) ON DELETE CASCADE 
    ON UPDATE CASCADE
);