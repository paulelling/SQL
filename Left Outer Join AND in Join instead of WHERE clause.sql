SELECT d.emplid, isnull(dependentbenef, '') as dependentbenef, 
isnull(dep_life_cover, '') as dep_life_cover, 
isnull(p.relationship, '') as relationship 
, isnull(depend_life_election, 0) as depend_life_election, isnull(depend_life_proposed, 0) as depend_life_proposed
--isnull(depend_life_child_election, 0) as depend_life_child_election, isnull(depend_life_child_proposed, 0) as depend_life_child_proposed
, LAB.EMPLID, LAB.PLAN_TYPE, 
CONVERT(VARCHAR(10),LAB.EFFDT,101) EFFDT, CONVERT(VARCHAR(10),LAB.DEDUCTION_END_DT,101) DEDUCTION_END_DT
, CONVERT(VARCHAR(10),LAB.COVERAGE_BEGIN_DT,101) COVERAGE_BEGIN_DT, CONVERT(VARCHAR(10),LAB.COVERAGE_END_DT,101) COVERAGE_END_DT
, CONVERT(VARCHAR(10),LAB.COVERAGE_ELECT_DT,101) COVERAGE_ELECT_DT
, LAB.BENEFIT_PLAN, LAB.LIFE_ADD_COVRG, LAB.FLAT_AMOUNT
FROM msdb.dbo.BenEnGeneral g
INNER JOIN msdb.dbo.BenEnDependent d
	ON g.emplid = d.emplid
INNER JOIN msdb.dbo.PS_DEPENDENT_BENEF_REENROLL p
	ON g.emplid = p.emplid collate SQL_Latin1_General_CP1_CI_AS 
	and d.dependentbenef = p.dependent_benef collate SQL_Latin1_General_CP1_CI_AS 
INNER JOIN msdb.dbo.PS_EMPLOYEES emp
	ON g.emplid = emp.EMPLID collate SQL_Latin1_General_CP1_CI_AS 
INNER JOIN msdb.dbo.BenEnElection e
	ON g.emplid = e.emplid
LEFT OUTER JOIN msdb.dbo.PS_LIFE_ADD_BEN LAB WITH (NOLOCK)
	ON g.emplid = LAB.EMPLID collate SQL_Latin1_General_CP1_CI_AS 
	AND LAB.PLAN_TYPE = '24'
	AND ((LAB.EFFDT IS NULL) OR (LAB.EFFDT >= '12/15/2008' AND LAB.EFFDT <= '1/1/2009'))
Where  
validated = 'Y' 
AND emp.COUNTRY IN ('USA', 'PRI') 
and p.eff_status = 'A' 
and p.effdt = (select max(p2.effdt) from msdb.dbo.PS_DEPENDENT_BENEF_REENROLL p2 where p2.emplid = p.emplid and d.dependentbenef = p2.dependent_benef collate SQL_Latin1_General_CP1_CI_AS and p2.eff_status = 'A') 
and dep_life_cover = 'Y'
and p.relationship in ('SP', 'R')
--AND
--LAB.PLAN_TYPE = '24'

order by g.emplid, dependentbenef






