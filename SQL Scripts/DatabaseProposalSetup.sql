IF NOT EXISTS(SELECT [name] FROM sys.databases WHERE [name] = 'RealImaginary' )
	CREATE DATABASE RealImaginary
	GO

USE [RealImaginary]

DROP TABLE EVALUATION;
DROP TABLE SURVEYORS;
DROP TABLE SELLER_AGENT;
DROP TABLE BUYER_AGENT;
DROP TABLE HOUSE;
DROP TABLE AGENT;
DROP TABLE AGENCY;
DROP TABLE BUYER;
DROP TABLE SELLER;
DROP TABLE ACCOUNT;

GO

CREATE TABLE dbo.BUYER(
BUYER_ID CHAR(4) NOT NULL,
BUYER_LNAME VARCHAR(20) NOT NULL,
BUYER_FNAME VARCHAR(20) NOT NULL,
BUYER_ADDRESS VARCHAR(50),
BUYER_PHONE CHAR(10) NOT NULL,
BUYER_EMAIL VARCHAR(30) NOT NULL,
BUYER_BUDGET float NOT NULL,
BUYER_CRITERIA VARCHAR(50),
CONSTRAINT buyer_pk
PRIMARY KEY(BUYER_ID)
);
GO

CREATE TABLE SELLER(
SELLER_ID CHAR(4) NOT NULL,
SELLER_LNAME VARCHAR(20) NOT NULL,
SELLER_FNAME VARCHAR(20) NOT NULL,
SELLER_ADDRESS VARCHAR(50) NOT NULL,
SELLER_PHONE CHAR(10) NOT NULL,
SELLER_EMAIL VARCHAR(30) NOT NULL,
CONSTRAINT seller_pk
PRIMARY KEY (SELLER_ID)
);
GO

CREATE TABLE AGENCY
(
AGENCY_ID CHAR(4) NOT NULL,
AGENCY_ADDRESS VARCHAR(50) NOT NULL,
AGENCY_PHONE CHAR(10) NOT NULL,
AGENCY_EMAIL VARCHAR(30) NOT NULL,
AGENCY_FAX CHAR(10) NOT NULL,
CONSTRAINT agency_pk PRIMARY KEY(AGENCY_ID)
);
GO

CREATE TABLE AGENT(
AGENT_ID CHAR(4) NOT NULL UNIQUE,
AGENCY_ID CHAR(4) NOT NULL,
AGENT_LNAME VARCHAR(20) NOT NULL,
AGENT_FNAME VARCHAR(20) NOT NULL,
AGENT_ADDRESS VARCHAR(50) NOT NULL,
AGENT_PHONE CHAR(10) NOT NULL,
AGENT_EMAIL VARCHAR(30) NOT NULL,
CONSTRAINT agent_pk
PRIMARY KEY(AGENT_ID,AGENCY_ID),
CONSTRAINT agent_agency_id_fk
FOREIGN KEY(AGENCY_ID) REFERENCES AGENCY(AGENCY_ID)
ON DELETE CASCADE
);
GO

CREATE TABLE HOUSE
(
HOUSE_ID CHAR(4) NOT NULL,
BUYER_ID CHAR(4),
SELLER_ID CHAR(4) NOT NULL,
AGENT_ID CHAR(4) NOT NULL,
HOUSE_ADDRESS VARCHAR(50) NOT NULL,
HOUSE_STATE VARCHAR(6) NOT NULL,
HOUSE_ASKINGPRICE float NOT NULL,
HOUSE_SELLINGPRICE float,
HOUSE_PICTURE VARCHAR(100),
CONSTRAINT house_pk PRIMARY KEY(HOUSE_ID),
FOREIGN KEY(BUYER_ID) REFERENCES BUYER(BUYER_ID),
CONSTRAINT house_seller_id_fk2 FOREIGN KEY(SELLER_ID) REFERENCES SELLER(SELLER_ID)
ON DELETE CASCADE,
CONSTRAINT house_agent_id_fk1 FOREIGN KEY(AGENT_ID) REFERENCES AGENT(AGENT_ID)
ON DELETE CASCADE
);
GO

CREATE TABLE SELLER_AGENT(
AGENT_ID CHAR(4) NOT NULL,
AGENCY_ID CHAR(4) NOT NULL,
SELLER_ID CHAR(4) NOT NULL,
CONSTRAINT selleragent_pk 
PRIMARY KEY(AGENT_ID,AGENCY_ID,SELLER_ID),
CONSTRAINT selleragent_agent_id_fk1 
FOREIGN KEY(AGENT_ID) REFERENCES AGENT(AGENT_ID)
ON DELETE CASCADE,
CONSTRAINT selleragent_agency_id_fk2 
FOREIGN KEY(AGENCY_ID) REFERENCES AGENCY(AGENCY_ID)
ON DELETE NO ACTION,
CONSTRAINT selleragent_seller_id_fk3 
FOREIGN KEY(SELLER_ID) REFERENCES SELLER(SELLER_ID)
ON DELETE CASCADE
);
GO

CREATE TABLE BUYER_AGENT(
AGENT_ID CHAR(4) NOT NULL,
AGENCY_ID CHAR(4) NOT NULL,
BUYER_ID CHAR(4) NOT NULL,
CONSTRAINT buyeragent_pk
PRIMARY KEY(AGENT_ID,AGENCY_ID, BUYER_ID),
CONSTRAINT buyeragent_agent_id_fk1
FOREIGN KEY (AGENT_ID) REFERENCES AGENT(AGENT_ID)
ON DELETE CASCADE,
CONSTRAINT buyeragent_agency_id_fk2
FOREIGN KEY (AGENCY_ID) REFERENCES AGENCY(AGENCY_ID)
ON DELETE NO ACTION,
CONSTRAINT buyeragent_buyer_id_fk3
FOREIGN KEY (BUYER_ID) REFERENCES BUYER(BUYER_ID)
ON DELETE CASCADE 
);
GO

CREATE TABLE SURVEYORS(
SURV_ID CHAR(4) NOT NULL UNIQUE,
AGENCY_ID CHAR(4) NOT NULL,
SURV_LNAME VARCHAR(20) NOT NULL,
SURV_FNAME VARCHAR(20) NOT NULL,
SURV_ADDRESS VARCHAR(50) NOT NULL,
SURV_PHONE CHAR(10) NOT NULL,
SURV_EMAIL VARCHAR(30) NOT NULL,
CONSTRAINT surv_pk
PRIMARY KEY(SURV_ID,AGENCY_ID),
CONSTRAINT surv_agency_id_fk
FOREIGN KEY(AGENCY_ID) REFERENCES AGENCY(AGENCY_ID)
ON DELETE CASCADE
);
GO

CREATE TABLE EVALUATION(
EVAL_ID CHAR(4) NOT NULL UNIQUE,
SURV_ID CHAR(4) NOT NULL,
AGENCY_ID CHAR(4) NOT NULL,
HOUSE_ID CHAR(4) NOT NULL,
EVAL_HOUSE_SQFT int NOT NULL,
EVAL_PROP_SQFT int,
EVAL_REPAIRS  VARCHAR(20),
EVAL_FEATURES VARCHAR(50) NOT NULL,
EVAL_BEDROOMS CHAR(1),
EVAL_TOILETS CHAR(1),
EVAL_BATHROOMS CHAR(1),
EVAL_PTYPE VARCHAR(10) NOT NULL,
EVAL_AGE int NOT NULL,
EVAL_HISTORY VARCHAR(50),
EVAL_PRICE int,
CONSTRAINT eval_pk
PRIMARY KEY(EVAL_ID,SURV_ID,AGENCY_ID,HOUSE_ID),
CONSTRAINT eval_surv_id_fk
FOREIGN KEY(SURV_ID) REFERENCES SURVEYORS(SURV_ID)
ON DELETE CASCADE,
CONSTRAINT eval_agency_id_fk
FOREIGN KEY(AGENCY_ID) REFERENCES AGENCY(AGENCY_ID)
ON DELETE NO ACTION,
CONSTRAINT eval_house_id_fk
FOREIGN KEY(HOUSE_ID) REFERENCES HOUSE(HOUSE_ID)
ON DELETE NO ACTION
);
GO

CREATE TABLE ACCOUNT(
ACC_ID int NOT NULL UNIQUE,
ACC_USER VARCHAR(20) NOT NULL UNIQUE,
ACC_PASS VARCHAR(20) NOT NULL,
ACC_TYPE VARCHAR(10) NOT NULL,
ACC_LINKID CHAR(4) NOT NULL,
);
GO

--Agency
INSERT INTO AGENCY VALUES(
'1001', '1073 Edmonds St Burnaby', '7789998888', 'burnaby@imaginary.ca', '5558881234');
INSERT INTO AGENCY VALUES(
'1002', '2345 Main St', '6049998888', 'vancouver@imaginary.ca', '5558884321');

--Surveyors
INSERT INTO SURVEYORS VALUES(
'2001', '1001', 'Bush', 'George', '6042 Dow Ave Burnaby', '7782437777', 'george@live.com');
INSERT INTO SURVEYORS VALUES(
'2002', '1001', 'Clinton', 'Bill', '402 Willingdon Ave Burnaby', '7781231234', 'bill@live.com');
INSERT INTO SURVEYORS VALUES(
'2003', '1002', 'Obama', 'Barack', '1000 West Hastings St Vancouver', '6041112222', 'obama@live.com');

--Agents
INSERT INTO AGENT VALUES(
'3001', '1001', 'Parker', 'Peter', '602 Halifax St Burnaby', '7781119876', 'parker@live.com');
INSERT INTO AGENT VALUES(
'3002', '1001', 'Kent', 'Clark', '1036 Winston St Burnaby', '7784569181', 'clark@live.com');
INSERT INTO AGENT VALUES(
'3003', '1001', 'Wayne', 'Bruce', '12th Ave New Westminister', '7787787788', 'bruce@hotmail.ca');
INSERT INTO AGENT VALUES(
'3004', '1002', 'Prince', 'Diana', '1001 West 10th Ave Vancouver', '6046046604', 'diana@hotmail.ca');
INSERT INTO AGENT VALUES(
'3005', '1002', 'Howlett', 'James', '120 Alma St Vancouver', '6041117557', 'logan@live.com');

--Buyers
INSERT INTO BUYER VALUES(
'4001', 'Branford', 'Terra', '1047 West 23rd Ave Vancouver', '6049998765', 'terra@live.com', '600000', '2 bedrooms');
INSERT INTO BUYER VALUES(
'4002', 'Cole', 'Locke', '2345 Alma St Vancouver', '6041236666', 'locke@live.com', '25000000', 'bedroom in basement');
INSERT INTO BUYER VALUES(
'4003', 'Figaro', 'Edgar', '1467 10th Ave New Westminister', '7787117171', 'edgar@hotmail.ca', '1250000', 'digs through sand');
INSERT INTO BUYER VALUES(
'4004', 'Figaro', 'Sabin', '1467 10th Ave New Westminister', '7781771717', 'sabin@hotmail.ca', '250000', '');
INSERT INTO BUYER VALUES(
'4005', 'Garamonde', 'Cyan', '1234 Knight St Vancouver', '6046661234', 'cyan@yahoo.ca', '2000000', 'not near river');
INSERT INTO BUYER VALUES(
'4006', 'Arrowny', 'Relm', '2031 Imperial St Burnaby', '7782225454', 'relm@yahoo.ca', '450', '3000 rooms');
INSERT INTO BUYER  VALUES(
'4007', 'Chere', 'Celes', '1111 Boundry Rd Burnaby', '7788885655', 'celes@live.ca', '1200000', '2 showers');
INSERT INTO BUYER VALUES(
'4008', 'Gabbiani', 'Setzer', '5665 Delta Ave Burnaby', '7783453456', 'blackjack@gmail.ca', '78000000', 'airship landing pad');
INSERT INTO BUYER VALUES(
'4009', 'Magus', 'Strago', '3405 West King Edward Ave Vancouver', '6047771234', 'strago@gmail.ca', '800000', 'fireproof');
INSERT INTO BUYER VALUES(
'4010', 'Klauser', 'Bartz', '1021 Westwood St Coquitlam', '7789887887', 'bartz@yahoo.ca', '750000', 'Must allow pets');
INSERT INTO BUYER VALUES(
'4011', 'Tycoon', 'Lenna', '800 Lonsdale Ave North Vancouver', '6045458899', 'lenna@gmail.ca', '90000000', 'Large balcony');
INSERT INTO BUYER VALUES(
'4012', 'Scherwiz', 'Faris', '454 Columbia St New Westminister', '7781123322', 'faris@live.ca', '500000', 'looking for houseboat');
INSERT INTO BUYER  VALUES(
'4013', 'Baldesion', 'Galuf', '635 Burris St Burnaby', '7788554545', 'spaceman@live.com', '2000000', '');

--Sellers
INSERT INTO SELLER VALUES(
'5001', 'Poe', 'Edgar', '1048 West 23rd Ave Vancouver', '6049456865', 'edgar@live.com');
INSERT INTO SELLER VALUES(
'5002', 'Holmes', 'Sherlock', '1049 West 23rd Ave Vancouver', '6047896865', 'shserlock@live.com');
INSERT INTO SELLER VALUES(
'5003', 'OBrien', 'Conan', '1050 West 23rd Ave Vancouver', '6049454965', 'conan@live.com');
INSERT INTO SELLER VALUES(
'5004', 'Yo', 'Tiger', '1051 West 23rd Ave Vancouver', '6048492865', 'tiger@live.com');
INSERT INTO SELLER VALUES(
'5005', 'Hohan', 'Micklel', '1052 West 23rd Ave Vancouver', '6049948365', 'micklel@live.com');
INSERT INTO SELLER VALUES(
'5006', 'Lee', 'Friberg', '1053 West 23rd Ave Vancouver', '6049495873', 'friberg@live.com');
INSERT INTO SELLER VALUES(
'5007', 'Kim', 'Kim', '1054 West 23rd Ave Vancouver', '6049467365', 'kim@live.com');
INSERT INTO SELLER VALUES(
'5008', 'khaha', 'Diamond', '1055 West 23rd Ave Vancouver', '6049999865', 'diamond@live.com');
INSERT INTO SELLER VALUES(
'5009', 'Hsu', 'Joie', '1056 West 23rd Ave Vancouver', '6043434865', 'joie@live.com');
INSERT INTO SELLER VALUES(
'5010', 'zelda', 'link', '1057 West 23rd Ave Vancouver', '6049593264', 'link@live.com');

--Houses
INSERT INTO HOUSE VALUES(
'6001', null, '5001', '3001', '1467 10th Ave New Westminister', 'unsold', '5000000', null, 'house.jpg');
INSERT INTO HOUSE VALUES(
'6002', null, '5002', '3003', '1468 10th Ave New Westminister', 'unsold', '7000000', null, 'house.jpg');
INSERT INTO HOUSE VALUES(
'6003', '4003', '5001', '3004', '1469 10th Ave New Westminister', 'sold', '8000000', '7000000', 'house.jpg');
INSERT INTO HOUSE VALUES(
'6004', null, '5003', '3002', '1470 10th Ave New Westminister', 'unsold', '6500000', null, null);
INSERT INTO HOUSE VALUES(
'6005', '4005', '5007', '3002', '1471 10th Ave New Westminister', 'sold', '8800000', '7600000', null);
INSERT INTO HOUSE VALUES(
'6006', '4003', '5009', '3001', '1472 10th Ave New Westminister', 'sold', '9200000', '8800000', null);
INSERT INTO HOUSE VALUES(
'6007', null, '5010', '3001', '1473 10th Ave New Westminister', 'unsold', '3200000', null, null);
INSERT INTO HOUSE VALUES(
'6008', null, '5006', '3005', '1474 10th Ave New Westminister', 'unsold', '6900000', null, null);
INSERT INTO HOUSE VALUES(
'6009', '4001', '5003', '3003', '1475 10th Ave New Westminister', 'sold', '8000000', '7600000', null);
INSERT INTO HOUSE VALUES(
'6010', null, '5005', '3005', '1476 10th Ave New Westminister', 'unsold', '7600000', null, null);
INSERT INTO HOUSE VALUES(
'6011', null, '5008', '3002', '1477 10th Ave New Westminister', 'unsold', '5850000', null, null);
INSERT INTO HOUSE VALUES(
'6012', null, '5004', '3004', '1478 10th Ave New Westminister', 'unsold', '6550000', null, null);
INSERT INTO HOUSE VALUES(
'6013', null, '5001', '3001', '1478 East 10th Ave Vancouver', 'unsold', '550000', null, null);
INSERT INTO HOUSE VALUES(
'6014', null, '5001', '3001', '220 West 12th Ave Vancouver', 'unsold', '1500000', null, null);
INSERT INTO HOUSE VALUES(
'6015', null, '5004', '3004', '123 Alma St Vancouver', 'unsold', '900000', null, null);
INSERT INTO HOUSE VALUES(
'6016', '4013', '5002', '3005', '478 East Hastings', 'sold', '90000', '80000', null);
INSERT INTO HOUSE VALUES(
'6017', null, '5008', '3003', '200 East Hastings', 'unsold', '500', null, null);
INSERT INTO HOUSE VALUES(
'6018', null, '5005', '3005', '1478 Imperial St Burnaby', 'unsold', '1650000', null, null);
INSERT INTO HOUSE VALUES(
'6019', null, '5004', '3004', '880 Boundry Rd Burnaby ', 'unsold', '350000', null, null);
INSERT INTO HOUSE VALUES(
'6020', null, '5007', '3002', '919 West 31st Ave Vancouver', 'unsold', '99999999', null, null);
INSERT INTO HOUSE VALUES(
'6021', '4010', '5009', '3001', '6707 Dow Ave Burnaby', 'sold', '750000', '750000', null);
INSERT INTO HOUSE VALUES(
'6022', '4002', '5010', '3002', '1122 West 7th Ave Vancouver', 'sold', '450000', '475000', null);
INSERT INTO HOUSE VALUES(
'6023', null, '5006', '3003', '101 Oak St Vancouver', 'unsold', '900000', null, null);
INSERT INTO HOUSE VALUES(
'6024', null, '5005', '3001', '4100 Deer Lake Pkwy Burnaby', 'unsold', '350000', null, null);
INSERT INTO HOUSE VALUES(
'6025', null, '5009', '3005', '6287 Gilley Ave Burnaby', 'unsold', '600000', null, null);
INSERT INTO HOUSE VALUES(
'6026', null, '5006', '3004', '400 Rumble St Burnaby', 'unsold', '90000', null, null);
INSERT INTO HOUSE VALUES(
'6027', null, '5001', '3004', '752 Griffiths Dr Burnaby', 'unsold', '880000', null, null);
INSERT INTO HOUSE VALUES(
'6028', null, '5002', '3002', '202 Willingdon Ave Burnaby', 'unsold', '3450000', null, null);
INSERT INTO HOUSE VALUES(
'6029', null, '5003', '3003', '303 Commercial Dr Vancouver', 'unsold', '45000', null, null);
INSERT INTO HOUSE VALUES(
'6030', null, '5004', '3005', '489 West 12th Ave Vancouver', 'unsold', '450000', null, null);

--Evaluations
INSERT INTO EVALUATION VALUES(
'7001', '2001', '1001', '6001', '1000', '800', 'no repair needed', 'many trees', '2', '2', '2', 'townhouse', '5', 'built in 2010', '5000000');
INSERT INTO EVALUATION VALUES(
'7002', '2002', '1001', '6002', '1500', '1300', 'no repair needed', 'many trees', '3', '3', '2', 'house', '10', 'built in 2005', '7000000');
INSERT INTO EVALUATION VALUES(
'7003', '2001', '1001', '6003', '1800', '1600', 'no repair needed', 'many trees', '5', '4', '3', 'house', '8', 'built in 2007', '7000000');
INSERT INTO EVALUATION VALUES(
'7004', '2001', '1001', '6004', '1150', '950', 'no repair needed', 'many trees', '3', '2', '2', 'house', '7', 'built in 2008', '6500000');
INSERT INTO EVALUATION VALUES(
'7005', '2002', '1001', '6005', '1650', '1450', 'no repair needed', 'many trees', '5', '4', '4', 'commercial', '3', 'built in 2012', '7600000');
INSERT INTO EVALUATION VALUES(
'7006', '2003', '1002', '6006', '900', '700', 'no repair needed', 'many trees', '2', '1', '1', 'rental', '10', 'built in 2005', '8800000');
INSERT INTO EVALUATION VALUES(
'7007', '2003', '1002', '6007', '1300', '1100', 'no repair needed', 'many trees', '4', '3', '2', 'townhouse', '11', 'built in 2004', '3200000');
INSERT INTO EVALUATION VALUES(
'7008', '2002', '1001', '6008', '1000', '800', 'no repair needed', 'many trees', '2', '2', '2', 'commercial', '6', 'built in 2009', '6900000');
