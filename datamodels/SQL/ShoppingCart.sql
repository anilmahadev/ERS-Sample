-- Example of a foreign key relationship
CREATE TABLE ShoppingCart (
    CartID INT IDENTITY(1,1) PRIMARY KEY,
    UserID INT,
    CreatedAt DATETIME NOT NULL,
    UpdatedAt DATETIME,
    CONSTRAINT FK_ShoppingCart_Users FOREIGN KEY (UserID)
    REFERENCES Users(UserID)
);