USE InvoiceManager

GO

ALTER TABLE dbo.Contractors
ADD Email varchar(50),
Phone varchar(15);