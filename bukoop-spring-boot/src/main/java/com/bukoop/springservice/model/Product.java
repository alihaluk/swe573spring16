package com.bukoop.springservice.model;

import com.google.gson.Gson;

import javax.persistence.*;

/**
 * Created by haluks on 02/05/16.
 */
@Entity
@Table(name = "PRODUCT")
public class Product {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "ProductGroupID")
    private int productGroupID;

    @Column(name = "ProducerID")
    private int producerID;

    @Column(name = "UnitID")
    private int unitID;

    @Column(name = "Code")
    private String code;

    @Column(name = "Name")
    private String productName;

    @Column(name = "Origin")
    private String origin;

    @Column(name = "Stock")
    private int stock;

    @Column(name = "ProductionType")
    private int productionType;

    @Column(name = "PackagingType")
    private int packagingType;

    @Column(name = "Barcode")
    private String barcode;

    @Column(name = "Price")
    private Double price;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getProductGroupID() {
        return productGroupID;
    }

    public void setProductGroupID(int productGroupID) {
        this.productGroupID = productGroupID;
    }

    public int getProducerID() {
        return producerID;
    }

    public void setProducerID(int producerID) {
        this.producerID = producerID;
    }

    public int getUnitID() {
        return unitID;
    }

    public void setUnitID(int unitID) {
        this.unitID = unitID;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getOrigin() {
        return origin;
    }

    public void setOrigin(String origin) {
        this.origin = origin;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public int getProductionType() {
        return productionType;
    }

    public void setProductionType(int productionType) {
        this.productionType = productionType;
    }

    public int getPackagingType() {
        return packagingType;
    }

    public void setPackagingType(int packagingType) {
        this.packagingType = packagingType;
    }

    public String getBarcode() {
        return barcode;
    }

    public void setBarcode(String barcode) {
        this.barcode = barcode;
    }

    public Double getPrice() {
        return price;
    }

    public void setPrice(Double price) {
        this.price = price;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
