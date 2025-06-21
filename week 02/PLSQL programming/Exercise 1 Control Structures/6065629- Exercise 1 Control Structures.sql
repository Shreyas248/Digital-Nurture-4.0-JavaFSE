--6065629
--Shreyas PP

--Scenario 1: The bank wants to apply a discount to loan interest rates for customers above 60 years old.
--Question: Write a PL/SQL block that loops through all customers, checks their age, and if they are above 60, apply a 1% discount to their current loan interest rates.

--Create the Tables

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    name            VARCHAR2(100),
    age             NUMBER,
    balance         NUMBER(10,2),
    is_vip          CHAR(1) DEFAULT 'N' 
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    interest_rate   NUMBER(5,2),
    due_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Insert Sample Data

-- Insert into customers
INSERT INTO customers VALUES (1, 'John Doe',     65, 12000.00, 'VIP');  
INSERT INTO customers VALUES (2, 'Jane Smith',   45, 9500.00,  'NO'); 
INSERT INTO customers VALUES (3, 'Alice Johnson',70, 10500.00, 'VIP'); 
INSERT INTO customers VALUES (4, 'Bob Brown',    30, 11000.00, 'VIP'); 
INSERT INTO customers VALUES (5, 'Charlie Black',61, 5000.00,  'NO'); 

-- Insert into loans
INSERT INTO loans VALUES (101, 1, 8.5, SYSDATE + 10);
INSERT INTO loans VALUES (102, 2, 9.0, SYSDATE + 40);
INSERT INTO loans VALUES (103, 3, 7.5, SYSDATE + 25);
INSERT INTO loans VALUES (104, 4, 8.0, SYSDATE + 90); 
INSERT INTO loans VALUES (105, 5, 9.5, SYSDATE + 5); 


--Apply 1% Discount for Age > 60

BEGIN
    FOR cust_rec IN (
        SELECT c.customer_id, l.loan_id, l.interest_rate
        FROM customers c
        JOIN loans l ON c.customer_id = l.customer_id
        WHERE c.age > 60
    )
    LOOP
        UPDATE loans
        SET interest_rate = cust_rec.interest_rate - (cust_rec.interest_rate * 0.01)
        WHERE loan_id = cust_rec.loan_id;

    END LOOP;

    COMMIT;
END;

--OUTPUT

SELECT c.customer_id, c.name, c.age, l.loan_id, l.interest_rate
FROM customers c
JOIN loans l ON c.customer_id = l.customer_id
WHERE c.age > 60;

--Scenario 2: A customer can be promoted to VIP status based on their balance.
--Question: Write a PL/SQL block that iterates through all customers and sets a flag IsVIP to TRUE for those with a balance over $10,000.


--Create the Tables

CREATE TABLE customers (
    customer_id     NUMBER PRIMARY KEY,
    name            VARCHAR2(100),
    age             NUMBER,
    balance         NUMBER(10,2),
    is_vip          CHAR(1) DEFAULT 'N' 
);

CREATE TABLE loans (
    loan_id         NUMBER PRIMARY KEY,
    customer_id     NUMBER,
    interest_rate   NUMBER(5,2),
    due_date        DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id)
);

--Insert Sample Data

-- Insert into customers
INSERT INTO customers VALUES (1, 'John Doe',     65, 12000.00, 'N');  
INSERT INTO customers VALUES (2, 'Jane Smith',   45, 9500.00,  'N'); 
INSERT INTO customers VALUES (3, 'Alice Johnson',70, 10500.00, 'N'); 
INSERT INTO customers VALUES (4, 'Bob Brown',    30, 11000.00, 'N'); 
INSERT INTO customers VALUES (5, 'Charlie Black',61, 5000.00,  'N'); 

-- Insert into loans
INSERT INTO loans VALUES (101, 1, 8.5, SYSDATE + 10);
INSERT INTO loans VALUES (102, 2, 9.0, SYSDATE + 40);
INSERT INTO loans VALUES (103, 3, 7.5, SYSDATE + 25);
INSERT INTO loans VALUES (104, 4, 8.0, SYSDATE + 90); 
INSERT INTO loans VALUES (105, 5, 9.5, SYSDATE + 5); 

-- Promote customers to VIP status if their balance is over $10,000.

BEGIN
    FOR cust_rec IN (
        SELECT customer_id, balance
        FROM customers
        WHERE balance > 10000
    )
    LOOP
        UPDATE customers
        SET is_vip = 'Y'
        WHERE customer_id = cust_rec.customer_id;

        DBMS_OUTPUT.PUT_LINE('Customer ID ' || cust_rec.customer_id || 
                             ' promoted to VIP (Balance: ' || cust_rec.balance || ')');
    END LOOP;

    COMMIT;
END;

--OUTPUT

SELECT customer_id, name, balance, is_vip
FROM customers
WHERE is_vip = 'Y';


--Scenario 3: Ensure data integrity when adding a new customer.
--Question: Write a stored procedure AddNewCustomer that inserts a new customer into the Customers table. If a customer with the same ID already exists, handle the exception by logging an error and preventing the insertion.

CREATE OR REPLACE PROCEDURE AddNewCustomer (
    p_customer_id   IN NUMBER,
    p_name          IN VARCHAR2,
    p_age           IN NUMBER,
    p_balance       IN NUMBER
) AS
BEGIN
    INSERT INTO customers (customer_id, name, age, balance)
    VALUES (p_customer_id, p_name, p_age, p_balance);

    DBMS_OUTPUT.PUT_LINE('Customer ID ' || p_customer_id || ' added successfully.');

EXCEPTION
    WHEN DUP_VAL_ON_INDEX THEN
        DBMS_OUTPUT.PUT_LINE('ERROR: Customer ID ' || p_customer_id || ' already exists. Insertion aborted.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Unexpected Error: ' || SQLERRM);
END;

--ADDING NEW USER

BEGIN
    AddNewCustomer(7, 'Shiva', 60, 8000);
    AddNewCustomer(7, 'Shiva', 60, 8000);
END;


