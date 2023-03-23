package com.oss.dao;

import com.oss.entities.Category;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class CategoryDao {
    private Connection con;
    boolean success;

    public CategoryDao(Connection con) {
        this.con = con;
    }

    public boolean isSuccess() {
        return success;
    }
    public void addCategory(Category c){
        success = false;
        try {
            //category ----------> database
            String query = "insert into category(categorytitle,categoryimage,categorydescription) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, c.getCategorytitle());
            ps.setString(2, c.getCategoryimage());
            ps.setString(3, c.getCategorydescription());
            int s = ps.executeUpdate();
            if (s == 1) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
    public List<Category> getAllCategory(){
        List<Category> clist=new ArrayList<>();
        try {
            String query = "select * from category";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet set=ps.executeQuery();
            while(set.next()){
                int categoryid=set.getInt("categoryid");
                String categorytitle=set.getString("categorytitle");
                String categoryimage=set.getString("categoryimage");
                String categorydescription=set.getString("categorydescription");
                Category cat=new Category(categoryid,categorytitle, categoryimage, categorydescription);
                clist.add(cat);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return clist;
    }
    public Category getCategoryById(int cid){
        try {
            String query = "select * from category where categoryid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ResultSet set=ps.executeQuery();
            if(set.next()){
                int categoryid=set.getInt("categoryid");
                String categorytitle=set.getString("categorytitle");
                String categoryimage=set.getString("categoryimage");
                String categorydescription=set.getString("categorydescription");
                Category cat=new Category(categoryid,categorytitle, categoryimage, categorydescription);
                return cat;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
    public int countCategory() {
        int count=0;
        try {
            String query = "select * from Category";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
}
