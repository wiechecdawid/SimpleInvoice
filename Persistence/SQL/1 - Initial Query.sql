--CREATE DATABASE InvoiceManager;
USE InvoiceManager;

CREATE TABLE Contractors (
	Id int CONSTRAINT PK_Contractor PRIMARY KEY,
	ContractorName varchar(30),
	Street varchar(25),
	Building varchar(25),
	City varchar(25),
	SortCode varchar(6),
	Account varchar(26),
	VatNumber varchar(11)
);

CREATE TABLE Clients (
	Id int CONSTRAINT PK_Client PRIMARY KEY,
	ContractorId int CONSTRAINT FK_ClientContractor FOREIGN KEY (Id) REFERENCES Contractors(Id)
);

CREATE TABLE Suppliers (
	Id int CONSTRAINT PK_Supplier PRIMARY KEY,
	ContractorId int CONSTRAINT FK_SupplierContractor FOREIGN KEY (Id) REFERENCES Contractors(Id)
);

CREATE TABLE PaymentTerms (
	Id int CONSTRAINT PK_PaymentTerms PRIMARY KEY,
	TermsType varchar(7)
);

CREATE TABLE Contracts (
	Id int CONSTRAINT PK_Contract PRIMARY KEY,
	ClientId int CONSTRAINT FK_ClientContract FOREIGN KEY (Id) REFERENCES Clients(Id),
	SupplierId int CONSTRAINT FK_SupplierContract FOREIGN KEY (Id) REFERENCES Suppliers(Id),
	StartDate date NOT NULL,
	ExpirationDate date NOT NULL,
	TermsId int CONSTRAINT FK_ContractsPaymentTerms FOREIGN KEY (Id) REFERENCES PaymentTerms(Id)
);

CREATE TABLE PurchaseOrders(
	Id int CONSTRAINT PK_PurchaseOrder PRIMARY KEY,
	ContractId int CONSTRAINT FK_PurchaseOrderContract FOREIGN KEY (Id) REFERENCES Contracts(Id),
	PoValue money,
	Vat money,
	CreationDate date,
	DeliveryDate date
);

CREATE TABLE Invoices (
	Id int CONSTRAINT PK_Invoice PRIMARY KEY,
	PoId int CONSTRAINT FK_InvoicePo FOREIGN KEY (Id) REFERENCES PurchaseOrders(Id),
	InvoiceDate date NOT NULL,
	InvoicedValue money,
	Vat money
);

CREATE TABLE CreditNotes (
	Id int CONSTRAINT PK_CreditNote PRIMARY KEY,
	InvoiceId int CONSTRAINT FK_CreditNoteInvoice FOREIGN KEY (Id) REFERENCES Invoices(Id),
	CreditDate date NOT NULL,
	CreditedValue money,
	Vat money
); 

CREATE TABLE Payments (
	Id int CONSTRAINT PK_Payment PRIMARY KEY,
	InvoiceId int CONSTRAINT FK_PaymentInvoice FOREIGN KEY (Id) REFERENCES Invoices(Id),
	PaymentDate date NOT NULL
);
