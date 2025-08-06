package com.example.springdatajpademo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringDataJpaDemoApplication implements CommandLineRunner {

    @Autowired
    private EmployeeRepository employeeRepository;

    public static void main(String[] args) {
        SpringApplication.run(SpringDataJpaDemoApplication.class, args);
    }

    @Override
    public void run(String... args) throws Exception {
        Employee emp = new Employee();
        emp.setName("John Doe");
        employeeRepository.save(emp);

        System.out.println("Employee saved with ID: " + emp.getId());
    }
}
