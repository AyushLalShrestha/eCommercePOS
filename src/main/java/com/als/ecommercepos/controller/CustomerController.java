package com.als.ecommercepos.controller;

import com.als.ecommercepos.dao.CustomerDAO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.als.ecommercepos.entity.Customer;
import javax.servlet.http.HttpServletRequest;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
@RequestMapping(value = "/customer")
public class CustomerController {

    @Autowired
    private CustomerDAO customerDAO;

    @RequestMapping(method = RequestMethod.GET)
    public String customerIndex(Model model) {
        model.addAttribute("customerList", customerDAO.getAllCustomers());
        return "customerindex";
    }

    @RequestMapping(value = "/newcustomer", method = RequestMethod.POST)
    public String addNewCustomer(@ModelAttribute("customer") Customer customer, Model model) {
        if(customerDAO.insertNewCustomer(customer)){
             return customerIndex(model);
        } 
       
          return "error"  ;
    }
    
     @RequestMapping(value = "/isvalidcustomer",method = RequestMethod.GET)
    @ResponseBody
     public int isValidCustomer(HttpServletRequest req) {
        String customerId = req.getParameter("customerId");
        if(customerDAO.getCustomerById(customerId) != null){
            return 1;
        }
        return 0;
    
       }
}
