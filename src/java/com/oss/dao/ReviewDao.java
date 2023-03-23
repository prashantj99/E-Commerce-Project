package com.oss.dao;

import com.oss.entities.Review;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDao {

    private Connection con;
    private boolean success;

    public ReviewDao(Connection con) {
        this.con = con;
    }

    public boolean isSuccess() {
        return success;
    }

    public List<Review> getProductReview(int productid) {
        success = false;
        List<Review> rwlst = new ArrayList<>();
        try {
            String query = "select * from review where productid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, productid);
            ResultSet set = ps.executeQuery();
            success = true;
            while (set.next()) {
                Review rw = new Review(set.getInt("productid"), set.getInt("userid"), set.getString("comment"), set.getInt("starcount"));
                rwlst.add(rw);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rwlst;
    }
//    get all review

    public List<Review> getAllProductReview() {
        success = false;
        List<Review> rwlst = new ArrayList<>();
        try {
            String query = "select * from review ;";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet set = ps.executeQuery();
            success = true;
            while (set.next()) {
                Review rw = new Review(set.getInt("productid"), set.getInt("userid"), set.getString("comment"), set.getInt("starcount"));
                rwlst.add(rw);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return rwlst;
    }

    public void addReview(Review rw) {
        success = false;
        if (searchReview(rw.getProductid(), rw.getUserid())) {
            success = updateReview(rw);
            return;
        }
        try {
            String query = "insert into review(productid,userid,comment,starcount) values(?,?,?,?) ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, rw.getProductid());
            ps.setInt(2, rw.getUserid());
            ps.setString(3, rw.getComment());
            ps.setInt(4, rw.getStarcount());
            int i = ps.executeUpdate();
            if (i >= 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public boolean searchReview(int productid, int userid) {
        boolean found = false;
        try {
            String query1 = "select productid , userid from review where productid=? and userid=? ;";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setInt(1, productid);
            ps1.setInt(2, userid);
            ResultSet set1 = ps1.executeQuery();
            if (set1.next()) {
                found = true;
                return found;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return found;
    }

    public boolean updateReview(Review rw) {
        success = false;
        try {
            String query1 = "update Review set comment=? , starcount=? where productid=? and userid=? ;";
            PreparedStatement ps1 = con.prepareStatement(query1);
            ps1.setString(1, rw.getComment());
            ps1.setInt(2, rw.getStarcount());
            ps1.setInt(3, rw.getProductid());
            ps1.setInt(4, rw.getUserid());
            int s = ps1.executeUpdate();
            if (s >= 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
}
