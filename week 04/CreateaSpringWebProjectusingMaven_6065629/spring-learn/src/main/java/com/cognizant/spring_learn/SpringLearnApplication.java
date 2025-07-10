package com.cognizant.spring_learn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;

@SpringBootApplication
public class SpringLearnApplication {

    public static void main(String[] args) {
        System.out.println("Start of main() in SpringLearnApplication");
        SpringApplication.run(SpringLearnApplication.class, args);
        System.out.println("End of main() in SpringLearnApplication");
    }
}
