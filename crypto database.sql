create database crypto;
use crypto;

create table USERS (ID int primary key auto_increment, USERNAME varchar(20) unique, PASSWORD varchar(20), EMAIL varchar(20) unique, CREATED_AT datetime, VERIFIED_AT datetime, ROLE varchar(20), REFERENCE_CODE varchar(20) unique, REFERED_BY int, foreign key(REFERED_BY) references USERS(ID), STATUS varchar(20));

create table PACKAGES (ID int primary key auto_increment, NAME varchar(20) unique, AMOUNT varchar(20), PERIOD varchar(20), ROI_PER_DAY varchar(20), STATUS varchar(20));

create table LEVEL (ID int primary key auto_increment, POINTS varchar(20));

create table REWARDS (ID int primary key auto_increment, RANK_NAME varchar(20), REWARD varchar(20), BUSINESS_REQUIRED varchar(20), STATUS varchar(20));

create table USER_MEMBERSHIP (ID int primary key auto_increment, USER_ID int, foreign key(USER_ID) references USERS(ID), PLAN_ID int, foreign key(PLAN_ID) references PACKAGES(ID), CREATED_AT datetime, ROI_RECEIVED varchar(20), NEXT_DATE datetime, ROI_RECEIVED_DATE datetime, STATUS varchar(20));

create table ROI_INCOME (ID int primary key auto_increment, PLAN_ID int, foreign key(PLAN_ID) references PACKAGES(ID), DATE datetime, ROI_RECEIVED varchar(20));

create table WALLET (ID int primary key auto_increment, USER_ID int, foreign key(USER_ID) references USERS(ID), AVAILABLE_BALANCE varchar(20), RESERVED_BALANCE varchar(20), LEVEL_INCOME varchar(20), REFERAL_INCOME varchar(20), ROI_INCOME varchar(20), STATUS varchar(20));

create table TRANSACTIONS (ID int primary key auto_increment, WALLET_ID int, foreign key(WALLET_ID) references WALLET(ID), OPENING_BALANCE varchar(20), CLOSING_BALANCE varchar(20), CREDIT_BALANCE varchar(20), CREDIT_AMOUNT varchar(20), DEBIT_AMOUNT varchar(20), TYPE varchar(20), DATE datetime, AMOUNT varchar(20), STATUS varchar(20), COMMENT varchar(20));

create table USER_REWARDS (ID int primary key auto_increment, USER_ID int, foreign key(USER_ID) references USERS(ID), REWARD_ID int, foreign key(REWARD_ID) references REWARDS(ID), DATE datetime, REWARD_RECEIVED varchar(20));

create table LEVEL_INCOME (ID int primary key auto_increment, PARENT_ID int, foreign key(PARENT_ID) references USERS(REFERED_BY), CHILD_ID int, foreign key(CHILD_ID) references USERS(ID), DATE datetime, LEVEL_INCOME varchar(20), LEVELS int, foreign key(LEVELS) references LEVEL(ID));

create table USER_REFERENCE (ID int primary key auto_increment,PARENT_ID int, foreign key(PARENT_ID) references USERS(REFERED_BY), CHILD_ID int, foreign key(CHILD_ID) references USERS(ID), DATE datetime, REFERAL_INCOME varchar(20));

delimiter $$
create trigger after_user_insert after insert on USER_MEMBERSHIP for each row
begin
    insert into ROI_INCOME (PLAN_ID, DATE, ROI_RECEIVED)
    VALUES (new.ID, now(), new.ROI_RECEIVED);
end $$
delimiter ;

