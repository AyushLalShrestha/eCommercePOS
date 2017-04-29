/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.controller;

import com.als.ecommercepos.dao.ProductDAO;
import com.als.ecommercepos.entity.Product;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
@RequestMapping(value = "/product")
public class ProductController {
    
     @Autowired
    private ProductDAO productDAO;
    
     @RequestMapping(method = RequestMethod.GET)
    public String productIndex(Model model) {
        model.addAttribute("productList", productDAO.getAllProducts());
        return "productindex";
    }

    @RequestMapping(value = "/newproduct", method = RequestMethod.POST)
    public String addNewProduct(@ModelAttribute("product") Product product, Model model) {
        if(productDAO.insertNewProduct(product)){
             return productIndex(model);
        } 
       
          return "error"  ;
    }
}
