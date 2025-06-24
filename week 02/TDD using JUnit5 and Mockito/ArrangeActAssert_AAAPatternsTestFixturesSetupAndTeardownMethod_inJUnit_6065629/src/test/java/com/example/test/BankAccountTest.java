package com.example.test;

import com.example.BankAccount;
import org.junit.jupiter.api.*;

import static org.junit.jupiter.api.Assertions.*;

public class BankAccountTest {

    private BankAccount account;

    @BeforeEach
    public void setUp() {
        System.out.println("Setting up test...");
        account = new BankAccount("John Doe", 1000.0);
    }

    @AfterEach
    public void tearDown() {
        System.out.println("Tearing down test...");
        account = null;
    }

    @Test
    public void testDeposit() {
        account.deposit(500.0);
        assertEquals(1500.0, account.getBalance(), "Balance should be 1500 after deposit");
    }

    @Test
    public void testWithdraw() {
        account.withdraw(300.0);
        assertEquals(700.0, account.getBalance(), "Balance should be 700 after withdrawal");
    }

    @Test
    public void testOverdraftNotAllowed() {
        account.withdraw(2000.0);
        assertEquals(1000.0, account.getBalance(), "Balance should remain unchanged if withdrawal exceeds balance");
    }
}
