CREATE TABLE [dbo].[MsUser]
(
	[userID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [userName] VARCHAR(255) NOT NULL, 
    [userPhone] VARCHAR(50) NOT NULL, 
    [userPassword] VARCHAR(255) NOT NULL, 
    [userEmail] VARCHAR(255) NOT NULL, 
    [userFoodPreference] VARCHAR(255) NOT NULL, 
    [userImage] VARCHAR(255) NOT NULL
)

CREATE TABLE [dbo].[MsVoucher] (
    [voucherID]         INT           IDENTITY (1, 1) NOT NULL,
    [voucherName]       VARCHAR (255) NOT NULL,
    [description]       VARCHAR (500) NOT NULL,
    [startDate]         DATE          NOT NULL,
    [endDate]           DATE          NOT NULL,
    [discountAmount]      FLOAT NOT NULL,
    [photo]             VARCHAR (255) NOT NULL,
    PRIMARY KEY CLUSTERED ([voucherID] ASC)
);

CREATE TABLE [dbo].[MsDriver]
(
	[driverID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [driverName] VARCHAR(255) NOT NULL, 
    [driverLicensePlate] VARCHAR(255) NOT NULL, 
    [driverVehicleName] VARCHAR(255) NOT NULL, 
    [driverImage] VARCHAR(255) NOT NULL,
    [driverRating] FLOAT NOT NULL
)

CREATE TABLE [dbo].[MsVendorCategory]
(
	[categoryID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [categoryName] VARCHAR(255) NOT NULL,
    [categoryImage] VARCHAR(255) NOT NULL
)

CREATE TABLE [dbo].[MsVendor]
(
	[vendorID] INT NOT NULL PRIMARY KEY IDENTITY(1,1), 
    [vendorName] VARCHAR(255) NOT NULL, 
    [vendorAddress] VARCHAR(255) NOT NULL, 
    [vendorRating] FLOAT NOT NULL, 
    [vendorImage] VARCHAR(255) NOT NULL, 
    [vendorTypePreference] VARCHAR(255) NOT NULL,
    [categoryID] INT NOT NULL,
    FOREIGN KEY ([categoryID]) REFERENCES [MsVendorCategory]([categoryID]) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE [dbo].[MsProduct]
(
	[productID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
	[vendorID] INT NOT NULL, 
    [productName] VARCHAR(255) NOT NULL, 
    [productPrice] INT NOT NULL, 
    [productImage] VARCHAR(255) NOT NULL, 
    [productFoodType] VARCHAR(255) NOT NULL,
    [productCalories] INT NOT NULL,
    CONSTRAINT [FK_MsProduct_ToMsVendor] FOREIGN KEY ([vendorID]) REFERENCES [MsVendor]([vendorID]) ON UPDATE CASCADE ON DELETE CASCADE
)

CREATE TABLE [dbo].[MsCart]
(
	[userID] INT NOT NULL, 
	[productID] INT NOT NULL, 
    [quantity] INT NOT NULL, 
    CONSTRAINT [FK_MsCart_ToMsUser] FOREIGN KEY ([userID]) REFERENCES [MsUser]([userID]) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT [FK_MsCart_ToMsProduct] FOREIGN KEY ([productID]) REFERENCES [MsProduct]([productID]) ON UPDATE CASCADE ON DELETE CASCADE, 
    CONSTRAINT [PK_MsCart] PRIMARY KEY ([userID], [productID])
)

CREATE TABLE [dbo].[MsTransaction]
(
	[transactionID] INT NOT NULL PRIMARY KEY IDENTITY(1,1),
    [userID] INT NOT NULL,
	[driverID] INT NOT NULL, 
    [voucherID] INT, 
    [deliveryDate] DATE NOT NULL, 
    [deliveryTime] TIME NOT NULL, 
    [deliveryAddress] VARCHAR(255) NOT NULL, 
    [deliveryNotes] VARCHAR(255), 
    [paymentMethod] VARCHAR(255) NOT NULL, 
    CONSTRAINT [FK_MsTransaction_ToMsUser] FOREIGN KEY ([userID]) REFERENCES [MsUser]([userID]) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT [FK_MsTransaction_ToMsDriver] FOREIGN KEY ([driverID]) REFERENCES [MsDriver]([driverID]) ON UPDATE CASCADE ON DELETE CASCADE, 
    CONSTRAINT [FK_MsTransaction_ToMsVoucher] FOREIGN KEY ([voucherID]) REFERENCES [MsVoucher]([voucherID]) ON UPDATE CASCADE ON DELETE CASCADE 
)

CREATE TABLE [dbo].[MsTransactionDetail]
(
    [transactionID] INT NOT NULL,
	[productID] INT NOT NULL, 
    [quantity] INT NOT NULL, 
    CONSTRAINT [FK_MsTransactionDetail_ToMsProduct] FOREIGN KEY ([productID]) REFERENCES [MsProduct]([productID]) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT [FK_MsTransactionDetail_ToMsTransaction] FOREIGN KEY ([transactionID]) REFERENCES [MsTransaction]([transactionID]) ON UPDATE CASCADE ON DELETE CASCADE,
    CONSTRAINT [PK_MsTransaction] PRIMARY KEY ([transactionID], [productID])
)
