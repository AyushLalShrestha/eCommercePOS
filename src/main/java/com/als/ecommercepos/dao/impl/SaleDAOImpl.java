package com.als.ecommercepos.dao.impl;

import com.als.ecommercepos.dao.SaleDAO;
import com.als.ecommercepos.entity.Sale;
import java.util.List;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository(value = "saleDAOImpl")
public class SaleDAOImpl implements SaleDAO {

    @Autowired
    private SessionFactory sessionFactory;
    private Session session;
    private Transaction trans;

    @Override
    public List<Sale> getAllSales() {
        session = sessionFactory.openSession();
        List<Sale> saleList = session.createQuery("SELECT s FROM Sale s").list();
        return saleList;
    }

    @Override
    public Sale getSaleById(int id) {
        session = sessionFactory.openSession();
        return (Sale) session.get(Sale.class, id);
    }

    @Override
    public boolean insertNewSale(Sale sale) {
        session = sessionFactory.openSession();
        trans = session.beginTransaction();
        Boolean bool;
        try {
            session.save(sale);
            trans.commit();
            session.close();
            bool = Boolean.TRUE;
        } catch (Exception ex) {
            bool = Boolean.FALSE;
            System.out.println("--------------------------------- " + ex.getMessage());
        }
        return bool;
    }

    @Override
    public boolean deleteSalesRecord(int id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

}
