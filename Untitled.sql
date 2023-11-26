CREATE DATABASE GeochemicalDB;

USE GeochemicalDB;

-- Data sample

CREATE TABLE Data_Sample (
    Sample_id INTEGER NOT NULL PRIMARY KEY,
    Sample_code VARCHAR(20) NOT NULL,
    Sample_name VARCHAR(20) NOT NULL,
    Sample_type VARCHAR(20) NOT NULL,
    Depth FLOAT,
    Material_type VARCHAR(20),
	NAD83_Long FLOAT,
    NAD83_Lat FLOAT,
    Elev FLOAT,
    coord_conf CHAR(1),
    UTM_Zone VARCHAR(2)
); 

SELECT * FROM Data_Sample;

-- Code laboratory

CREATE TABLE Code_lab (
	Lab_id INTEGER,
    Name VARCHAR(20),
    Acronym VARCHAR(20),
    Contact_email VARCHAR(20)
);

ALTER TABLE Code_lab
ADD PRIMARY KEY (Lab_id);

ALTER TABLE Code_lab
MODIFY COLUMN Name VARCHAR(50);

ALTER TABLE Code_lab
MODIFY COLUMN Lab_id INTEGER NOT NULL;

SELECT * FROM Code_lab;

-- Code method

CREATE TABLE Code_method (
	Method_id INTEGER NOT NULL PRIMARY KEY,
    Method_descrip VARCHAR(50),
    Method_abbr VARCHAR(20) 
);

SELECT * FROM Code_method;

-- Data publish

CREATE TABLE Data_publish (
	Sample_id INTEGER NOT NULL,
    Pub_Issue VARCHAR(50),
    CONSTRAINT PK_Publish PRIMARY KEY (Sample_id,Pub_Issue)
);

TRUNCATE TABLE Data_publish;

ALTER TABLE Data_publish
ADD CONSTRAINT fk_sample_id 
FOREIGN KEY (Sample_id)
REFERENCES Data_Sample (Sample_id);

SELECT * FROM Data_publish;

-- Lab run
    
CREATE TABLE Lab_run (
    Sample_id INTEGER NOT NULL,
    Size_fraction VARCHAR(20) NOT NULL,
    Method_id INTEGER NOT NULL,
    Lab_id INTEGER NOT NULL,
    Run_id INTEGER PRIMARY KEY,
    CONSTRAINT Uniqueness UNIQUE (Sample_id, Method_id, Size_fraction)
);

ALTER TABLE Lab_run
ADD CONSTRAINT fk_sample_id_lab_run 
FOREIGN KEY (Sample_id)
REFERENCES Data_Sample (Sample_id),
ADD CONSTRAINT fk_method_id 
FOREIGN KEY (Method_id)
REFERENCES Code_method (Method_id),
ADD CONSTRAINT fk_lab_id 
FOREIGN KEY (Lab_id)
REFERENCES Code_lab (Lab_id);

SELECT * FROM Lab_run;
    
-- Data Analysis

    CREATE TABLE Data_Analysis (
	Run_id INTEGER, 
    Analyte VARCHAR(20) NOT NULL,
    Abundance FLOAT,
    CONSTRAINT PK_Analyte PRIMARY KEY (Run_id,Analyte)
    );
    
ALTER TABLE Data_Analysis
ADD CONSTRAINT fk_run_id
FOREIGN KEY (Run_id)
REFERENCES Lab_run (Run_id);
    
SELECT * FROM Data_Analysis;

CREATE TABLE Chondrite_REE_values (
    Analyte VARCHAR(20) PRIMARY KEY,
    Abundance FLOAT
    );
    
SELECT * FROM Chondrite_REE_values;

-- Nota para mi: recordar que en la tabla Data_publish uso una 
-- CONSTRAINT - PRIMARY KEY (A combination of a NOT NULL and UNIQUE. 
-- Uniquely identifies each row in a table). Mientras que en la tabla Lab_run uso 
-- una CONSTRAINT - UNIQUE (Ensures that all values in a column are different) porque
-- despues voy a necesitar usar el Run_id como PK en otra tabla. 



