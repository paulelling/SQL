select top 50 HR1.EMPLID, HR1.EFFDT
from msdb.V3PROD.dbo.PS_HRUSER_DATA HR1 with (nolock)
--inner join msdb.V3PROD.dbo.PS_HRUSER_DATA HR2 with (nolock)
--	on HR1.EMPLID = HR2.EMPLID
--	and HR1.EFFDT = HR2.EFFDT
inner join (
	select top 50 HR2.EMPLID, MAX(HR2.EFFDT) AS EFFDT
	from msdb.V3PROD.dbo.PS_HRUSER_DATA HR2 with (nolock)
	GROUP BY HR2.EMPLID
) HR3 on HR1.EMPLID = HR3.EMPLID AND HR1.EFFDT = HR3.EFFDT
where HR1.EMPLID in ('000029', '000040', '000047', '000084')


