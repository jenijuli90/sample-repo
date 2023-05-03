USE [Bikestores]
GO
/****** Object:  StoredProcedure [dbo].[SPGETPROCUCTCOUNT]    Script Date: 5/3/2023 11:26:04 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[SPGETPROCUCTCOUNT] 
@MODEL_YEAR SMALLINT,
@PRODUCT_COUNT INT OUTPUT
AS
BEGIN
SELECT PRODUCT_NAME,
       LIST_PRICE
	   FROM PRODUCTION_PRODUCTS
	   WHERE MODEL_YEAR = @MODEL_YEAR

	   SELECT @PRODUCT_COUNT =@@ROWCOUNT
select 'success'
END