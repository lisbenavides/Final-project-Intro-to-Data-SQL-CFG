USE GeochemicalDB;

INSERT INTO Code_method 
(Method_id, Method_descrip, Method_abbr) 
VALUES
(1, 'ICP-MS using Aqua regia digestion', 'ICP-AR'),
(2, 'ICP-MS using Lithium metaborate fusion', 'ICP-F'),
(3, 'Instrumental Neutron Activation Analysis', 'INAA');

SELECT * FROM Code_method;