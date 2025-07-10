package com.cognizant.spring_learn;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

public class SpringLearnApplication {

    public static void main(String[] args) throws ParseException {
        displayDate();
    }

    public static void displayDate() throws ParseException {
        ApplicationContext context =
                new ClassPathXmlApplicationContext("date-format.xml");

        SimpleDateFormat format =
                context.getBean("dateFormat", SimpleDateFormat.class);

        String dateStr = "31/12/2018";
        Date date = format.parse(dateStr);

        System.out.println("Parsed Date = " + date);
    }
}
