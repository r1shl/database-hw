 -- DROP DATABASE IF EXISTS pet_database;
 -- CREATE DATABASE pet_database;
 -- USE pet_database;

 -- DROP TABLE IF EXISTS petPet, petEvent;

CREATE TABLE petPet (
  Petname VARCHAR(15) PRIMARY KEY,
  Owner VARCHAR(45),
  Species VARCHAR(45),
  Gender ENUM('F','M'),
  Birth DATE,
  Death DATE
);

CREATE TABLE petEvent (
  Petname VARCHAR(15),
  EventDate DATE NOT NULL,
  EventType VARCHAR(25) NOT NULL,
  remark VARCHAR(255),
  PRIMARY KEY (Petname, EventDate),
  FOREIGN KEY (Petname) REFERENCES petPet(Petname)
);