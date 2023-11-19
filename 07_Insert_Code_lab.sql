USE GeochemicalDB;

INSERT INTO Code_lab 
(Lab_id, Name, Acronym, Contact_email) 
VALUES
(1, 'Chemical Analysis Lab', 'CAL', 'cal@example.com'),
(2, 'Geochemistry Research Center', 'GRC', 'grc@example.com'),
(3, 'Mineral Sciences Lab', 'MSL', 'msl@example.com'),
(4, 'Environmental Testing Facility', 'ETF', 'etf@example.com'),
(5, 'Petroleum Research Lab', 'PRL', 'prl@example.com'),
(6, 'Analytical Chemistry Services', 'ACS', 'acs@example.com'),
(7, 'Earth Sciences Laboratory', 'ESL', 'esl@example.com'),
(8, 'Materials Research Institute', 'MRI', 'mri@example.com'),
(9, 'Water Quality Analysis Center', 'WQAC', 'wqac@example.com'),
(10, 'Advanced Spectroscopy Lab', 'ASL', 'asl@example.com');

SELECT * FROM Code_lab;