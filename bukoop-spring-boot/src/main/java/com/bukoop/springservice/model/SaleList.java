package com.bukoop.springservice.model;

import com.google.gson.Gson;

import javax.persistence.*;

/**
 * Created by haluks on 02/05/16.
 */
@Entity
@Table(name="SALE_LIST")
public class SaleList {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "MemberID")
    private int memberID;

    @Column(name = "DiscountPer")
    private Double discountPer;

    @Column(name = "TotalCost")
    private Double totalCost;

    @Column(name = "TotalDiscount")
    private Double totalDiscount;

    @Column(name = "NetCost")
    private Double netCost;

    @Column(name = "DetailCount")
    private int detailCount;

    @Column(name = "SaleDate")
    private String saleDate;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getMemberID() {
        return memberID;
    }

    public void setMemberID(int memberID) {
        this.memberID = memberID;
    }

    public Double getDiscountPer() {
        return discountPer;
    }

    public void setDiscountPer(Double discountPer) {
        this.discountPer = discountPer;
    }

    public Double getTotalCost() {
        return totalCost;
    }

    public void setTotalCost(Double totalCost) {
        this.totalCost = totalCost;
    }

    public Double getTotalDiscount() {
        return totalDiscount;
    }

    public void setTotalDiscount(Double totalDiscount) {
        this.totalDiscount = totalDiscount;
    }

    public Double getNetCost() {
        return netCost;
    }

    public void setNetCost(Double netCost) {
        this.netCost = netCost;
    }

    public int getDetailCount() {
        return detailCount;
    }

    public void setDetailCount(int detailCount) {
        this.detailCount = detailCount;
    }

    public String getSaleDate() {
        return saleDate;
    }

    public void setSaleDate(String saleDate) {
        this.saleDate = saleDate;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
