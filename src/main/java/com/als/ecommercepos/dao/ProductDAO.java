/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.dao;

import com.als.ecommercepos.entity.Product;
import java.util.List;

/**
 *
 * @author ayush
 */
public interface ProductDAO {

    List<Product> getAllProducts();

    Product getProductById(String id);

    boolean insertNewProduct(Product product);
}
