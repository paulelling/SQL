SELECT TOP 50
uid_emp.employeenumber,
eaa.emplid,
uid_emp.ntlogin, 
eaa.ext,
empprof.work_phone,
eaa.phone
FROM     
mss_profile_rpt empprof WITH (nolock) 
INNER JOIN useridemployee uid_emp WITH (nolock) 
	ON uid_emp.employeenumber = Convert(INTEGER,empprof.empl_id) 
left JOIN ess_alternate_address eaa WITH (nolock) 
ON uid_emp.employeenumber = Convert(INTEGER,eaa.emplid) 
  AND eaa.active = 1 
ORDER BY uid_emp.ntlogin 
