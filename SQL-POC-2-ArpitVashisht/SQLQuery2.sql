create database eCommercePocArpit;
use eCommercePocArpitV;

create database eCommercePocArpitV;
use eCommercePocArpitV;
Create Table UserTable
(
userId int NOT NULL Primary Key,
firstName nvarchar(50) NOT NULL,
lastName nvarchar(50) NOT NULL,
dob DATE NOT NULL,
gender nvarchar(1) NOT NULL,
userAddress INT,
userPhoneNo INT,
userEmail INT,
createdOn DATE,
updatedOn DATE,
isDeleted BIT,
userRole nvarchar(50) NOT NULL
);

Create TABLE Phone
(
phoneId INT PRIMARY KEY,
userId INT NOT NULL,
countryCode nvarchar(5) NOT NULL,
phoneNumber nvarchar(10) NOT NULL,
primaryPhone BIT NOT NULL DEFAULT 0,
FOREIGN KEY(userId) REFERENCES UserTable(userId) ON DELETE CASCADE
);

ALTER TABLE UserTable
ADD FOREIGN KEY(userPhoneNo)
REFERENCES Phone(phoneId);

Create TABLE Email
(
emailId INT PRIMARY KEY,
userId INT NOT NULL,
email nvarchar(200) NOT NULL,
emailType nvarchar(40) NOT NULL,
primaryEmail BIT NOT NULL DEFAULT 0,
FOREIGN KEY(userId) REFERENCES UserTable(userId) ON DELETE CASCADE
);

ALTER TABLE UserTable
ADD FOREIGN KEY(userEmail)
REFERENCES Email(emailId);

Create TABLE Adress
(
adressId INT PRIMARY KEY,
userId INT NOT NULL,
adress nvarchar(MAX) NOT NULL,
city nvarchar(60) NOT NULL,
states nvarchar(60) NOT NULL,
country nvarchar(60) NOT NULL,
postalCode nvarchar(60) NOT NULL,
adressType nvarchar(60) NOT NULL,
primaryAdress BIT NOT NULL DEFAULT 0,
FOREIGN KEY(userId) REFERENCES UserTable(userId) ON DELETE CASCADE
);

ALTER TABLE UserTable
ADD FOREIGN KEY(userAddress)
REFERENCES Adress(adressId);

Create TABLE Product
(
productId INT PRIMARY KEY,
productName nvarchar(MAX) NOT NULL,
manufacturerName nvarchar(100) NOT NULL,
pricePerUnit INT NOT NULL,
categoryId INT NOT NULL,
productImage nvarchar(MAX),
shortDescription nvarchar(MAX) NOT NULL,
longDescription nvarchar(MAX) NOT NULL,
isActive BIT NOT NULL DEFAULT 1,
isDeleted BIT NOT NULL DEFAULT 0,
isFeatured BIT NOT NULL DEFAULT 0,
createdOn DATE,
updatedOn DATE,
FOREIGN KEY(categoryId) REFERENCES ProductCategory(categoryId) ON DELETE CASCADE
);

Create TABLE ProductCategory
(
categoryId INT PRIMARY KEY,
categoryName nvarchar(100) NOT NULL,
categoryImage nvarchar(MAX),
categoryDescription nvarchar(MAX) NOT NULL,
createdOn DATE,
updatedOn DATE,
parentId INT 
);

Create TABLE Cart
(
cartId INT PRIMARY KEY,
userId INT NOT NULL,
datePlaced DATE NOT NULL
FOREIGN KEY(userId) REFERENCES UserTable(userId) ON DELETE CASCADE
);

Create TABLE CartDetails
(
cartDetailId INT PRIMARY KEY,
cartId INT NOT NULL,
productId INT NOT NULL,
quantity INT NOT NULL,
dateAdded DATE NOT NULL
FOREIGN KEY(cartId) REFERENCES Cart(cartId) ON DELETE CASCADE
);

ALTER TABLE CartDetails
ADD FOREIGN KEY(productId)
REFERENCES Product(productId) ON DELETE CASCADE;


Create TABLE OrderDetails
(
orderId INT PRIMARY KEY,
cartId INT NOT NULL,
paymentMode nvarchar(30) NOT NULL,
orderDate DATE NOT NULL,
dateOfDelivery DATE NOT NULL,
returnDate DATE NOT NULL,
dateAdded DATE NOT NULL,
isDelivered BIT NOT NULL DEFAULT 0,
returnRequest BIT NOT NULL DEFAULT 0,
);

ALTER TABLE OrderDetails
ADD FOREIGN KEY(cartId)
REFERENCES Cart(cartId) ON DELETE CASCADE;

CREATE INDEX ix_Product_productName
ON Product(productName);

ALTER TABLE Product 
ALTER COLUMN productName NVARCHAR(200) NOT NULL

CREATE INDEX ix_ProductCategory_categoryName
ON ProductCategory(categoryName);
