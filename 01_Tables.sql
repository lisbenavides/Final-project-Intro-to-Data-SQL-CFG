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
    
-- Data Analysis

    CREATE TABLE Data_Analysis (
	Run_id INTEGER, 
    Analyte VARCHAR(20) NOT NULL,
    Abundance FLOAT,
    CONSTRAINT PK_Analyte PRIMARY KEY (Run_id,Analyte)
    );
    




