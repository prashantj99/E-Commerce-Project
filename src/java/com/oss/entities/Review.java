package com.oss.entities;
public class Review {
    private int productid;
    private int userid;
    private String comment;
    private int starcount;

    public Review(int productid, int userid, String comment, int starcount) {
        this.productid = productid;
        this.userid = userid;
        this.comment = comment;
        this.starcount = starcount;
    }

    public int getProductid() {
        return productid;
    }

    public void setProductid(int productid) {
        this.productid = productid;
    }

    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public int getStarcount() {
        return starcount;
    }

    public void setStarcount(int starcount) {
        this.starcount = starcount;
    }
    
    
}
