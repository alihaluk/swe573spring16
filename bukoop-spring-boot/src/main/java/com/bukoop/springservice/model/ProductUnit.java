package com.bukoop.springservice.model;

import com.google.gson.Gson;

import javax.persistence.*;

/**
 * Created by haluks on 02/05/16.
 */
@Entity
@Table(name = "UNIT")
public class ProductUnit {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "Name")
    private String name;

    @Column(name = "IsFloat")
    private Boolean isFloat;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Boolean getFloat() {
        return isFloat;
    }

    public void setFloat(Boolean aFloat) {
        isFloat = aFloat;
    }

    //    @Override
//    public String toString() {
//        return new Gson().toJson(this);
//    }
}
