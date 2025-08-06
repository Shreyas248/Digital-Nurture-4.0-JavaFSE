package com.example;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.hibernate.cfg.Configuration;

public class HibernateDemo {
    public static void main(String[] args) {
        try (SessionFactory factory = new Configuration().configure().buildSessionFactory();
             Session session = factory.openSession()) {

            Transaction tx = session.beginTransaction();

            Employee emp = new Employee();
            emp.setName("John Doe");

            session.save(emp);

            tx.commit();

            System.out.println("Employee saved with ID: " + emp.getId());
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}
