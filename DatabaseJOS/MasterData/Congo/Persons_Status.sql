MERGE INTO Persons_Status AS Target 
USING (VALUES 
  (10, N'Undefined'), 
  (11, N'OK'), 
  (12, N'Deleted'),
  (13, N'yyy'),
  (14, N'ccc')  
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
