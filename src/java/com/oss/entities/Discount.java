package com.oss.entities;
public class Discount {
     private float discount;
     private String discountdescription;
     private int categoryid;

    public Discount(float discount, String discountdescription, int categoryid) {
        this.discount = discount;
        this.discountdescription = discountdescription;
        this.categoryid = categoryid;
    }

    public Discount() {
    }

    public float getDiscount() {
        return discount;
    }

    public void setDiscount(float discount) {
        this.discount = discount;
    }

    public String getDiscountdescription() {
        return discountdescription;
    }

    public void setDiscountdescription(String discountdescription) {
        this.discountdescription = discountdescription;
    }

    public int getCategoryid() {
        return categoryid;
    }

    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }
     
     
}
