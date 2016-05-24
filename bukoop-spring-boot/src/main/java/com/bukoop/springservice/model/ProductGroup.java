package com.bukoop.springservice.model;

import com.google.gson.Gson;

import javax.persistence.*;

/**
 * Created by haluks on 02/05/16.
 */
@Entity
@Table(name="PRODUCT_GROUP")
public class ProductGroup {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "Name")
    private String Name;

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return Name;
    }

    public void setName(String name) {
        Name = name;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
