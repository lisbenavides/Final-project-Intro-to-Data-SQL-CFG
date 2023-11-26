USE GeochemicalDB; 

-- List of samples with analytes to normalize
SELECT Sample_id
FROM Lab_run
WHERE Run_id IN ( 
	SELECT T1.Run_id 
    FROM (
		SELECT Run_id, COUNT(*) AS Normalizable_analytes 
        FROM Data_Analysis 
		WHERE Analyte IN ('La_ppm', 'Ce_ppm', 'Pr_ppm','Nd_ppm','Sm_ppm','Eu_ppm','Gd_ppm','Tb_ppm','Dy_ppm','Ho_ppm','Er_ppm','Tm_ppm','Yb_ppm','Lu_ppm')
		GROUP BY Run_id ORDER BY Normalizable_analytes DESC
	) AS T1
	WHERE T1.Normalizable_analytes = 14
);


