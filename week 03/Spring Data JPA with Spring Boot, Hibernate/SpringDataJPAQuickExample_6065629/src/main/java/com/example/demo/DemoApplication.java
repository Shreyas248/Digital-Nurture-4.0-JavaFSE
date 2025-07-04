package com.example.demo;

import com.example.demo.entity.Student;
import com.example.demo.repository.StudentRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class DemoApplication implements CommandLineRunner {

    @Autowired
    private StudentRepository studentRepo;

    public static void main(String[] args) {
        SpringApplication.run(DemoApplication.class, args);
    }

    @Override
    public void run(String... args) {
        studentRepo.save(new Student("Kalpana", "kalpana@email.com"));
        studentRepo.save(new Student("Suren", "suren@email.com"));

        studentRepo.findAll().forEach(System.out::println);

        Student student = studentRepo.findByEmail("kalpana@email.com");
        System.out.println("Found by email: " + student);
    }
}
