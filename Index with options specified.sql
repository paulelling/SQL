CREATE NONCLUSTERED INDEX [IDX_DW_Project_Totals_Work] ON [dbo].[#DW_Project_Totals_Work] 
(
	[period] ASC,
	[project_number] ASC
)WITH (PAD_INDEX  = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, IGNORE_DUP_KEY = OFF, FILLFACTOR = 90, ONLINE = OFF) ON [PRIMARY]


DROP INDEX [IDX_DW_Project_Totals_Work] ON [dbo].[#DW_Project_Totals_Work] WITH ( ONLINE = OFF )





