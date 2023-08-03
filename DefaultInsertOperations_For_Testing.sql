USE littlelemondb;

START TRANSACTION;
INSERT INTO staffinformation (Name, Role, Email, AnnualSalary)
VALUES
('Mario Gollini','Manager','Mario.g@littlelemon.com','$70,000'),
('Adrian Gollini','Assistant Manager','Adrian.g@littlelemon.com','$65,000'),
('Giorgos Dioudis','Head Chef','Giorgos.d@littlelemon.com','$50,000'),
('Fatma Kaya','Assistant Chef','Fatma.k@littlelemon.com','$45,000'),
('Elena Salvai','Head Waiter','Elena.s@littlelemon.com','$40,000'),
('John Millar','Receptionist','John.m@littlelemon.com','$35,000');
COMMIT;

START TRANSACTION;
INSERT INTO customers (FirstName, LastName, Email, ContactNumber)
VALUES
('Thompson','Bassey','thompsong@littlelemon.com','351258074'),
('Bakes','James','Adrian.g@littlelemon.com','351258074'),
('Destiny','Young', 'Giorgos.d@littlelemon.com','351258074'),
('Joung','Peter','Fatma.k@littlelemon.com','351258074'),
('Parker','Chris','Elena.s@littlelemon.com','351258074'),
('Doniel','James','John.m@littlelemon.com','351258074');
COMMIT;

START TRANSACTION;
INSERT INTO bookings(BookingDate, BookingSlot, TableNo, CustomerID, StaffID)
VALUES
('2022-10-10', '17:30', 5, 1, 1),
('2022-10-12', '18:00', 3, 3, 2),
('2022-10-11', '17:30', 2, 2, 3),
('2022-10-13', '17:30', 2, 1, 2);
COMMIT;

START TRANSACTION;
INSERT INTO menuitems(CourseName, StarterName, DessertName)
VALUES
('Greek salad', 'Olives', 'Ice Cream'),
('Bean soup', 'Flatbread', 'Greek Yoghurt'),
('Pizza', 'Minestrone', 'Cheese Cake'),
('Kabasa', 'TomatoBrea', 'Greek Yoghurt');
COMMIT;

START TRANSACTION;
INSERT INTO menus(MenuName, Cuisine, MenuItemID)
VALUES
('Mousoka', 'Olives', 1),
('Manti', 'Flatbread', 4),
('Some Menu', 'Minestrone', 2),
('Another Menu', 'TomatoBrea', 3);
COMMIT;

START TRANSACTION;
INSERT INTO orders (OrderDate, MenuID, CustomerID, Quantity, TotalCost)
VALUES
('2022-10-10',1, 1, 5, 250.00),
('2022-10-11',2, 2, 3, 300.00),
('2022-10-11',2, 3, 1, 100.00),
('2022-10-13',3, 4, 2, 150.00),
('2022-10-12',1, 1, 10, 500.00);
COMMIT;