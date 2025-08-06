--6065629  
--Shreyas P P

--Scenario 1: The bank needs to process monthly interest for all savings accounts.
--Question: Write a stored procedure ProcessMonthlyInterest that calculates and updates the balance of all savings accounts by applying an interest rate of 1% to the current balance.

--Create Table

CREATE TABLE SavingsAccounts (
    AccountID NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

INSERT INTO SavingsAccounts VALUES (101, 'Alice', 10000);
INSERT INTO SavingsAccounts VALUES (102, 'Bob', 5000);
INSERT INTO SavingsAccounts VALUES (103, 'Charlie', 7500);

--procedure applies a 1% interest to the current balance of all rows in the SavingsAccounts table.

CREATE OR REPLACE PROCEDURE ProcessMonthlyInterest IS
BEGIN
    UPDATE SavingsAccounts
    SET Balance = Balance + (Balance * 0.01);
    
    DBMS_OUTPUT.PUT_LINE('Monthly interest applied to all savings accounts.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error applying interest: ' || SQLERRM);
END;
/


--output

BEGIN
    ProcessMonthlyInterest;
END;
/

SELECT * FROM SavingsAccounts;



--Scenario 2: The bank wants to implement a bonus scheme for employees based on their performance.
--Question: Write a stored procedure UpdateEmployeeBonus that updates the salary of employees in a given department by adding a bonus percentage passed as a parameter.

--Create Table

CREATE TABLE Employees (
    EmpID NUMBER PRIMARY KEY,
    Name VARCHAR2(50),
    Department VARCHAR2(50),
    Salary NUMBER(10,2)
);

INSERT INTO Employees VALUES (201, 'John', 'Sales', 30000);
INSERT INTO Employees VALUES (202, 'Emma', 'HR', 28000);
INSERT INTO Employees VALUES (203, 'David', 'Sales', 32000);
INSERT INTO Employees VALUES (204, 'Sophia', 'IT', 35000);

--Accepts the department name and bonus percentage as input parameters. Increases the salary of all employees in that department by the given percentage.

CREATE OR REPLACE PROCEDURE UpdateEmployeeBonus (
    p_department IN VARCHAR2,
    p_bonus_pct IN NUMBER  -- Pass 10 for 10%, 5 for 5%, etc.
) IS
BEGIN
    UPDATE Employees
    SET Salary = Salary + (Salary * p_bonus_pct / 100)
    WHERE Department = p_department;
    
    DBMS_OUTPUT.PUT_LINE('Bonus of ' || p_bonus_pct || '% applied to ' || p_department || ' department.');
EXCEPTION
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Error updating bonus: ' || SQLERRM);
END;
/

--Output

BEGIN
    UpdateEmployeeBonus('Sales', 10);  -- Applies 10% bonus to Sales department
END;
/

SELECT * FROM Employees;



--Scenario 3: Customers should be able to transfer funds between their accounts.
--Question: Write a stored procedure TransferFunds that transfers a specified amount from one account to another, checking that the source account has sufficient balance before making the transfer.

--Create Table

CREATE TABLE Accounts (
    AccountNumber NUMBER PRIMARY KEY,
    CustomerName VARCHAR2(50),
    Balance NUMBER(10,2)
);

INSERT INTO Accounts VALUES (301, 'Alice', 10000);
INSERT INTO Accounts VALUES (302, 'Alice', 5000);    -- Alice has two accounts
INSERT INTO Accounts VALUES (303, 'Bob', 7000);

--Transfer Funds

CREATE OR REPLACE PROCEDURE TransferFunds (
    p_source_acc IN NUMBER,
    p_dest_acc IN NUMBER,
    p_amount IN NUMBER
) IS
    v_balance NUMBER;
BEGIN
    -- Get current balance of source account
    SELECT Balance INTO v_balance
    FROM Accounts
    WHERE AccountNumber = p_source_acc;

    -- Check if sufficient funds
    IF v_balance < p_amount THEN
        DBMS_OUTPUT.PUT_LINE('Transfer failed: Insufficient balance in source account.');
    ELSE
        -- Deduct from source
        UPDATE Accounts
        SET Balance = Balance - p_amount
        WHERE AccountNumber = p_source_acc;

        -- Add to destination
        UPDATE Accounts
        SET Balance = Balance + p_amount
        WHERE AccountNumber = p_dest_acc;

        DBMS_OUTPUT.PUT_LINE('Transfer successful: ₹' || p_amount || ' transferred from Account ' ||
                             p_source_acc || ' to Account ' || p_dest_acc);
    END IF;
    
EXCEPTION
    WHEN NO_DATA_FOUND THEN
        DBMS_OUTPUT.PUT_LINE('Transfer failed: One or both account numbers do not exist.');
    WHEN OTHERS THEN
        DBMS_OUTPUT.PUT_LINE('Transfer failed: ' || SQLERRM);
END;
/

--Output

BEGIN
    TransferFunds(301, 302, 2000);  -- Transfers ₹2000 from Account 301 to 302
END;
/


SELECT * FROM Accounts;
