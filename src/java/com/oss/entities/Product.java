package com.oss.entities;

/**
 *
 * @author Prashant
 */
public class Product {
    protected int productid;
    protected String productname;
    protected String productdescription;
    protected float productprice;
    protected int quantity;
    protected int categoryid;
    protected String productimage;
    
    public Product(int productid, String productname, String productdescription, float productprice, int quantity, int categoryid, String productimage) {
        this.productid = productid;
        this.productname = productname;
        this.productdescription = productdescription;
        this.productprice = productprice;
        this.quantity = quantity;
        this.categoryid = categoryid;
        this.productimage = productimage;
    }

    public Product(String productname, String productdescription, float productprice, int quantity, int categoryid, String productimage) {
        this.productname = productname;
        this.productdescription = productdescription;
        this.productprice = productprice;
        this.quantity = quantity;
        this.categoryid = categoryid;
        this.productimage = productimage;
    }
    public Product(int productid, String productname, String productdescription, float productprice, int quantity,int categoryid) {
        this.productid = productid;
        this.productname = productname;
        this.productdescription = productdescription;
        this.productprice = productprice;
        this.quantity = quantity;
        this.categoryid = categoryid;
    }
    public Product(){
        //empty constructor
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public String getProductname() {
        return productname;
    }

    public void setProductname(String productname) {
        this.productname = productname;
    }

    public String getProductdescription() {
        return productdescription;
    }

    public void setProductdescription(String productdescription) {
        this.productdescription = productdescription;
    }

    public float getProductprice() {
        return productprice;
    }

    public void setProductprice(float productprice) {
        this.productprice = productprice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }
    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getProductimage() {
        return productimage;
    }

    public void setProductimage(String productimage) {
        this.productimage = productimage;
    }
    
}
