USE GeochemicalDB;

-- Some tests:

SELECT Pub_Issue, COUNT(*) AS Number_of_samples 
FROM Data_publish
GROUP BY Pub_Issue
ORDER BY Pub_Issue;

SELECT Sample_id
FROM Data_publish
WHERE Pub_issue = 'B110';

-- Cantidad de corridas que hay por método

SELECT Method_id, Size_fraction, COUNT(*)
FROM Lab_run
GROUP BY Method_id, Size_fraction
ORDER BY Method_id;

-- Left Join: How many analytes has each method
SELECT Lab_run.Method_id, Lab_run.Size_fraction, COUNT(*)
FROM Lab_run 
left join Data_analysis 
on Lab_run.Run_id = Data_analysis.Run_id
GROUP BY Lab_run.Method_id, Lab_run.Size_fraction
ORDER BY Method_id;

-- Left Join: How many analytes has each method base on size fraction
SELECT Code_method.Method_descrip, Lab_run.Size_fraction, COUNT(*)
FROM Lab_run 
LEFT JOIN Data_analysis 
ON Lab_run.Run_id = Data_analysis.Run_id
JOIN Code_method
ON Lab_run.Method_id = Code_method.Method_id
GROUP BY Lab_run.Method_id, Lab_run.Size_fraction
ORDER BY Code_method.Method_id;

SELECT Analyte, COUNT(*)
FROM Data_analysis
GROUP BY Analyte
ORDER BY Analyte;






