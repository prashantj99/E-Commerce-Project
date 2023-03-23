package com.oss.dao;

import com.oss.entities.Discount;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class DiscountDao {

    private Connection con;
    boolean success;

    public DiscountDao(Connection con) {
        this.con = con;
    }

    public boolean isSuccess() {
        return success;
    }

    public void saveDiscount(Discount d) {
        success = false;
        if(searchDiscountByCategory(d.getCategoryid())){
            success=updateDiscount(d);
            return;
        }
        try {
            String query = "insert into Discount(discount,discountdescription,categoryid) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setFloat(1, d.getDiscount());
            ps.setString(2, d.getDiscountdescription());
            ps.setInt(3, d.getCategoryid());
            int s = ps.executeUpdate();
            if (s == 1) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public float getDiscountByCategory(int cid) {
        float discount = 0;
        try {
            String query1 = "select discount from Discount where categoryid=?";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setInt(1, cid);
            ResultSet set1 = ps1.executeQuery();
            if (set1.next()) {
                discount = set1.getFloat("discount");
                System.out.println("Discount : " + discount);
                return discount;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return discount;
    }

    public boolean searchDiscountByCategory(int cid) {
        boolean found=false;
        try {
            String query1 = "select discount from Discount where categoryid=?";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setInt(1, cid);
            ResultSet set1 = ps1.executeQuery();
            if (set1.next()) {
                found=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return found;
    }
    public boolean updateDiscount(Discount d){
        success=false;
        try {
            String query1 = "update Discount set discount=? , discountdescription=? where categoryid=? ;";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setFloat(1,d.getDiscount());
            ps1.setString(2,d.getDiscountdescription());
            ps1.setInt(3,d.getCategoryid());
            int s=ps1.executeUpdate();
            if(s>=0){
                success=true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }

}
