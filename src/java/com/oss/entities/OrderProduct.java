package com.oss.entities;
public class OrderProduct extends Product{
    private float productdiscount;//only for orderproduct
    private float netprice; //only for orderproduct
    private String productcategory; //only for orderproduct
    private String orderid;
    public OrderProduct(float productdiscount, float netprice, String productcategory, int productid, String productname,
            String productdescription, float productprice, int quantity, int categoryid, String productimage) {
        super(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
        this.productdiscount = productdiscount;
        this.netprice = netprice;
        this.productcategory = productcategory;
    }

    public OrderProduct(float productdiscount, float netprice,
            String productcategory, String orderid, String productname,
            String productdescription, float productprice, int quantity, int categoryid, String productimage) {
        super(productname, productdescription, productprice, quantity, categoryid, productimage);
        this.productdiscount = productdiscount;
        this.netprice = netprice;
        this.productcategory = productcategory;
        this.orderid = orderid;
    }
    public OrderProduct(int productid,float productdiscount, float netprice,
            String productcategory, String orderid, String productname,
            String productdescription, float productprice, int quantity, int categoryid, String productimage) {
        super(productid,productname, productdescription, productprice, quantity, categoryid, productimage);
//        super.productid=productid;
        this.productdiscount = productdiscount;
        this.netprice = netprice;
        this.productcategory = productcategory;
        this.orderid = orderid;
    }
    
    public String getOrderid() {
        return orderid;
    }

    public void setOrderid(String orderid) {
        this.orderid = orderid;
    }
    
    public float getProductdiscount() {
        return productdiscount;
    }

    public void setProductdiscount(float productdiscount) {
        this.productdiscount = productdiscount;
    }

    public float getNetprice() {
        return netprice;
    }

    public void setNetprice(int netprice) {
        this.netprice = netprice;
    }

    public String getProductcategory() {
        return productcategory;
    }

    public void setProductcategory(String productcategory) {
        this.productcategory = productcategory;
    }    
}
