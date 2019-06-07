
-- Reference Data for AddressType 
MERGE INTO Persons_Status AS Target 
USING (VALUES 
  (0, N'Undefined'), 
  (1, N'OK'), 
  --(2, N'Deleted'),
  (3, N'yyy'),
  (4, N'ccc'),
  (5, N'aaaa')
) 
AS Source (id, description) 
ON Target.id = Source.id 
-- update matched rows 
WHEN MATCHED THEN 
UPDATE SET description = Source.description
-- insert new rows 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (id, description) 
VALUES (id, description) 
-- delete rows that are in the target but not the source 
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;
