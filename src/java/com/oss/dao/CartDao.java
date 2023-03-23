package com.oss.dao;

import com.oss.entities.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CartDao {

    private Connection con;
    private boolean success;

    public CartDao(Connection con) {
        this.con = con;
    }

    public boolean isSuccess() {
        return success;
    }

    public boolean addToCart(Cart cart) {
        success = false;
        if(searchCartItemByProductidAndCartid(cart.getCartid(), cart.getProductid())){
            int q=getQuantityByProductidAndCartid(cart.getProductid(), cart.getCartid());
            updateProductQuantityByProductidAndCartid(cart.getProductid(), cart.getCartid(),q+1);
            success=true;
            return success;
        }
        try {
            //Cart ----------> database
            String query = "insert into Cart(cartid,productid,productquantity) values(?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cart.getUserid());
            ps.setInt(2, cart.getProductid());
            ps.setInt(3, cart.getProductquantity());
            int s = ps.executeUpdate();
            if (s == 1) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return success;
    }
    
    public void updateProductQuantityByProductidAndCartid(int productid, int cartid,int quantity) {
        success = false;
        try {
            //Cart ----------> database
            String query = "update cart set productquantity=? where cartid=? and productid=?;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, cartid);
            ps.setInt(3, productid);
            int s = ps.executeUpdate();
            if (s >=0) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            System.out.println("unDone");
            e.printStackTrace();
        }
    }
//    delete cart item

    public void deleteCartItemByProductidAndCartid(int productid, int cartid) {
        success = false;
        try {
            //Cart ----------> database
            String query = "delete from cart  where cartid=? and productid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartid);
            ps.setInt(2, productid);
            int s = ps.executeUpdate();
            System.out.println("Cart Error v1(cart) : "+cartid);
            System.out.println("Cart Error v1(product) : "+productid);
            if (s >=0) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }

    public int getQuantityByProductidAndCartid(int productid, int cartid) {
        int quantity = 0;
        success = false;
        try {
            //Cart ----------> database
            String query = "select * from cart where cartid=? and productid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartid);
            ps.setInt(2, productid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                success = true;
                quantity=set.getInt("productquantity");
                System.out.println("Error Quantity"+quantity);
                return quantity;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return quantity;
    }
//    search cart item

    public boolean searchCartItemByProductidAndCartid(int cartid,int productid) {
        boolean found = false;
        try {
            //Cart ----------> database
            String query = "select count(cartid) from cart  where cartid=? and productid=? ";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartid);
            ps.setInt(2, productid);
            System.out.println("Error cart"+cartid);
            System.out.println("Error product"+productid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                int count = set.getInt(1);
                if (count == 1) {
                    found = true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return found;
    }

    public int countCartItem(int cartid) {
        int count = 0;
        try {
            String query = "select * from Cart where cartid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cartid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productquantity = set.getInt("productquantity");
                count += productquantity;

            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Cart> getCartByUserid(int userid) {
        List<Cart> clist = new ArrayList<>();
        try {
            String query = "select * from Cart where cartid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productid = set.getInt("productid");
                int productquantity = set.getInt("productquantity");
                int cartid = set.getInt("cartid");
                Cart cart = new Cart(cartid, productid, productquantity);
                clist.add(cart);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return clist;
    }
}
