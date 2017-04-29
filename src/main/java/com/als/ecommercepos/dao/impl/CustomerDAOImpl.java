/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.dao.impl;

import com.als.ecommercepos.dao.CustomerDAO;
import com.als.ecommercepos.entity.Customer;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

/**
 *
 * @author ayush
 */
@Repository(value = "customerDAOImpl")
public class CustomerDAOImpl implements CustomerDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Customer> getAllCustomers() {
        session = sessionFactory.openSession();
        List<Customer> customerList = session.createQuery("SELECT c FROM Customer c ").list();
        return customerList;
    }

    @Override
    public Customer getCustomerById(String id) {
        session = sessionFactory.openSession();
        return (Customer) session.get(Customer.class, id);
    }

    @Override
    public boolean insertNewCustomer(Customer customer) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Boolean bool;
        try {
            session.save(customer);
            trans.commit();
            session.close();
            bool = Boolean.TRUE;
        } catch (Exception ex) {
            bool = Boolean.FALSE;
            System.out.println("------------------------- " + ex.getMessage());
        }
        return bool;
    }

}
