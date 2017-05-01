/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.controller;

import com.als.ecommercepos.dao.ProductDAO;
import com.als.ecommercepos.dao.SaleDAO;
import com.als.ecommercepos.dto.DTOEntity.DTOSale;
import com.als.ecommercepos.dto.DTOSaleDAOImpl;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.ui.Model;
import com.als.ecommercepos.entity.Sale;
import com.als.ecommercepos.entity.Product;
import java.util.Date;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/")
public class DefaultController {

    @Autowired
    private SaleDAO saleDAO;
    
     @Autowired
    private ProductDAO productDAO;

     
    @Autowired
    private DTOSaleDAOImpl dtoSaleDAOImpl;        
     
    @RequestMapping(method = RequestMethod.GET)
    public String defaultIndex(Model model) {
        try {
            List<Sale> saleList1 = saleDAO.getAllSales();
            System.out.println(saleList1.size());
            model.addAttribute("saleList", saleList1);
        } catch (IllegalStateException ise) {
            System.out.println("----------------------------------- Error: " + ise.getMessage());
        }
        model.addAttribute("name", "Ayush");
        return "index";
    }

    @RequestMapping(value = "/getsale", method = RequestMethod.GET)
    @ResponseBody
    public String getSaleById(HttpServletRequest req) {
        int id = Integer.parseInt(req.getParameter("saleid"));
        Sale sale = saleDAO.getSaleById(id);
        return (sale.getCustomerId().getCustomerId() + " bought " + sale.getProductId().getProductId() );
    }

    @RequestMapping(value="/newsale", method = RequestMethod.POST)
    public String addNewSale(@ModelAttribute("sale") Sale sale, Model model){
        sale.setSaleId(saleDAO.getAllSales().size() + 1);
        sale.setSaleDate(new Date());
        if(saleDAO.insertNewSale(sale)){
             return defaultIndex(model);
        } 
       
          return "error"  ;
    }
    
    @RequestMapping(value="/getTotal/{productId}")
    @ResponseBody
    public int getLineTotal(HttpServletRequest req, @PathVariable("productId") String productId){
       try {
        String qty = req.getParameter("quantity");
        int quantity = Integer.parseInt(qty)  ;
        Product product = productDAO.getProductById(productId);
        int total = quantity * product.getPrice();
        return total;
       } catch(Exception ex){
           return -1;
           
       }
    }
    
    @RequestMapping(value = "/api/allsales", method = RequestMethod.GET)
    @ResponseBody
    public List<DTOSale> getSaleREST(HttpServletRequest req) {
        List<DTOSale> dtoSaleList = dtoSaleDAOImpl.getAllDTOSalesAPI();
        return dtoSaleList;
    }
    
    @RequestMapping(value = "/ngapitest", method = RequestMethod.GET)
    public String getSaleRESTIndex(HttpServletRequest req) {
        return "ngindex";
    }
    
    
}
