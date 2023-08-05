--SELECT TOP 50 *
--FROM msdb.dbo.sysjobs_view

SELECT TOP 50 *
FROM msdb.dbo.sysjobs

--SELECT TOP 50 *
--FROM msdb.dbo.sysjobsteps
--WHERE command LIKE '%sparc_PSCompliance_Fill%'

SELECT TOP 50 *
FROM msdb.dbo.sysjobhistory

SELECT job_id FROM msdb.dbo.sysjobs_view WHERE name = N'Summary Tables SP'


