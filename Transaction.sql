USE DBS;
GO

DECLARE 
	@ErrorMessage    NVARCHAR(4000),
	@ErrorNumber     INT,
	@ErrorSeverity   INT,
	@ErrorState      INT,
	@ErrorLine       INT,
	@ErrorProcedure  NVARCHAR(200);

-------------------------------------------------------------------------------
DECLARE @ScriptID varchar(40);
SET @ScriptID = '';

INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
VALUES (@ScriptID, 'Started', GetDate(), '');
-------------------------------------------------------------------------------

BEGIN TRY
	BEGIN TRANSACTION;

	-------------------------------------------------------------------------------
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID, 'Running', GetDate(), 'Updating...');
	-------------------------------------------------------------------------------

	-------------------------------------------------------------------------------
	-- Payload --------------------------------------------------------------------
	-------------------------------------------------------------------------------

	-------------------------------------------------------------------------------

	-------------------------------------------------------------------------------
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID, 'Running', GetDate(), CONVERT(varchar, @@ROWCOUNT) + ' records updated.');
	-------------------------------------------------------------------------------
	
	COMMIT;
END TRY
BEGIN CATCH

	SELECT 
		@ErrorMessage = ERROR_MESSAGE(),
		@ErrorNumber = ERROR_NUMBER(),
		@ErrorSeverity = ERROR_SEVERITY(),
		@ErrorState = ERROR_STATE(),
		@ErrorLine = ERROR_LINE(),
		@ErrorProcedure = ISNULL(ERROR_PROCEDURE(), '-');

	IF @@TRANCOUNT > 0
		BEGIN
		
			ROLLBACK TRANSACTION;

			INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
			VALUES (@ScriptID,' Error', GetDate(), 'Transaction rolled back.');

		END;

	-------------------------------------------------------------------------------
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID,' Error', GetDate(), 'Number: ' + CONVERT(varchar, @ErrorNumber));
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID,' Error', GetDate(), 'Message: ' + @ErrorMessage);
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID,' Error', GetDate(), 'Severity: ' + CONVERT(varchar, @ErrorSeverity));
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID,' Error', GetDate(), 'State: ' + CONVERT(varchar, @ErrorState));
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID,' Error', GetDate(), 'Procedure: ' + @ErrorProcedure);
	INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
	VALUES (@ScriptID,' Error', GetDate(), 'Line: ' + CONVERT(varchar, @ErrorLine));
	-------------------------------------------------------------------------------
	
END CATCH;

-------------------------------------------------------------------------------
INSERT INTO dbo.dw_log (ScriptID, StepID, EventTime, EventMsg)
VALUES (@ScriptID, 'Finished', GetDate(), '');
-------------------------------------------------------------------------------

SELECT * FROM dbo.DW_log WITH (NOLOCK)
WHERE ScriptID = @ScriptID ORDER BY EventTime

GO
