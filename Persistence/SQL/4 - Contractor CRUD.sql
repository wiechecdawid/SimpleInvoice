USE InvoiceManager

GO

CREATE PROC Contractor_Details
(
	@Id int
)
AS
BEGIN
	SELECT *
	FROM dbo.Contractors
	WHERE Contractors.Id=@Id
END

GO

CREATE PROC dbo.Contractor_Add
(
	@ContractorName varchar(30),
	@Street varchar(25),
	@Building varchar(25),
	@City varchar(25),
	@SortCode varchar(6),
	@Account varchar(26),
	@VatNum varchar(11),
	@Email varchar(50),
	@Phone varchar(15)
)
AS
BEGIN
	INSERT INTO dbo.Contractors (ContractorName,Street,Building,City,SortCode,Account,VatNumber,Email,Phone)
	VALUES(@ContractorName,@Street,@Building,@City,@SortCode,@Account,@VatNum,@Email,@Phone)

	SELECT SCOPE_IDENTITY() AS Id
END

GO

CREATE PROC dbo.Contractor_Update
(
	@Id int,
	@ContractorName varchar(30),
	@Street varchar(25),
	@Building varchar(25),
	@City varchar(25),
	@SortCode varchar(6),
	@Account varchar(26),
	@VatNum varchar(11),
	@Email varchar(50),
	@Phone varchar(15)
)
AS
BEGIN
	UPDATE dbo.Contractors
	SET ContractorName=@ContractorName, Street=@Street, Building=@Building, City=@City, SortCode=@SortCode, Account=@Account, VatNumber=@VatNum, Email=@Email, Phone=@Phone
	
	WHERE Contractors.Id=@Id
END

GO

CREATE PROC dbo.Contractor_Delete
(
	@Id int
)
AS
BEGIN
	DELETE
	FROM dbo.Contractors
	WHERE Contractors.Id=@Id
END