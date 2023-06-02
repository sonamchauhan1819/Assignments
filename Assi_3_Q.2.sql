/*2. a. Write function that takes the customernumber as input and returns the purchase_status based on the following criteria . [table:Payments]

if the total purchase amount for the customer is < 25000 status = Silver, amount between 25000 and 50000, status = Gold
if amount > 50000 Platinum*/
CREATE FUNCTION get_purchase_status (customer_number INT)
RETURNS VARCHAR(10)
BEGIN
    DECLARE total_amount INT;
    SET total_amount = (SELECT SUM(amount) FROM Payments WHERE customerNumber = customer_number);
    
    IF total_amount < 25000 THEN
        RETURN 'Silver';
    ELSEIF total_amount >= 25000 AND total_amount <= 50000 THEN
        RETURN 'Gold';
    ELSE
        RETURN 'Platinum';
    END IF;
END;

b. Write a query that displays customerNumber, customername and purchase_status from customers table.

SELECT customerNumber, customerName, salesRepEmployeeNumber as purchase_status
FROM customers;
select * from assignment.customers;