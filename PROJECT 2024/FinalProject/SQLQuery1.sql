CREATE TABLE Users (
    UserID INT IDENTITY(1,1) NOT NULL ,
    Username VARCHAR(50)  NULL ,
    PasswordHash  VARCHAR(255)  NULL,
    Role VARCHAR(10),
    Enabled BIT NULL,
    PRIMARY KEY (UserID)

);


CREATE TABLE Categories (
    CategoryID INT IDENTITY (1, 1) NOT NULL,
    CategoryName VARCHAR (50) NULL,
    PRIMARY KEY (CategoryID)
);

CREATE TABLE Products (
    ProductID INT IDENTITY(1,1) NOT NULL,
    ProductName VARCHAR(100) NOT NULL,
    CategoryID INT NOT NULL,
    CONSTRAINT FK_Products_Categories FOREIGN KEY (CategoryID) 
	REFERENCES Categories (CategoryID),
    Description VARCHAR(255),
    ProductImage VARCHAR(255),
    ProductPrice DECIMAL(10, 2) NOT NULL,
    PRIMARY KEY (ProductID)
);

CREATE TABLE Sales (
    SalesID VARCHAR (10) NOT NULL,
    ProductID INT NOT NULL,
    Quantity INT NULL,
    SalesDate DATETIME NULL,
    Confirmed BIT DEFAULT 0 NOT NULL,
    PRIMARY KEY (SalesID, ProductID)
);

INSERT INTO Categories (CategoryName) VALUES 
('Cereals'),
('Beverages'),
('Snacks'),
('Sauce'),
('Frozen Foods'),
('Pet Foods');

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (1, 'NESTUM 3IN1 BROWN RICE 10X27G', 8.99, 'Your favourite Nestum is now available with Brown Rice!', 'Brown.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (1, 'NESTLE KOKO KRUNCH ECONOPACK 450G', 12.49, 'Wake up to a bowl of happiness of NESTLE KOKO KRUNCH chocolate cereal', 'Koko.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (1, 'NESTLE HONEY STARS ECONOPACK 450G', 12.49, 'Keep your kids curious and inquisitive with the delicious NESTLE HONEY STARS', 'Honey.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (1, 'QUAKER WHOLE ROLLED OATS 800G', 9.49, 'Quaker Whole Rolled Oat is 100% whole grains which may help reduce the risk of heart disease', 'Quack.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (1, 'NESTLE MILO CEREAL ECONOPACK 450G', 12.49, 'Let your kids stay active all throughout their days withthe delicious NESTLE MILO Breakfast cereal!', 'Milo.png')


INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (2, 'A&W SARSAPARILLA BOTTLE DRINK 1.5L', 2.29, 'An old-classic beverage that we all know and love, A&W never fails to satisfy your thirst', 'AW.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (2, '100PLUS ORIGINAL REDUCED SUGAR 1.5L', 2.99, '100PLUS Reduced Sugar has 33% less sugar compared to 100PLUS Original ', '100plus.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (2, 'DUTCH LADY UHT CHOCOLATE MILK 1L', 5.79, 'Dutch Lady® Chocolate Flavoured Milk is an indulgent blend of smooth, creamy milk with the richness of chocolate flavour', 'Dutch.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (2, 'RIBENA STRAWBERRY 1L', 12.69, 'Quench your thirst with the vibrant and fruity taste of Ribena Strawberry in a 1L bottle', 'Ribena.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (2, 'FANTA S/BERRY 1.5L', 2.85, 'Fanta Strawberry in a 1.5L bottle is a delightful strawberry-flavored soda that brings a burst of fruity refreshment with every sip', 'Fanta.png')


INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (3, 'MAMEE MONSTER BLACK PEPPER 8X25G', 2.99, 'Introducing the bold and flavorful Mamee Monster Black Pepper, available in a convenient 8x25g pack', 'Mamee.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (3, 'MISTER POTATO TOMATO 60G', 2.85, 'Mister Potato Tomato, conveniently packaged in a 60g snack-size, offers a delightful and savory twist to traditional potato snacks', 'Mister.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (3, 'PAGODA MENGLEMBU G/NUT 110G', 3.29, 'Savor the delectable taste of Pagoda Menglembu Roasted Groundnuts, now available in a 120g pack', 'Pagoda.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (3, 'TONG GARDEN SALTED PISTACHIOS 140G', 13.99, 'Indulge in the rich, buttery flavor of Tong Garden Salted Pistachios', 'Tong.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (3, 'LAYS MAXX CHICKEN WING 70G', 4.49, 'Indulge in the bold and irresistible flavor of Lays Maxx Chicken Wing Chips in a convenient 70g pack', 'Lays.png')


INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (4, 'GARDENS CHILLI SAUCE 710G', 6.99, 'Elevate your culinary creations with Gardens Chilli Sauce in a generous 710g bottle', 'Garden.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (4, 'JALEN KICAP LEMAK MANIS 650ML', 7.79, 'Jalen Kicap Lemak Manis, a classic Malaysian sweet soy sauce, is your key to enhancing the flavors of your dishes', 'Jalen.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (4, 'LADYS CHOICE REAL MAYONNAISE 470ML', 10.69, 'Experience the authentic and creamy delight of Ladys Choice Real Mayonnaise in a 470ml jar', 'Lady.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (4, 'LEE KUM KEE - PANDA BRAND OYSTER SAUCE 770G', 8.90, ' This oyster sauce has a robust flavour and a rich colour which makes it an ideal all-purpose sauce', 'Lee.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (4, 'KEWPIE DRESSING THOUSAND ISLAND 210ML', 7.99, 'Kewpie Thousand Island Dressing with Herbs 210ml', 'Kewpie.png')


INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (5, 'AYAMAS GOLDEN NUGGETS 850G', 15.89, 'Enjoy the golden and crispy delight of Ayamas 850-gram pack of chicken nuggets', 'Ayam.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (5, 'FIGO BEEF MEAT BALL 500G', 12.75, 'Figo Beef Meat Ball is perfect for your next meal', 'Figo.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (5, 'EVERBEST JAPANESE TOFU PUFF 500GM', 9.99, 'Everbest Japanese Tofu Puff in a 500g package brings you a versatile and high-quality tofu product, perfect for various culinary creations', 'Everbest.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (5, 'KAWAN FLAKEY PARATHA 400G', 6.59, 'Parathas have a flakey, layered texture and a wonderful aroma', 'Kawan.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (5, 'KAMI SEAFOOD DIM SUM 300G', 8.69, 'Kami Seafood Dim Sum 300g offers a delectable assortment of seafood-filled dim sum, which are a staple in Asian cuisine', 'Kami.png')


INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (6, 'CESAR TRAY LAMB DOG FOOD 100G', 4.40, 'Treat your furry friend to the exquisite taste of Cesar Dog Wet Food Adult Lamb in convenient 100g portions', 'Cesar.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (6, 'FELIX ADULT CHICKEN POUCH 85G', 1.80, 'Indulge your feline friend with the delectable taste of Felix Adult Chicken Pouch, available in a convenient 85g pack', 'Felix.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (6, 'FRISKIES PARTY MIX CAT TREAT BEACHSIDE 60G', 6.29, 'Treat your feline friend to a flavor-packed adventure with Friskies Party Mix Cat Treat Beachside 60g', 'Frieskies60g.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (6, 'LOTUSS TUNA WET CAT POUCH 75G', 1.39, 'LOTUSS TUNA WET CAT POUCH 75G is a delectable and nutritious meal specially crafted for your feline companion', 'LotusTuna.png')

INSERT INTO Products (CategoryID,ProductName,ProductPrice,Description,ProductImage) 
VALUES (6, 'WHISKAS JUNIOR MACKEREL CAT DRY FOOD 1.1KG', 13.99, 'Satisfy your growing kittens nutritional needs with Whiskas Junior Mackerel Cat Dry Food', 'Whiskas.png')

