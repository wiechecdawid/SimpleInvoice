USE InvoiceManager

GO

CREATE PROCEDURE dbo.Contractor_GetById
(
	@Id int
)
AS
BEGIN
	SELECT *
	FROM dbo.Contractors
	WHERE Id=@Id
END

GO

CREATE PROCEDURE dbo.Contractor_GetSuppliers
(
	@Id int
)
AS
BEGIN
	DECLARE @ClientId int

	SET @ClientId = (SELECT Id
	FROM dbo.Clients
	WHERE ContractorId=@Id);

	SELECT SupplierId
	FROM dbo.Contracts c
	LEFT JOIN dbo.Suppliers s
	ON c.SupplierId=s.Id
	WHERE ClientId=@ClientId
END

GO	

CREATE PROCEDURE dbo.Contractor_GetClients
(
	@Id int
)
AS
BEGIN
	DECLARE @SupplierId int

	SET @SupplierId = (SELECT Id
	FROM dbo.Suppliers
	WHERE ContractorId=@Id);

	SELECT ClientId
	FROM dbo.Contracts c
	LEFT JOIN dbo.Clients cl
	ON c.ClientId=cl.Id
	WHERE ClientId=SupplierId
END

