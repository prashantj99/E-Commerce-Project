package com.oss.dao;

import com.oss.entities.*;
import java.sql.*;
import java.util.ArrayList;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.Set;

public class ProductDao {

    private Connection con;
    boolean success;

    public ProductDao(Connection con) {
        this.con = con;
        success = false;
    }

    public boolean isSuccess() {
        return success;
    }

    public boolean addProduct(Product p) {
        success = false;
        try {
            //Product ----------> database
            String query = "insert into Product(productname,productdescription,productprice,quantity,productimage,categoryid) values(?,?,?,?,?,?)";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, p.getProductname());
            ps.setString(2, p.getProductdescription());
            ps.setFloat(3, p.getProductprice());
            ps.setInt(4, p.getQuantity());
            ps.setString(5, p.getProductimage());
            ps.setInt(6, p.getCategoryid());
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

    public boolean addProductByOrderid(String orderid, OrderProduct p) {
        success = false;
        try {
            //OrderProduct ----------> database
            String query = "insert into orderproduct(orderid,productid,productname,productdescription,productprice,categoryid,quantity,productcategory,productimage,productdiscount,netprice) values(?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, orderid);
            ps.setInt(2, p.getProductid());
            ps.setString(3, p.getProductname());
            ps.setString(4, p.getProductdescription());
            ps.setFloat(5, p.getProductprice());
            ps.setInt(6, p.getCategoryid());
            ps.setInt(7, p.getQuantity());
            ps.setString(8, p.getProductcategory());
            ps.setString(9, p.getProductimage());
            ps.setFloat(10, p.getProductdiscount());
            ps.setFloat(11, p.getNetprice());
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

    public int countProduct() {
        int count = 0;
        try {
            String query = "select * from Product";
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
//    count product in particular category
    public int countProduct(int categoryid) {
        int count = 0;
        try {
            String query = "select * from Product where categoryid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,categoryid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                count++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    public List<Product> getProductByCategory(int cid, int offset,int limit) {
        List<Product> plist = new ArrayList<>();
        try {
            String query = "select * from Product where categoryid=? and quantity <> 0 limit ? offset ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productimage = set.getString("productimage");
                String productdescription = set.getString("productdescription");
                Float productprice = set.getFloat("productprice");
                int quantity = set.getInt("quantity");
                int categoryid = set.getInt("categoryid");
                Product p = new Product(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
                plist.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plist;
    }
// get all product

    public List<Product> getAllProduct() {
        List<Product> plist = new ArrayList<>();
        try {
            String query = "select * from Product order by productid ;";
            PreparedStatement ps = con.prepareStatement(query);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productimage = set.getString("productimage");
                String productdescription = set.getString("productdescription");
                Float productprice = set.getFloat("productprice");
                int quantity = set.getInt("quantity");
                int categoryid = set.getInt("categoryid");
                Product p = new Product(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
                plist.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plist;
    }
//    end
    // get all product with limit and offset

    public List<Product> getAllProduct(int limit,int offset) {
        List<Product> plist = new ArrayList<>();
        try {
            String query = "select * from Product  limit ? offset ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,limit);
            ps.setInt(2,offset);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productimage = set.getString("productimage");
                String productdescription = set.getString("productdescription");
                Float productprice = set.getFloat("productprice");
                int quantity = set.getInt("quantity");
                int categoryid = set.getInt("categoryid");
                Product p = new Product(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
                plist.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plist;
    }
//    end

    public Product getProductByProductid(int pid) {
        Product p = null;
        try {
            String query = "select * from Product where productid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, pid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productimage = set.getString("productimage");
                String productdescription = set.getString("productdescription");
                Float productprice = set.getFloat("productprice");
                int quantity = set.getInt("quantity");
                int categoryid = set.getInt("categoryid");
                p = new Product(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
                return p;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return p;
    }

    public List<Product> getProductByPrice(int from, int to, int cid) {
        List<Product> plist = new ArrayList<>();
        try {
            String query = "select * from Product where categoryid= ? and productprice between ? and ? and quantity <> 0 ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, cid);
            ps.setInt(2, from);
            ps.setInt(3, to);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productimage = set.getString("productimage");
                String productdescription = set.getString("productdescription");
                Float productprice = set.getFloat("productprice");
                int quantity = set.getInt("quantity");
                int categoryid = set.getInt("categoryid");
                Product p = new Product(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
                plist.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plist;
    }
//    get all product having zero quantity

    public List<Product> getProductHavingQuantityZero(int quantity) {
        List<Product> plist = new ArrayList<>();
        try {
            String query = "select * from Product where quantity=? order by productid;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productimage = set.getString("productimage");
                String productdescription = set.getString("productdescription");
                Float productprice = set.getFloat("productprice");
                quantity = set.getInt("quantity");
                int categoryid = set.getInt("categoryid");
                Product p = new Product(productid, productname, productdescription, productprice, quantity, categoryid, productimage);
                plist.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return plist;
    }
//    update product quantity

    public void updateQuantityByProductid(int productid, int quantity) {
        success = false;
        try {
            String query = "update product set productquantity=? where productid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, productid);
            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public void updateProductByProductid(int productid, int quantity) {
        success = false;
        try {
            String query = "update product set quantity=? where productid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, quantity);
            ps.setInt(2, productid);
            int i = ps.executeUpdate();
            if (i >= 0) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    search product by keyword

    public Set<Integer> getProductByKeyword(String[] keywords,int limit,int offset) {
        Set<Integer> productidlst = new LinkedHashSet<>();
        try {
                String keyword=keywords[0];
                String query = "SELECT product.productid\n"
                        + "FROM product INNER JOIN category ON product.categoryid=category.categoryid\n"
                        + "WHERE product.productname LIKE '%" + keyword + "%' OR product.productdescription LIKE '%" + keyword + "%' OR \n"
                        + "category.categorytitle LIKE '%" + keyword + "%' limit ? offset ?;";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setInt(1,limit);
                ps.setInt(2,offset);
                ResultSet set=ps.executeQuery();
                while(set.next()){
                    productidlst.add(set.getInt(1));
                }
            return productidlst;
        } catch (Exception e) {
        }
        return productidlst;
    }
    public int getProductQuantityByProductid(int productid){
        int qty=0;
        try {
            String query = "select quantity from Product where productid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1,productid);
            ResultSet set = ps.executeQuery();
            if(set.next()){
               qty=set.getInt("quantity");
               return qty;
            }
        } catch (Exception e) {
                e.printStackTrace();
        }
        return qty;
    }
}
