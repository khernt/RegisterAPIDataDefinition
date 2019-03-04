CREATE EXTENSION pgcrypto; --Allows PostgreSQL to understand UUIDs. Only have to create the extension once for a database.

--DROP TABLE product;

CREATE TABLE employee (
  recordid int NOT NULL DEFAULT(0),
  employeeid int NOT NULL DEFAULT (0),
  firstname character NOT NULL DEFAULT(0),
  lastname character,
  active character,
  classification character,
  manager character,
  password character,
  createdon timestamp without time zone NOT NULL DEFAULT now(),
  CONSTRAINT record_id PRIMARY KEY (recordid)
  
  
) WITH (
  OIDS=FALSE
);


-- stuff used to create the table and add two fields
CREATE TABLE employee (
	recordid uuid NOT NULL DEFAULT gen_random_uuid(),
	employeeid character varying(5) NOT NULL DEFAULT('00000'), 
	firstname character varying(32) NOT NULL DEFAULT(''),
	lastname character varying(32)  DEFAULT(''),
	active character varying(32) default('false'),
	classification character varying(32) NOT NULL DEFAULT(''),
	manager integer,
	password character varying(32) NOT NULL DEFAULT(''),
	createdon timestamp without time zone NOT NULL DEFAULT now(),
	CONSTRAINT recordid_pkey PRIMARY KEY (recordid)
) WITH (
  OIDS=FALSE
);


INSERT INTO employee (firstname, lastname, active, classification, manager, password)
       Values ( 'Khern', 'Toussaint', 'true', 'Cashier', '1', 'kpassword' )
RETURNING recordid, createdon;

INSERT INTO employee (firstname, lastname, active, classification, manager, password)
       Values ( 'Gabriel', 'DelCarmen', 'true', 'General Manager', '1', 'gpassword' )
RETURNING recordid, createdon;