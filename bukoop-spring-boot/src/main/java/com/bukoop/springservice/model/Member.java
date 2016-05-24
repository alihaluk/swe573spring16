package com.bukoop.springservice.model;

import com.google.gson.Gson;

import javax.persistence.*;

/**
 * Created by haluks on 02/05/16.
 */
@Entity
@Table(name="MEMBER")
public class Member {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private int id;

    @Column(name = "Name")
    private String Name;

    @Column(name = "Code")
    private String membershipCode;

    @Column(name = "Mail")
    private String Mail;

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

    public String getMembershipCode() {
        return membershipCode;
    }

    public void setMembershipCode(String membershipCode) {
        this.membershipCode = membershipCode;
    }

    public String getMail() {
        return Mail;
    }

    public void setMail(String mail) {
        Mail = mail;
    }

    @Override
    public String toString() {
        return new Gson().toJson(this);
    }
}
