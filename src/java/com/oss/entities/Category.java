package com.oss.entities;

/**
 *
 * @author Prashant
 */
public class Category {
    private int categoryid;
    private String categorytitle;
    private String categoryimage;
    private String categorydescription;
    public int getCategoryid() {
        return categoryid;
    }

    public Category(int categoryid, String categorytitle, String categoryimage, String categorydescription) {
        this.categoryid = categoryid;
        this.categorytitle = categorytitle;
        this.categoryimage = categoryimage;
        this.categorydescription = categorydescription;
    }

    public Category(String categorytitle, String categoryimage, String categorydescription) {
        this.categorytitle = categorytitle;
        this.categoryimage = categoryimage;
        this.categorydescription = categorydescription;
    }
    
    public void setCategoryid(int categoryid) {
        this.categoryid = categoryid;
    }

    public String getCategorytitle() {
        return categorytitle;
    }

    public void setCategorytitle(String categorytitle) {
        this.categorytitle = categorytitle;
    }

    public String getCategoryimage() {
        return categoryimage;
    }

    public void setCategoryimage(String categoryimage) {
        this.categoryimage = categoryimage;
    }

    public String getCategorydescription() {
        return categorydescription;
    }

    public void setCategorydescription(String categorydescription) {
        this.categorydescription = categorydescription;
    }
    
}
