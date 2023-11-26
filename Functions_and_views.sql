USE GeochemicalDB;

-- Test: SELECT Abundance FROM Chondrite_REE_values WHERE Analyte = "La_ppm";

-- Normalization function

DELIMITER //
CREATE FUNCTION Normalize(analyte_to_norm VARCHAR(20), abundance_from_analyte FLOAT)
RETURNS FLOAT
READS SQL DATA
BEGIN
	DECLARE normalize_abundance FLOAT;
	DECLARE chondrite_abundance FLOAT; 
	SELECT Abundance INTO chondrite_abundance 
	FROM Chondrite_REE_values 
	WHERE Analyte = analyte_to_norm
    LIMIT 1;
  IF chondrite_abundance IS NOT NULL AND chondrite_abundance != 0 THEN
    SET normalize_abundance = abundance_from_analyte / chondrite_abundance;
  ELSE
    SET normalize_abundance = NULL; 
  END IF;
	RETURN normalize_abundance;
END
// DELIMITER ;

-- DROP FUNCTION Normalize;

-- SELECT Normalize("La_ppm", 0.1);

-- Test:
-- SELECT Analyte, Normalize(Analyte, Abundance) 
-- FROM Data_Analysis
-- WHERE Run_id = 1355;

-- View number of analytes per laboratory

CREATE VIEW analytes_per_lab
AS
SELECT Lab_run.Lab_id, COUNT(*) AS Number_of_analytes
FROM Lab_run 
LEFT JOIN Data_analysis
ON Lab_run.Run_id = Data_analysis.Run_id
JOIN Code_method
ON Lab_run.Method_id = Code_method.Method_id  
GROUP BY Lab_run.Lab_id
ORDER BY Lab_run.Lab_id;

SELECT * FROM analytes_per_lab;

DROP VIEW analytes_per_lab;


