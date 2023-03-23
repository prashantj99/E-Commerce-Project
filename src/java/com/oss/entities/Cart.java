package com.oss.entities;

/**
 *
 * @author Prashant
 */
public class Cart {
    private int cartid;
    private int userid;
    private int productid;
    private int productquantity;
    
    public int getCartid() {
        return cartid;
    }

    public void setCartid(int cartid) {
        this.cartid = cartid;
    }

    public Cart(int userid, int productid, int productquantity) {
        this.cartid=this.userid = userid;
        this.productid = productid;
        this.productquantity = productquantity;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getProductquantity() {
        return productquantity;
    }

    public void setProductquantity(int productquantity) {
        this.productquantity = productquantity;
    }
    
}
