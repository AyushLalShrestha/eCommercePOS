/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.dao.impl;

import com.als.ecommercepos.dao.ProductDAO;
import com.als.ecommercepos.entity.Product;
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
@Repository(value = "productDAOImpl")
public class ProductDAOImpl implements ProductDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Product> getAllProducts() {
        session = sessionFactory.openSession();
        List<Product> productList = session.createQuery("SELECT p FROM Product p ").list();
        return productList;
    }

    @Override
    public Product getProductById(String id) {
        session = sessionFactory.openSession();
        Product product;
        try {
            product = (Product) session.get(Product.class, id);
        } catch (Exception ex) {
            System.out.println("Get Product by Id Error -- - - - - - " + ex.getMessage());
            product = null;
        }
        return product;
    }

    @Override
    public boolean insertNewProduct(Product product) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Boolean bool;
        try {
            session.save(product);
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
