ALTER PROC usp_AccountTransaction
	@AccountNum INT,
	@Amount DECIMAL
AS
BEGIN
	BEGIN TRY --Start the Try Block..
		BEGIN TRANSACTION -- Start the transaction..
			UPDATE MyChecking SET Amount = Amount - @Amount
				WHERE AccountNum = @AccountNum
			UPDATE MySavings SET Amount = Amount + @Amount
				WHERE AccountNum = @AccountNum
		COMMIT TRAN -- Transaction Success!
	END TRY
	BEGIN CATCH
		IF @@TRANCOUNT > 0
			ROLLBACK TRAN --RollBack in case of Error
		-- you can Raise ERROR with RAISEERROR() Statement including the details of the exception
		RAISERROR(ERROR_MESSAGE(), ERROR_SEVERITY(), 1)
	END CATCH
END
GO
