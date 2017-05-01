package com.als.ecommercepos.dto.DTOEntity;

import java.util.Date;

public class DTOSale {

    private int saleId, quantity, total, pricePerPiece;
    private String customerId, productId, customerName, productName, customerContact;
    private Date saleDate;
    
    public DTOSale() {
    }

    public DTOSale(int saleId, int quantity, int total, int pricePerPiece, String customerId, String productId, String customerName, String customerContact, String productName, Date saleDate) {
        this.saleId = saleId;
        this.quantity = quantity;
        this.total = total;
        this.pricePerPiece = pricePerPiece;
        this.customerId = customerId;
        this.productId = productId;
        this.customerName = customerName;
        this.customerContact = customerContact;
        this.productName = productName;
        this.saleDate = saleDate;
    }

    public int getSaleId() {
        return saleId;
    }

    public void setSaleId(int saleId) {
        this.saleId = saleId;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public int getPricePerPiece() {
        return pricePerPiece;
    }

    public void setPricePerPiece(int pricePerPiece) {
        this.pricePerPiece = pricePerPiece;
    }

    public String getCustomerId() {
        return customerId;
    }

    public void setCustomerId(String customerId) {
        this.customerId = customerId;
    }

    public String getProductId() {
        return productId;
    }

    public void setProductId(String productId) {
        this.productId = productId;
    }

    public String getCustomerName() {
        return customerName;
    }

    public void setCustomerName(String customerName) {
        this.customerName = customerName;
    }
    
    public String getCustomerContact() {
        return customerContact;
    }

    public void setCustomerContact(String customerContact) {
        this.customerContact = customerContact;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public Date getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(Date saleDate) {
        this.saleDate = saleDate;
    }

}
