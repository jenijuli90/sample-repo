USE [TestDB]
GO

/****** Object:  StoredProcedure [dbo].[uspInsertData]    Script Date: 11/8/2022 9:36:54 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

--Outer procedure
CREATE PROCEDURE [dbo].[uspInsertData]
   @pID INT,
   @pValue INT
AS
BEGIN
 
   BEGIN TRY
 
      BEGIN TRANSACTION
 
         INSERT INTO TestTable(ID, Value)
         VALUES  (@pID, @pValue)
 
         EXEC uspUpdateData @pID=@pID, @pNewValue=NULL
 
      IF @@TRANCOUNT > 0
         COMMIT
 
   END TRY
 
   BEGIN CATCH 
 
      IF @@TRANCOUNT > 0
         ROLLBACK
 
      SELECT ERROR_NUMBER() AS ErrorNumber
      SELECT ERROR_MESSAGE() AS ErrorMessage
 
   END CATCH
END
 
GO


