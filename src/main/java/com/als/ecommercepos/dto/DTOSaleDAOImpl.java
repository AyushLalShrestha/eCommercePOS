/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.dto;

import com.als.ecommercepos.dao.SaleDAO;
import com.als.ecommercepos.entity.Sale;
import com.als.ecommercepos.dto.DTOEntity.DTOSale;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "dtoSaleDAOImpl")
public class DTOSaleDAOImpl {

    @Autowired
    private SaleDAO saleDAO;

    public List<DTOSale> getAllDTOSalesAPI() {
        List<Sale> saleList = saleDAO.getAllSales();
        List<DTOSale> dtoSaleList = new ArrayList<>();
        for (Sale sale : saleList) {
            DTOSale dtoSale = new DTOSale();
            dtoSale.setSaleId(sale.getSaleId());
            dtoSale.setCustomerId(sale.getCustomerId().getCustomerId());
            dtoSale.setCustomerName(sale.getCustomerId().getName());
            dtoSale.setCustomerContact(sale.getCustomerId().getContactNo());
            dtoSale.setProductId(sale.getProductId().getProductId());
            dtoSale.setProductName(sale.getProductId().getName());
            dtoSale.setPricePerPiece(sale.getProductId().getPrice());
            dtoSale.setQuantity(sale.getQuantity());
            dtoSale.setTotal(sale.getTotal());
            dtoSale.setSaleDate(sale.getSaleDate().toString());
            DateFormat df = new SimpleDateFormat("MM/dd/yyyy HH:mm:ss");
            String reportDate = df.format(sale.getSaleDate());
            System.out.println("- - - - - - - - - - - - - - - - - - - - - - - -  - - - - - ");
            System.out.println(reportDate);
            dtoSaleList.add(dtoSale);
        }
        return dtoSaleList;
    }

    public List<DTOSale> getDaySalesAPI(int year, int month, int day) {
        List<Sale> saleList = saleDAO.getAllSales();
        List<DTOSale> dtoSaleList = new ArrayList<>();
        for (Sale sale : saleList) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(sale.getSaleDate());
            int yr = cal.get(Calendar.YEAR);
            int mnth = cal.get(Calendar.MONTH);
            int dy = cal.get(Calendar.DAY_OF_MONTH);
            int no = (int)year + (int)month + (int)day;
            //System.out.println(yr+mnth+dy + " -----------------" + no);
            if (yr == year && mnth == month && dy == day   ) {
                System.out.println(yr + " : " + mnth + " : " + dy + "---------------------");
                DTOSale dtoSale = new DTOSale();
                dtoSale.setSaleId(sale.getSaleId());
                dtoSale.setCustomerId(sale.getCustomerId().getCustomerId());
                dtoSale.setCustomerName(sale.getCustomerId().getName());
                dtoSale.setCustomerContact(sale.getCustomerId().getContactNo());
                dtoSale.setProductId(sale.getProductId().getProductId());
                dtoSale.setProductName(sale.getProductId().getName());
                dtoSale.setPricePerPiece(sale.getProductId().getPrice());
                dtoSale.setQuantity(sale.getQuantity());
                dtoSale.setTotal(sale.getTotal());
                dtoSale.setSaleDate(sale.getSaleDate().toString());
                dtoSaleList.add(dtoSale);
            }

        }
        return dtoSaleList;
    }

}
