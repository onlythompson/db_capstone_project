-- This file creates all the stored procedures for the project
USE littlelemondb;
-- Task 1
DROP PROCEDURE IF EXISTS MaxQuantity;
DELIMITER //
CREATE PROCEDURE MaxQuantity()
BEGIN
SELECT MAX(Quantity) AS "Max Quantity in Order"
FROM orders;
END//
DELIMITER ;

-- Task 2
PREPARE GetOrderDetail FROM
'SELECT OrderID, Quantity, TotalCost AS Cost
FROM Orders WHERE OrderID = ?';


-- Task 3
DROP PROCEDURE IF EXISTS CancelOrder;
DELIMITER //
CREATE PROCEDURE CancelOrder(order_id INT)
BEGIN
DELETE
FROM orders
WHERE OrderID = order_id;

SELECT CONCAT('Order ', order_id, ' is cancelled') AS Confirmation;
END//
DELIMITER ;


-- Week 2 Exercise Task 2
DROP PROCEDURE IF EXISTS CheckBooking;
DELIMITER //
CREATE PROCEDURE CheckBooking(IN booked_date DATE, IN table_no INT)
BEGIN
SELECT
CASE 
WHEN BookingID THEN  CONCAT('Table ',TableNo, ' is already booked')
ELSE CONCAT("Table is Avaliable for Booking on : ", booked_date)
END AS 'Booking Status'
FROM bookings 
WHERE BookingDate = booked_date AND TableNo = table_no;
END//
DELIMITER ;

-- Week 2 Exercise Task 3
DROP PROCEDURE IF EXISTS AddValidBooking_ManageBooking;

DELIMITER //
CREATE PROCEDURE AddValidBooking_ManageBooking(IN booking_date DATE, IN table_no INT)
BEGIN
DECLARE exist_booking_date DATE;
SELECT BookingDate INTO exist_booking_date FROM bookings WHERE BookingDate = booking_date AND TableNo = table_no LIMIT 1;
-- START TRANSACTION
INSERT INTO bookings(BookingDate, BookingSlot, TableNo, CustomerID, StaffID)
VALUES (booking_date, '19:30', table_no, 1, 1);
IF exist_booking_date = booking_date THEN
ROLLBACK;
SELECT CONCAT('Table ',table_no,' is already booked - booking cancelled') AS 'Booking Status';
ELSE
COMMIT;
SELECT CONCAT('Table ',table_no,' is booked - booking successful') AS 'Booking Status';
END IF;
END//
DELIMITER ;


-- Week 2 - Exercise: Create SQL queries to add and update bookings
-- Task 1
DROP PROCEDURE IF EXISTS AddBooking;
DELIMITER //
CREATE PROCEDURE AddBooking(customer_id INT, booking_date DATE, booking_time TIME, table_no INT)
BEGIN
INSERT INTO bookings(BookingDate, BookingSlot, TableNo, CustomerID, StaffID)
VALUES
(booking_date, booking_time, table_no, customer_id, 1);

SELECT CONCAT('New Booking Added') AS Confirmation;
END//
DELIMITER ;

-- Task 2
DROP PROCEDURE IF EXISTS UpdateBooking;
DELIMITER //
CREATE PROCEDURE UpdateBooking(booking_id INT, booking_date DATE)
BEGIN
UPDATE bookings
SET BookingDate = booking_date
WHERE BookingID = booking_id;
SELECT CONCAT('Booking ', booking_id, ' Added') AS Confirmation;
END//
DELIMITER ;

-- Task 3
DROP PROCEDURE IF EXISTS CancelBooking;
DELIMITER //
CREATE PROCEDURE CancelBooking(booking_id INT)
BEGIN
DELETE
FROM bookings
WHERE BookingID = booking_id;

SELECT CONCAT('Booking', booking_id, ' Cancelled') AS Confirmation;
END//
DELIMITER ;