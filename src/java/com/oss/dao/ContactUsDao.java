package com.oss.dao;

import com.oss.entities.ContactUs;
import java.sql.Connection;
import java.sql.PreparedStatement;

public class ContactUsDao {

    private Connection con;
    private boolean success;

    public ContactUsDao(Connection con) {
        this.con = con;
    }

    public boolean isSuccess() {
        return success;
    }
//    add contact  us to database

    public void addContactUs(ContactUs c) {
        success=false;
        try {
            //contactus ----------> database
            String query = "insert into ContactUs(fname,lname,email,msg) values(?,?,?,?) ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,c.getFname());
            ps.setString(2,c.getLname());
            ps.setString(3,c.getEmail());
            ps.setString(4,c.getSubject());
            int s = ps.executeUpdate();
            if (s == 1) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

    }
}
