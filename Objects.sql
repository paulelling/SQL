--select top 50 *
--from msdb.sys.sysobjects
--where name like '%SOX_PS%'

--select top 50 *
--from msdb.sys.all_objects
--where name like '%SOX_PS%'

--select top 50 *
--from ArcadisDBS.sys.sysobjects
--where name like '%SOX_PS%'

--SELECT top 50 * --name 
--FROM msdb.dbo.syscategories 
----WHERE name=N'SOX Compliance' 
----AND category_class=1



SELECT text FROM syscomments 
        WHERE id = (SELECT id FROM sysobjects WHERE name = 'uspLogError' AND xtype='P');


select top 50 id, text 
from syscomments with (nolock)
where text like '%EmployeeNumber%' and text like '%UserIDEmployee%'




select top 50 com.id, obj.name, obj.xtype, com.text 
from syscomments com with (nolock)
inner join sysobjects obj with (nolock) on com.id = obj.id
where com.text like '%EmployeeNumber%' and com.text like '%UserIDEmployee%'
order by obj.name



SELECT 
  name AS column_name,
  TYPE_NAME(system_type_id) AS column_type,
  max_length,
  collation_name,
  is_nullable
FROM sys.columns
WHERE object_id = OBJECT_ID(N'Sales.Orders');





