/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.als.ecommercepos.dao;

import java.util.List;
import com.als.ecommercepos.entity.Sale;

public interface SaleDAO {

    List<Sale> getAllSales();

    List<Sale> getSalesByDay(String year, String month,String day);

    Sale getSaleById(int id);

    boolean insertNewSale(Sale sale);

}
