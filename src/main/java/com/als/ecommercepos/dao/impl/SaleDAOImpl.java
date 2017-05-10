package com.als.ecommercepos.dao.impl;

import com.als.ecommercepos.dao.SaleDAO;
import com.als.ecommercepos.entity.Sale;
import java.util.List;
import org.hibernate.SQLQuery;
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
    public List<Sale> getSalesByDay(String year, String month, String day) {
        session = sessionFactory.openSession();
        //List<Sale> saleList = session.createQuery("SELECT s FROM Sale s WHERE s.saleDate = 2017-03-18" ).list();
        // SELECT * FROM sales WHERE YEAR(sale_date) = 2017 AND MONTH(sale_date) = 2
        //String sql = "SELECT * FROM EMPLOYEE WHERE id = :employee_id";
        String sql = "SELECT * FROM sales WHERE YEAR(sale_date) = :year AND MONTH(sale_date) = :month";
        SQLQuery query = session.createSQLQuery(sql);
        query.addEntity(Sale.class);
        query.setParameter("year", year);
        query.setParameter("month", month);
        List results = query.list();
        return results;
    }

}
