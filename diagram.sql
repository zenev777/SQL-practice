CREATE DATABASE DEMO;

-- Create the Countries table
CREATE TABLE Countries (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL
);

-- Create the Addresses table
CREATE TABLE Addresses (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    StreetName NVARCHAR(20) NOT NULL,
    StreetNumber INT,
    PostCode INT NOT NULL,
    City NVARCHAR(25) NOT NULL,
    CountryId INT NOT NULL,
    FOREIGN KEY (CountryId) REFERENCES Countries(Id)
);

-- Create the Vendors table
CREATE TABLE Vendors (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    Name NVARCHAR(25) NOT NULL,
    NumberVAT NVARCHAR(15) NOT NULL,
    AddressId INT NOT NULL,
    FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- Create the Clients table
CREATE TABLE Clients (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    Name NVARCHAR(25) NOT NULL,
    NumberVAT NVARCHAR(15) NOT NULL,
    AddressId INT NOT NULL,
    FOREIGN KEY (AddressId) REFERENCES Addresses(Id)
);

-- Create the Categories table
CREATE TABLE Categories (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    Name NVARCHAR(10) NOT NULL
);

-- Create the Products table
CREATE TABLE Products (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    Name NVARCHAR(35) NOT NULL,
    Price DECIMAL(18, 2) NOT NULL,
    CategoryId INT NOT NULL,
    VendorId INT NOT NULL,
    FOREIGN KEY (CategoryId) REFERENCES Categories(Id),
    FOREIGN KEY (VendorId) REFERENCES Vendors(Id)
);

-- Create the Invoices table
CREATE TABLE Invoices (
    Id INT IDENTITY(0,1) PRIMARY KEY,
    Number INT UNIQUE NOT NULL,
    IssueDate DATETIME2 NOT NULL,
    DueDate DATETIME2 NOT NULL,
    Amount DECIMAL(18, 2) NOT NULL,
    Currency NVARCHAR(5) NOT NULL,
    ClientId INT NOT NULL,
    FOREIGN KEY (ClientId) REFERENCES Clients(Id)
);

-- Create the ProductsClients table
CREATE TABLE ProductsClients (
    ProductId INT NOT NULL,
    ClientId INT NOT NULL,
    PRIMARY KEY (ProductId, ClientId),
    FOREIGN KEY (ProductId) REFERENCES Products(Id),
    FOREIGN KEY (ClientId) REFERENCES Clients(Id)
);


