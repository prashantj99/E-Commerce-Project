package com.oss.entities;

import java.sql.Timestamp;

public class Order {
    private String orderid;
    private int userid;
    private float totalprice;
    private int totalitem;
    private float totaldiscount;
    private Timestamp dateoforder;
    private Timestamp expecteddate;
    private String shipaddress;
    private String paymentmethod;
    private String status;
    private String city;
    private String state;
    private int zip;
    private String country;
    private Product product;
//    constructor

    public Order(String orderid, int userid, float totalprice, int totalitem,
            float totaldiscount, Timestamp dateoforder, Timestamp expecteddate, String shipaddress, String paymentmethod, String status, String city, String state, int zip, String country) {
        this.orderid = orderid;
        this.userid = userid;
        this.totalprice = totalprice;
        this.totalitem = totalitem;
        this.totaldiscount = totaldiscount;
        this.dateoforder = dateoforder;
        this.expecteddate = expecteddate;
        this.shipaddress = shipaddress;
        this.paymentmethod = paymentmethod;
        this.status = status;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.country = country;
    }

    public Order(String orderid, Product product) {
        this.orderid = orderid;
        this.product = product;
    }
    public Order(String orderid,int userid, float totalprice, int totalitem, float totaldiscount, String shipaddress, String paymentmethod, String city, String state, int zip, String country) {
        this.orderid = orderid;
        this.userid = userid;
        this.totalprice = totalprice;
        this.totalitem = totalitem;
        this.totaldiscount = totaldiscount;
        this.shipaddress = shipaddress;
        this.paymentmethod = paymentmethod;
        this.city = city;
        this.state = state;
        this.zip = zip;
        this.country = country;
    }
    
    

//    **********************************************
//    setters and getters
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public float getTotalprice() {
        return totalprice;
    }

    public void setTotalprice(float totalprice) {
        this.totalprice = totalprice;
    }

    public int getTotalitem() {
        return totalitem;
    }

    public void setTotalitem(int totalitem) {
        this.totalitem = totalitem;
    }

    public float getTotaldiscount() {
        return totaldiscount;
    }

    public void setTotaldiscount(float totaldiscount) {
        this.totaldiscount = totaldiscount;
    }

    public Timestamp getDateoforder() {
        return dateoforder;
    }

    public void setDateoforder(Timestamp dateoforder) {
        this.dateoforder = dateoforder;
    }

    public Timestamp getExpecteddate() {
        return expecteddate;
    }

    public void setExpecteddate(Timestamp expecteddate) {
        this.expecteddate = expecteddate;
    }

    public String getShipaddress() {
        return shipaddress;
    }

    public void setShipaddress(String shipaddress) {
        this.shipaddress = shipaddress;
    }

    public String getPaymentmethod() {
        return paymentmethod;
    }

    public void setPaymentmethod(String paymentmethod) {
        this.paymentmethod = paymentmethod;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getCity() {
        return city;
    }

    public void setCity(String city) {
        this.city = city;
    }

    public String getState() {
        return state;
    }

    public void setState(String state) {
        this.state = state;
    }

    public int getZip() {
        return zip;
    }

    public void setZip(int zip) {
        this.zip = zip;
    }

    public String getCountry() {
        return country;
    }

    public void setCountry(String country) {
        this.country = country;
    }
}
