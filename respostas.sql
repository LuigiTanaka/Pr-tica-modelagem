CREATE DATABASE pratica_modelagem;

--states
CREATE TABLE states (
    id serial NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL
);

--cities
CREATE TABLE cities (
    id serial NOT NULL PRIMARY KEY,
    name varchar(50) NOT NULL,
    "stateId" integer REFERENCES states(id)
);

--customers
CREATE TABLE customers (
    id serial NOT NULL PRIMARY KEY,
	"fullName" text NOT NULL,
	cpf varchar(11) NOT NULL UNIQUE,
	email text NOT NULL UNIQUE,
    password text NOT NULL
);

--customerAddresses
CREATE TABLE "customerAddresses" (
    id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id) UNIQUE,
	street text NOT NULL,
	number integer NOT NULL,
	complement text,
	"postalCode" varchar(8) NOT NULL,
	"cityId" integer REFERENCES cities(id)
);

--customerPhones
CREATE TABLE "customerPhones" (
    id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
	number varchar(11) NOT NULL,
	type text NOT NULL 
);

--bankAccount
CREATE TABLE "bankAccount" (
    id serial NOT NULL PRIMARY KEY,
	"customerId" integer REFERENCES customers(id),
	"accountNumber" varchar(7) NOT NULL UNIQUE,
	agency varchar(5) NOT NULL,
	"openDate" timestamp NOT NULL DEFAULT NOW(),
	"closeDate" timestamp 
);

--