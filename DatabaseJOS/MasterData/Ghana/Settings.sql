MERGE INTO Settings AS Target 
USING (VALUES 
  (1, N'\\bnc10\images', 'joseph', GETDATE(), 9999)
) 
AS Source (allowdelete, imagespath, userroot, lastmodified,id) 
ON Target.id = Source.id 
-- update matched rows 
WHEN MATCHED THEN 
UPDATE SET allowdelete = Source.allowdelete, imagespath = Source.imagespath, userroot = Source.userroot, lastmodified = Source.lastmodified
-- insert new rows 
WHEN NOT MATCHED BY TARGET THEN 
INSERT (allowdelete, imagespath, userroot, lastmodified, id) 
VALUES (allowdelete, imagespath, userroot, lastmodified, id) 
-- delete rows that are in the target but not the source 
WHEN NOT MATCHED BY SOURCE THEN 
DELETE;
