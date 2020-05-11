USE InvoiceManager

GO

CREATE PROC dbo.Contractor_GetAll
AS
BEGIN
	SELECT *
	FROM dbo.Contractors
END