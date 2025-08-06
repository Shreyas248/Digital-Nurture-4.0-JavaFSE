package com.library.main;

import com.library.service.BookService;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class MainApp {
    public static void main(String[] args) {
        ApplicationContext context =
                new ClassPathXmlApplicationContext("applicationContext.xml");

        System.out.println("Spring context loaded successfully!");

        BookService bookService = (BookService) context.getBean("bookService");
        bookService.addBook("Domain-Driven Design");
    }
}
