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

    Sale getSaleById(int id);

    boolean insertNewSale(Sale sale);

    boolean deleteSalesRecord(int id);
            
}
