/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.controller;

import com.als.ecommercepos.dao.ProductDAO;
import com.als.ecommercepos.dao.SaleDAO;
import com.als.ecommercepos.entity.Product;
import com.als.ecommercepos.entity.Sale;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/api")
public class RestTestController {

    @Autowired
    private ProductDAO productDAO;
    
    @Autowired
    private SaleDAO saleDAO;

    @RequestMapping(value = "getallsales", method = RequestMethod.GET)
    @ResponseBody
    public List<Sale> testingRest(HttpServletRequest request, HttpServletResponse response) {
        List<Sale> saleList = saleDAO.getAllSales();
        return saleList;
    }

}
