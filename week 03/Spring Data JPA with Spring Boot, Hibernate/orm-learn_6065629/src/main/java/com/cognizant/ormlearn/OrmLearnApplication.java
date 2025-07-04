package com.cognizant.ormlearn;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.ApplicationContext;

import com.cognizant.ormlearn.service.CountryService;

@SpringBootApplication
public class OrmLearnApplication {

    public static void main(String[] args) {
        ApplicationContext context = SpringApplication.run(OrmLearnApplication.class, args);
        CountryService countryService = context.getBean(CountryService.class);
        testGetAllCountries(countryService);
    }

    private static void testGetAllCountries(CountryService countryService) {
        System.out.println("Start");
        System.out.println(countryService.getAllCountries());
        System.out.println("End");
    }
}
