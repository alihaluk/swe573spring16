package com.bukoop.springservice.model;

import com.google.gson.Gson;

import javax.persistence.*;

/**
 * Created by haluks on 02/05/16.
 */
@Entity
@Table(name="SALE_DETAILS")
public class SaleDetails {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "SalesListID")
    private int salesListID;

    @Column(name = "ProductID")
    private int productID;

    @Column(name = "UnitID")
    private int unitID;

    @Column(name = "SelectedUnit")
    private String selectedUnit;

    @Column(name = "Amount")
    private Double amount;

    @Column(name = "ProductPrice")
    private Double productPrice;

    @Column(name = "TotalCost")
    private Double totalCost;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getSalesListID() {
        return salesListID;
    }

    public void setSalesListID(int salesListID) {
        this.salesListID = salesListID;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public String getSelectedUnit() {
        return selectedUnit;
    }

    public void setSelectedUnit(String selectedUnit) {
        this.selectedUnit = selectedUnit;
    }

    public Double getAmount() {
        return amount;
    }

    public void setAmount(Double amount) {
        this.amount = amount;
    }

    public Double getProductPrice() {
        return productPrice;
    }

    public void setProductPrice(Double productPrice) {
        this.productPrice = productPrice;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
