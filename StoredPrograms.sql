-- drop database music_store;
-- Query for view -- 
-- creating a view for customersaveragePrice
-- drop view customersAveragePurchase;
CREATE VIEW customersAveragePurchase AS
	SELECT CONCAT(customerFname,' ', customerLname) AS customerName , (orders.shipAmount + orders.taxAmount) AS totalPrice
    FROM customers INNER JOIN orders ON customers.customerId = orders.customers_customerId
    having totalPrice > 100;
SELECT Avg(totalPrice) AS AversgeSale FROM customersAveragePurchase;
SELECT min(totalPrice) AS MinSale FROM customersAveragePurchase;
SELECT max(totalPrice) AS MaxSale FROM customersAveragePurchase;
select * from customersAveragePurchase;

-- Query for Stored Procedure 1 -- 
-- a stored procedure for black friday sale
USE music_store;
-- dropping procedure if exists already
DROP PROCEDURE IF EXISTS music_store_blackFridayDiscount;
DELIMITER //
-- creating procedure
CREATE PROCEDURE music_store_blackFridayDiscount()
BEGIN
	-- declaring variables
	DECLARE blackFridayDiscount INT;
    DECLARE actualPrice DECIMAL(9,2);
    DECLARE finalPriceAfterDiscount DECIMAL(9,2);
    SET blackFridayDiscount = 2;
    SELECT  MAX(itemPrice) INTO actualPrice  FROM order_items;
    SET finalPriceAfterDiscount = (actualPrice - (actualPrice*(70/100)));
    SELECT CONCAT('$', finalPriceAfterDiscount) AS 'BlackFridaySalePrice';
END//
DELIMITER ;
CALL music_store_blackFridayDiscount();



-- Query for Stored Procedure 2 -- 
-- stored procedure for the least quantity in the music_store
USE music_store;
DROP PROCEDURE IF EXISTS music_store_leastQuantity;
DELIMITER //
CREATE PROCEDURE music_store_leastQuantity()
BEGIN
	DECLARE leastQuantityproduct INT;
    SELECT MIN(quantity) INTO leastQuantityproduct FROM order_items;
    SELECT leastQuantityproduct;
END//
DELIMITER ;
CALL music_store_leastQuantity();

-- Query for Stored Procedure 3 -- 
-- stored procedure for calculating the final price after addition of tax

USE music_store;
-- drops stored procedure if there exists any
DROP PROCEDURE IF EXISTS finalAmountAfterTax;
DELIMITER //
-- creation of stored procedure
CREATE PROCEDURE finalAmountAfterTax()
BEGIN
	DECLARE finalPrice INT;
    SELECT SUM(shipAmount + taxAmount) INTO finalPrice FROM orders;
    SELECT CONCAT('$',finalPrice)  as TotalAmount;
END//
DELIMITER ;
CALL finalAmountAfterTax();


-- Query for Stored Procedure 4 -- 
-- stored procedure with transaction for updating existing data in video table
DELIMITER //

CREATE PROCEDURE videoEntryUpdates()

BEGIN

DECLARE sqlError TINYINT DEFAULT FALSE;

DECLARE CONTINUE HANDLER FOR SQLEXCEPTION
    SET sqlError = TRUE;
    
START TRANSACTION;

-- transaction starts here
-- setting values to new values
UPDATE Video SET actorName = "Jhonny Depp" where videoId = 1;
UPDATE Video SET genre = "Title Track" where videoId = 2;


IF sqlError = FALSE THEN 
    COMMIT;
    SELECT("Data Updated");
ELSE
    ROLLBACK;
    SELECT("Three is a error in updating");

END IF;

END//

CALL videoEntryUpdates();
-- select * from video;
