/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.dao;

import java.util.List;
import com.als.ecommercepos.entity.Customer;

/**
 *
 * @author ayush
 */
public interface CustomerDAO {

    List<Customer> getAllCustomers();

    Customer getCustomerById(String id);

    boolean insertNewCustomer(Customer customer);

}
