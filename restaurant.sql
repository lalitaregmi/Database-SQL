create  database restaurantdb;
use restaurantdb;
-- Create table for Customer
CREATE TABLE Customer (
    CustomerID INT PRIMARY KEY,
    FirstName VARCHAR(25) NOT NULL,
    LastName VARCHAR(25) NOT NULL,
    Email VARCHAR(50) UNIQUE NOT NULL
);

-- Create table for Customer Phone Number
CREATE TABLE CustomerPhone (
    PhoneID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    PhoneNumber VARCHAR(10) UNIQUE NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

CREATE TABLE RestaurantLocation (
    LocationID INT PRIMARY KEY,
    LocationName VARCHAR(50) NOT NULL
);

CREATE TABLE Address (
    AddressID INT PRIMARY KEY,
    LocationID INT NOT NULL,
    City VARCHAR(50),
    Street VARCHAR(50),
    ZipCode VARCHAR(10),
    FOREIGN KEY (LocationID) REFERENCES RestaurantLocation(LocationID)
);


-- Create table for Category
CREATE TABLE Category (
    CategoryID INT PRIMARY KEY,
    CategoryName VARCHAR(50) NOT NULL,
    CategoryDescription VARCHAR(100)
);
-- Create table for Menu
CREATE TABLE MenuItem (
    MenuItemID INT PRIMARY KEY,
    ItemName VARCHAR(100) NOT NULL,
    ItemDescription TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    CategoryID INT NOT NULL,
    FOREIGN KEY (CategoryID) REFERENCES Category(CategoryID) 
);
-- Create table for Ingredient
CREATE TABLE Ingredient (
    IngredientID INT PRIMARY KEY,
    IngredientName VARCHAR(50) NOT NULL,
    Unit VARCHAR(20) NOT NULL,
    Cost DECIMAL(10, 2) NOT NULL,
    IngredientCategory VARCHAR(50)
);
-- Create table for Reservation
CREATE TABLE Reservation (
    ReservationID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    LocationID INT NOT NULL,
    ReservationDate DATETIME NOT NULL,
    NumberOfPeople INT NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (LocationID) REFERENCES RestaurantLocation(LocationID)
);


CREATE TABLE PaymentMethod (
    PaymentMethodID INT PRIMARY KEY,
    PaymentType VARCHAR(50) NOT NULL
);
-- Create table for Transaction
CREATE TABLE Transaction (
    TransactionID INT PRIMARY KEY,
    CustomerID INT NOT NULL,
    MenuItemID INT NOT NULL,
    PaymentMethodID INT NOT NULL,
    TransactionDate DATETIME NOT NULL,
    QuantitySold INT NOT NULL,
    TotalPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID),
    FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID),
    FOREIGN KEY (PaymentMethodID) REFERENCES PaymentMethod(PaymentMethodID)
);

-- Create table for IngredientUsage
CREATE TABLE IngredientUsage (
    UsageID INT PRIMARY KEY,
    MenuItemID INT NOT NULL,
    IngredientID INT NOT NULL,
    QuantityUsed DECIMAL(10, 2),
    Unit VARCHAR(20) NOT NULL,
    FOREIGN KEY (MenuItemID) REFERENCES MenuItem(MenuItemID),
    FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);

-- Create table for Inventory
CREATE TABLE Inventory (
    InventoryID INT PRIMARY KEY,
    IngredientID INT NOT NULL,
    QuantityInStock DECIMAL(10, 2),
    UnitOfMeasure VARCHAR(20) NOT NULL,
    RestockDate DATE NOT NULL,
    FOREIGN KEY (IngredientID) REFERENCES Ingredient(IngredientID)
);
-- Create table for Feedback
CREATE TABLE Feedback (
    FeedbackID INT PRIMARY KEY,
    CustomerID INT,
    Rating INT CHECK (Rating BETWEEN 1 AND 5),
    Comments VARCHAR(50),
    FOREIGN KEY (CustomerID) REFERENCES Customer(CustomerID)
);

-- Insert data into Customer
INSERT INTO Customer (CustomerID, FirstName, LastName, Email) VALUES
(100, 'Joe', 'Root', 'joe.root@gmail.com'),
(101, 'Ben', 'Stokes', 'ben.stokes@gmail.com'),
(102, 'Jofra', 'Archer', 'jofra.archer@gmail.com'),
(103, 'Jonny', 'Bairstow', 'jonny.bairstow@gmail.com'),
(104, 'Chris', 'Woakes', 'chris.woakes@gmail.com'),
(105, 'Jos', 'Buttler', 'jos.buttler@gmail.com'),
(106, 'Eoin', 'Morgan', 'eoin.morgan@gmail.com'),
(107, 'Moeen', 'Ali', 'moeen.ali@gmail.com'),
(108, 'Stuart', 'Broad', 'stuart.broad@gmail.com'),
(109, 'James', 'Anderson', 'james.anderson@gmail.com'),
(110, 'Jason', 'Roy', 'jason.roy@gmail.com'),
(111, 'Sam', 'Curran', 'sam.curran@gmail.com'),
(112, 'Tom', 'Curran', 'tom.curran@gmail.com'),
(113, 'Adil', 'Rashid', 'adil.rashid@gmail.com'),
(114, 'Mark', 'Wood', 'mark.wood@gmail.com'),
(115, 'Ollie', 'Pope', 'ollie.pope@gmail.com'),
(116, 'Zak', 'Crawley', 'zak.crawley@gmail.com'),
(117, 'Dom', 'Bess', 'dom.bess@gmail.com'),
(118, 'Jack', 'Leach', 'jack.leach@gmail.com'),
(119, 'Harry', 'Brook', 'harry.brook@gmail.com');


INSERT INTO CustomerPhone (PhoneID, CustomerID, PhoneNumber) VALUES
(1, 100, '4234567890'),
(2, 101, '4634567891'),
(3, 102, '1654567892'),
(4, 103, '1961567893'),
(5, 104, '1226567894'),
(6, 105, '1298767895'),
(7, 106, '1634567896'),
(8, 107, '1222567897'),
(9, 108, '6134567898'),
(10, 109, '6514567899'),
(11, 110, '4678901234'),
(12, 111, '5647382910'),
(13, 112, '9876543210'),
(14, 113, '1239876543'),
(15, 114, '7654321987'),
(16, 115, '3456789123'),
(17, 116, '9871236540'),
(18, 117, '4321098765'),
(19, 118, '6543219870'),
(20, 119, '8765432198');



-- Insert data into RestaurantLocation
INSERT INTO RestaurantLocation (LocationID, LocationName) VALUES
(200, 'Kennington Lane Cafe'),
(201, 'The Ledbury'),
(202, 'Evelyns Table'),
(203, 'City Cafe'),
(204, 'Cafe Parisienne'),
(205, 'The Ivy'),
(206, 'Dishoom Shoreditch'),
(207, 'Sketch Gallery'),
(208, 'Duck and Waffle'),
(209, 'Hawksmoor Guildhall'),
(210, 'Clos Maggiore'),
(211, 'Pollen Street Social'),
(212, 'Barrafina'),
(213, 'Hakkasan Mayfair'),
(214, 'Lyle’s'),
(215, 'Gymkhana'),
(216, 'The Palomar'),
(217, 'Core by Clare Smyth'),
(218, 'Berners Tavern'),
(219, 'Savoy Grill');



INSERT INTO Address (AddressID, LocationID, City, Street, ZipCode) VALUES
(1, 200, 'London', 'Church Street', 'NW16XE'),
(2, 201, 'Brighton', 'Victoria Road', 'BN25AA'),
(3, 202, 'Bristol', 'Manor Road', 'BS16XX'),
(4, 203, 'Manchester', 'Oxford Road', 'M13AA'),
(5, 204, 'Liverpool', 'Albert Dock', 'L12AD'),
(6, 205, 'London', 'Covent Garden', 'WC2E8HN'),
(7, 206, 'London', 'Boundary Street', 'E16PQ'),
(8, 207, 'London', 'Conduit Street', 'W1S2YF'),
(9, 208, 'London', 'Bishopsgate', 'EC2N4AY'),
(10, 209, 'London', 'Guildhall', 'EC2V7HH'),
(11, 210, 'London', 'Covent Garden', 'WC2E9DP'),
(12, 211, 'London', 'Pollen Street', 'W1S1NJ'),
(13, 212, 'London', 'Dean Street', 'W1D3RY'),
(14, 213, 'London', 'Bruton Street', 'W1J6QG'),
(15, 214, 'London', 'Shoreditch High Street', 'E16GQ'),
(16, 215, 'London', 'Albemarle Street', 'W1S4JU'),
(17, 216, 'London', 'Rupert Street', 'W1D7PF'),
(18, 217, 'London', 'Kensington Park Road', 'W11TH'),
(19, 218, 'London', 'Berners Street', 'W1T3LF'),
(20, 219, 'London', 'Savoy Place', 'WC2R0EU');


-- Insert data into Category
INSERT INTO Category (CategoryID, CategoryName, CategoryDescription) VALUES
(300, 'Appetizers', 'Small, flavorful foods'),
(301, 'Main Courses', 'Protein source, such as meat, fish, or plant-based'),
(302, 'Desserts', 'Sweeter course to end a meal'),
(303, 'Beverages', 'Hot and cold drinks'),
(304, 'Salads', 'Mixed ingredients, frequently vegetables'),
(305, 'Sandwiches', 'Bread-based dishes with filling'),
(306, 'Soups', 'Warm and comforting liquid food'),
(307, 'Seafood', 'Fish, shellfish, and other sea products'),
(308, 'Grill', 'Grilled meats and vegetables'),
(309, 'Vegetarian', 'Plant-based dishes'),
(310, 'Breakfast', 'Morning meals'),
(311, 'Snacks', 'Quick bites to eat'),
(312, 'Barbecue', 'Charcoal-grilled food'),
(313, 'Pizza', 'Flatbread topped with various ingredients'),
(314, 'Pasta', 'Italian noodle-based dishes'),
(315, 'Burgers', 'Bread buns with filling'),
(316, 'Asian Cuisine', 'Asian-style dishes'),
(317, 'Mexican Cuisine', 'Tacos, burritos, and more'),
(318, 'Indian Cuisine', 'Traditional Indian dishes'),
(319, 'Italian Cuisine', 'Italian specialties');


-- Insert data into Menu
INSERT INTO MenuItem (MenuItemID, ItemName, ItemDescription, Price, CategoryID) VALUES
(400, 'Cheesy Nachos', 'Crispy tortilla chips topped with melted cheese', 18.99, 300),
(401, 'Caesar Salad', 'Romaine lettuce with Caesar dressing and croutons', 26.99, 304),
(402, 'Grilled Chicken Sandwich', 'Served with lettuce, tomato, and mayo', 25.99, 305),
(403, 'Tomato Soup', 'Creamy tomato soup served with croutons', 20.99, 306),
(404, 'Fish and Chips', 'Crispy battered fish with golden fries', 32.99, 307),
(405, 'Beef Burger', 'Juicy beef patty with cheese and pickles', 40.99, 308),
(406, 'Vegetarian Pizza', 'Topped with fresh vegetables and mozzarella', 24.99, 309),
(407, 'Chocolate Cake', 'Rich chocolate cake with fudge frosting', 15.49, 302),
(408, 'Espresso', 'Strong and bold coffee shot', 10.99, 303),
(409, 'Grilled Salmon', 'Seasoned and grilled to perfection', 18.99, 308),
(410, 'Pasta Alfredo', 'Creamy pasta with Alfredo sauce', 19.99, 314),
(411, 'Pepperoni Pizza', 'Pizza topped with pepperoni and cheese', 22.99, 313),
(412, 'BBQ Ribs', 'Tender ribs with BBQ sauce', 35.99, 312),
(413, 'Vegetable Stir-fry', 'Mixed vegetables stir-fried in soy sauce', 16.99, 309),
(414, 'Chicken Tikka Masala', 'Indian curry with chicken and spices', 25.99, 318),
(415, 'Tacos', 'Soft-shell tacos with fillings of your choice', 18.99, 317),
(416, 'Pad Thai', 'Thai-style stir-fried noodles', 20.99, 316),
(417, 'Classic Cheeseburger', 'Beef burger with melted cheese', 24.99, 315),
(418, 'Margherita Pizza', 'Pizza with fresh basil and mozzarella', 21.99, 313),
(419, 'Minestrone Soup', 'Italian vegetable soup', 14.99, 306),
(420, 'Chicken Caesar Wrap', 'Caesar salad in a wrap', 15.99, 305),
(421, 'Spinach Salad', 'Salad with spinach, nuts, and vinaigrette', 14.99, 304),
(422, 'Lobster Bisque', 'Rich and creamy lobster soup', 29.99, 307),
(423, 'Grilled Veggie Skewers', 'Skewered and grilled vegetables', 17.99, 309),
(424, 'Churros', 'Deep-fried dough pastries with sugar', 12.99, 302);


-- Insert data into Ingredient
INSERT INTO Ingredient (IngredientID, IngredientName, Unit, Cost, IngredientCategory) VALUES
(500, 'Tomato', 'Kilogram', 12.55, 'Vegetables'),
(501, 'Cheese', 'Kilogram', 17.00, 'Dairy'),
(502, 'Lettuce', 'Piece', 0.87, 'Vegetables'),
(503, 'Chicken Breast', 'Kilogram', 15.85, 'Meat'),
(504, 'Beef Patty', 'Piece', 13.16, 'Meat'),
(505, 'Salmon', 'Kilogram', 28.75, 'Seafood'),
(506, 'Mozzarella', 'Kilogram', 15.15, 'Dairy'),
(507, 'Coffee Beans', 'Kilogram', 29.17, 'Beverage'),
(508, 'Flour', 'Kilogram', 15.45, 'Baking'),
(509, 'Chocolate', 'Kilogram', 17.30, 'Dessert'),
(510, 'Pepperoni', 'Kilogram', 20.50, 'Meat'),
(511, 'Alfredo Sauce', 'Liters', 12.00, 'Sauce'),
(512, 'Ribs', 'Kilogram', 35.00, 'Meat'),
(513, 'Vegetables', 'Kilogram', 10.00, 'Vegetables'),
(514, 'Tortillas', 'Piece', 0.75, 'Bread'),
(515, 'Rice Noodles', 'Kilogram', 18.50, 'Grains'),
(516, 'Basil', 'Kilogram', 25.00, 'Herbs'),
(517, 'Lobster', 'Kilogram', 50.00, 'Seafood'),
(518, 'Vinaigrette', 'Liters', 15.00, 'Sauce'),
(519, 'Spinach', 'Kilogram', 12.00, 'Vegetables'),
(520, 'Sugar', 'Kilogram', 5.00, 'Dessert'),
(521, 'Butter', 'Kilogram', 8.00, 'Dairy'),
(522, 'Soy Sauce', 'Liters', 9.50, 'Condiments'),
(523, 'Flour Tortilla', 'Piece', 0.90, 'Bread'),
(524, 'Tomato Sauce', 'Liters', 8.50, 'Sauce');


-- Insert data into Reservation
INSERT INTO Reservation (ReservationID, CustomerID, LocationID, ReservationDate, NumberOfPeople) VALUES
(600, 100, 200, '2025-01-01 18:30:00', 2),
(601, 101, 201, '2025-01-02 19:00:00', 4),
(602, 102, 202, '2025-01-03 20:00:00', 3),
(603, 103, 203, '2025-01-04 18:00:00', 5),
(604, 104, 204, '2025-01-05 19:30:00', 6),
(605, 105, 205, '2025-01-06 20:30:00', 4),
(606, 106, 206, '2025-01-07 18:15:00', 2),
(607, 107, 207, '2025-01-08 19:45:00', 8),
(608, 108, 208, '2025-01-09 20:30:00', 3),
(609, 109, 209, '2025-01-10 18:00:00', 7),
(610, 110, 210, '2025-01-11 19:00:00', 2),
(611, 111, 211, '2025-01-12 20:15:00', 6),
(612, 112, 212, '2025-01-13 18:45:00', 5),
(613, 113, 213, '2025-01-14 19:30:00', 3),
(614, 114, 214, '2025-01-15 20:00:00', 4),
(615, 115, 215, '2025-01-16 18:30:00', 8),
(616, 116, 216, '2025-01-17 19:00:00', 6),
(617, 117, 217, '2025-01-18 20:15:00', 7),
(618, 118, 218, '2025-01-19 18:45:00', 2),
(619, 119, 219, '2025-01-20 19:30:00', 4);


-- Insert data into PaymentMethod
INSERT INTO PaymentMethod (PaymentMethodID, PaymentType) VALUES
(700, 'Cash'),
(701, 'Credit Card'),
(702, 'Debit Card'),
(703, 'Mobile Payment'),
(704, 'Gift Card'),
(705, 'Online Banking');

INSERT INTO Transaction (TransactionID, CustomerID, MenuItemID, PaymentMethodID, TransactionDate, QuantitySold, TotalPrice)
VALUES
(800, 100, 401, 701, '2024-05-21 19:58:00', 2, 150.00),
(801, 101, 402, 702, '2024-06-22 19:30:00', 4, 120.00),
(802, 102, 403, 701, '2024-12-23 20:30:00', 3, 190.00),
(803, 103, 403, 703, '2024-12-24 18:38:00', 2, 260.00),
(804, 104, 405, 705, '2024-12-25 20:45:00', 5, 250.00),
(805, 105, 406, 704, '2024-12-02 21:25:00', 3, 145.00),
(806, 106, 405, 702, '2024-12-10 19:40:00', 6, 188.00),
(807, 107, 406, 703, '2024-12-17 20:30:00', 4, 149.00),
(808, 108, 409, 701, '2025-01-16 22:00:00', 2, 78.00),
(809, 109, 400, 704, '2025-01-18 19:30:00', 3, 126.00),
(810, 110, 401, 701, '2025-01-06 14:10:00', 15, 404.85), 
(811, 111, 402, 702, '2025-01-06 15:40:00', 10, 259.90), 
(812, 112, 405, 705, '2025-01-07 17:00:00', 5, 204.95),  
(813, 113, 406, 704, '2025-01-07 18:10:00', 8, 199.92), 
(814, 114, 409, 703, '2025-01-08 19:25:00', 12, 227.88), 
(815, 115, 407, 701, '2025-01-08 20:00:00', 20, 309.80), 
(816, 116, 404, 702, '2025-01-09 12:50:00', 10, 329.90), 
(817, 117, 408, 704, '2025-01-09 14:25:00', 5, 54.95),   
(818, 118, 400, 705, '2025-01-10 15:15:00', 30, 569.70), 
(819, 119, 403, 701, '2025-01-10 16:40:00', 25, 524.75); 
INSERT INTO Transaction (TransactionID, CustomerID, MenuItemID, PaymentMethodID, TransactionDate, QuantitySold, TotalPrice)
VALUES
(820, 101, 417, 701, '2024-12-21 19:58:00', 2, 150.00),
(821, 102, 418, 701, '2024-12-21 19:58:00', 2, 150.00),
(822, 103, 416, 701, '2024-12-21 19:58:00', 2, 150.00),
(823, 102, 418, 701, '2024-12-21 19:58:00', 2, 150.00);
-- Insert data into IngredientUsage
INSERT INTO IngredientUsage (UsageID, MenuItemID, IngredientID, QuantityUsed, Unit) VALUES
(900, 400, 500, 0.35, 'Kilogram'),
(901, 401, 502, 0.25, 'Piece'),
(902, 402, 503, 0.55, 'Kilogram'),
(903, 403, 500, 0.25, 'Kilogram'),
(904, 404, 504, 1.00, 'Piece'),
(905, 405, 504, 1.05, 'Piece'),
(906, 406, 506, 0.35, 'Kilogram'),
(907, 407, 509, 0.15, 'Kilogram'),
(908, 408, 507, 0.25, 'Kilogram'),
(909, 409, 505, 0.27, 'Kilogram');

-- Data population for Inventory
INSERT INTO Inventory (InventoryID, IngredientID, QuantityInStock, UnitOfMeasure, RestockDate) VALUES
(1000, 500, 150.00, 'kg', '2025-01-11'),
(1001, 501, 300.00, 'liters', '2025-01-15'),
(1002, 502, 150.00, 'kg', '2025-01-13'),
(1003, 503, 85.50, 'kg', '2025-01-24'),
(1004, 504, 250.00, 'grams', '2025-01-27'),
(1005, 505, 15.00, 'liters', '2025-01-19'),
(1006, 506, 25.00, 'liters', '2025-01-23'),
(1007, 507, 30.00, 'kg', '2025-01-31'),
(1008, 508, 18.00, 'liters', '2025-02-03'),
(1009, 509, 10.00, 'liters', '2025-02-07'),
(1010, 510, 20.00, 'kg', '2025-01-15'),
(1011, 511, 50.00, 'liters', '2025-01-18'),
(1012, 512, 30.00, 'kg', '2025-01-20'),
(1013, 513, 60.00, 'kg', '2025-01-25'),
(1014, 514, 200.00, 'pieces', '2025-01-22'),
(1015, 515, 45.00, 'kg', '2025-01-24'),
(1016, 516, 10.00, 'kg', '2025-01-23'),
(1017, 517, 8.00, 'kg', '2025-01-30'),
(1018, 518, 25.00, 'liters', '2025-01-31'),
(1019, 519, 35.00, 'kg', '2025-02-01'),
(1020, 520, 100.00, 'kg', '2025-01-15'),
(1021, 521, 60.00, 'kg', '2025-01-19'),
(1022, 522, 40.00, 'liters', '2025-01-25'),
(1023, 523, 150.00, 'pieces', '2025-01-28'),
(1024, 524, 80.00, 'liters', '2025-02-03');


-- Data population for Feedback
INSERT INTO Feedback (FeedbackID, CustomerID, Rating, Comments) VALUES
(1100, 100, 5, 'Excellent service!'),
(1101, 101, 4, 'Great food!'),
(1102, 102, 3, 'Average experience'),
(1103, 103, 5, 'Loved it!'),
(1104, 104, 2, 'Could be better'),
(1105, 105, 4, 'Nice ambiance'),
(1106, 106, 5, 'Highly recommend!'),
(1107, 107, 1, 'Poor service'),
(1108, 108, 3, 'Okayish'),
(1109, 109, 4, 'Good experience overall');

-- Query 1
SELECT c.CategoryName, SUM(t.TotalPrice) AS TotalSales
FROM Transaction t
INNER JOIN MenuItem m ON t.MenuItemID = m.MenuItemID
INNER JOIN Category c ON m.CategoryID = c.CategoryID
WHERE t.TransactionDate BETWEEN '2025-01-01' AND '2025-01-31'
GROUP BY c.CategoryName
ORDER BY TotalSales DESC;

-- Query 2
SELECT 
    mi.ItemName, 
    c.CategoryName, 
    SUM(t.QuantitySold) AS TotalSales
FROM Transaction t
JOIN MenuItem mi ON t.MenuItemID = mi.MenuItemID
JOIN Category c ON mi.CategoryID = c.CategoryID
WHERE t.TransactionDate BETWEEN '2024-11-01' AND '2025-01-10'
GROUP BY mi.ItemName, c.CategoryName
ORDER BY TotalSales DESC
LIMIT 10;

-- Query 3
SELECT 
    c.FirstName,
    c.LastName,
    cp.PhoneNumber,
    COUNT(r.ReservationID) AS NumberOfReservations
FROM 
    Reservation r
JOIN 
    Customer c ON r.CustomerID = c.CustomerID
JOIN 
    CustomerPhone cp ON c.CustomerID = cp.CustomerID
WHERE 
    r.ReservationDate >= DATE_ADD(CURDATE(), INTERVAL -1 MONTH)
GROUP BY 
    c.CustomerID, c.FirstName, c.LastName, cp.PhoneNumber
ORDER BY 
    NumberOfReservations DESC;


-- Query 4
SELECT i.IngredientName,i.IngredientCategory,inv.QuantityInStock,inv.UnitOfMeasure
FROM Inventory inv
INNER JOIN Ingredient i ON inv.IngredientID = i.IngredientID
ORDER BY i.IngredientName asc;



-- Query 5
SELECT 
    rl.LocationName,
    SUM(t.TotalPrice) AS TotalRevenue
FROM 
    Transaction t
JOIN 
    Reservation r ON t.CustomerID = r.CustomerID
JOIN 
    RestaurantLocation rl ON r.LocationID = rl.LocationID
WHERE 
    t.TransactionDate >= DATE_ADD(CURDATE(), INTERVAL -1 YEAR)
GROUP BY 
    rl.LocationID, rl.LocationName
ORDER BY 
    TotalRevenue DESC;


-- daily revenue reports
SELECT DATE(TransactionDate) AS TransactionDay, SUM(TotalPrice) AS TotalRevenue
FROM Transaction
WHERE TransactionDate BETWEEN '2025-01-01' AND '2025-01-31' 
GROUP BY DATE(TransactionDate)
ORDER BY TransactionDay;

-- intemised sales reports by category
SELECT c.CategoryName, m.ItemName, SUM(t.QuantitySold) AS TotalUnitsSold, SUM(t.TotalPrice) AS TotalRevenue
FROM Transaction t
INNER JOIN MenuItem m ON t.MenuItemID = m.MenuItemID
INNER JOIN Category c ON m.CategoryID = c.CategoryID
WHERE TransactionDate BETWEEN '2025-01-01' AND '2025-01-31' 
GROUP BY c.CategoryName, m.ItemName
ORDER BY TotalRevenue DESC;

-- inventory report
SELECT i.IngredientName, i.IngredientCategory, inv.QuantityInStock, inv.UnitOfMeasure, inv.RestockDate
FROM Inventory inv
INNER JOIN Ingredient i ON inv.IngredientID = i.IngredientID
ORDER BY inv.RestockDate asc;



