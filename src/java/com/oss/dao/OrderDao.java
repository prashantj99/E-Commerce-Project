package com.oss.dao;

import com.oss.entities.Order;
import com.oss.entities.OrderProduct;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

public class OrderDao {

    private Connection con;
    boolean success;

    public boolean isSuccess() {
        return success;
    }

    public void setSuccess(boolean success) {
        this.success = success;
    }
//    constructor

    public OrderDao(Connection con) {
        this.con = con;
    }
//    add order

    public void addOrder(Order order) {
        success = false;
        try {
            //order ----------> database
            String query = "insert into ordertable(userid,totalprice,totalitem,totaldiscount,shipaddress,paymentmethod,city,state,zip,country,orderid) values(?,?,?,?,?,?,?,?,?,?,?);";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, order.getUserid());
            ps.setFloat(2, order.getTotalprice());
            ps.setInt(3, order.getTotalitem());
            ps.setFloat(4, order.getTotaldiscount());
            ps.setString(5, order.getShipaddress());
            ps.setString(6, order.getPaymentmethod());
            ps.setString(7, order.getCity());
            ps.setString(8, order.getState());
            ps.setInt(9, order.getZip());
            ps.setString(10, order.getCountry());
            ps.setString(11, order.getOrderid());
            int s = ps.executeUpdate();
            if (s == 1) {
                success = true;
                System.out.println("Done");
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//     get order by user id

    public List<Order> getAllOrderByUserid(int userid) {
        List<Order> olist = new ArrayList<>();
        try {
            String query = "select * from ordertable where userid=? order by dateoforder ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                String orderid = set.getString("orderid");
                float totalprice = set.getFloat("totalprice");
                int totalitem = set.getInt("totalitem");
                float totaldiscount = set.getFloat("totaldiscount");
                Timestamp dateoforder = set.getTimestamp("dateoforder");
                Timestamp expecteddate = set.getTimestamp("dateoforder");
                String shipaddress = set.getString("shipaddress");
                String paymentmethod = set.getString("paymentmethod");
                String status = set.getString("status");
                String state = set.getString("state");
                String city = set.getString("city");
                int zip = set.getInt("zip");
                String country = set.getString("country");
                Order order = new Order(orderid, userid, totalprice, totalitem, totaldiscount, dateoforder, expecteddate, shipaddress, paymentmethod, status, city, state, zip, country);
                olist.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return olist;
    }

    //     get order having status  not delivered for current user;
    public List<Order> getAllOrderPanding(String notdelivered, int userid) {
        List<Order> olist = new ArrayList<>();
        try {
            String query = "select * from ordertable where status=? and userid=? order by dateoforder ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, notdelivered.trim());
            ps.setInt(2, userid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                String orderid = set.getString("orderid");
                userid = set.getInt("userid");
                float totalprice = set.getFloat("totalprice");
                int totalitem = set.getInt("totalitem");
                float totaldiscount = set.getFloat("totaldiscount");
                Timestamp dateoforder = set.getTimestamp("dateoforder");
                Timestamp expecteddate = set.getTimestamp("dateoforder");
                String shipaddress = set.getString("shipaddress");
                String paymentmethod = set.getString("paymentmethod");
                String status = set.getString("status");
                String state = set.getString("state");
                String city = set.getString("city");
                int zip = set.getInt("zip");
                String country = set.getString("country");
                Order order = new Order(orderid, userid, totalprice, totalitem, totaldiscount, dateoforder, expecteddate, shipaddress, paymentmethod, status, city, state, zip, country);
                olist.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return olist;
    }

    //count pending orders
    public int countPendingOrders() {
        int count = 0;
        try {
            String query = "select count(orderid) from ordertable where status=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1,"not delivered");
            ResultSet set = ps.executeQuery();
            if(set.next()){
              count=set.getInt(1);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }

    //     get order having status  not delivered  for admin;
    public List<Order> getAllOrderPanding(String notdelivered, int limit, int offset) {
        List<Order> olist = new ArrayList<>();
        try {
            String query = "select * from ordertable where status=? limit ? offset ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, notdelivered.trim());
            ps.setInt(2, limit);
            ps.setInt(3, offset);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                String orderid = set.getString("orderid");
                int userid = set.getInt("userid");
                float totalprice = set.getFloat("totalprice");
                int totalitem = set.getInt("totalitem");
                float totaldiscount = set.getFloat("totaldiscount");
                Timestamp dateoforder = set.getTimestamp("dateoforder");
                Timestamp expecteddate = set.getTimestamp("expecteddate");
                String shipaddress = set.getString("shipaddress");
                String paymentmethod = set.getString("paymentmethod");
                String status = set.getString("status");
                String state = set.getString("state");
                String city = set.getString("city");
                int zip = set.getInt("zip");
                String country = set.getString("country");
                Order order = new Order(orderid, userid, totalprice, totalitem, totaldiscount, dateoforder, expecteddate, shipaddress, paymentmethod, status, city, state, zip, country);
                olist.add(order);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return olist;
    }
//get order by order id

    public Order getOrderByOrderid(String orderid) {
        Order order = null;
        try {
            String query = "select * from ordertable where orderid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, orderid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                orderid = set.getString("orderid");
                int userid = set.getInt("userid");
                float totalprice = set.getFloat("totalprice");
                int totalitem = set.getInt("totalitem");
                float totaldiscount = set.getFloat("totaldiscount");
                Timestamp dateoforder = set.getTimestamp("dateoforder");
                Timestamp expecteddate = set.getTimestamp("dateoforder");
                String shipaddress = set.getString("shipaddress");
                String paymentmethod = set.getString("paymentmethod");
                String status = set.getString("status");
                String state = set.getString("state");
                String city = set.getString("city");
                int zip = set.getInt("zip");
                String country = set.getString("country");
                order = new Order(orderid, userid, totalprice, totalitem, totaldiscount, dateoforder, expecteddate, shipaddress, paymentmethod, status, city, state, zip, country);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return order;
    }
//  //    get list order product by order id and product id

    public List<OrderProduct> getOrderProductByOrderid(String orderid) {
        List<OrderProduct> oplist = new ArrayList<>();
        try {
            String query = "select * from orderproduct where orderid=? order by productname ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, orderid);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                orderid = set.getString("orderid");
                int productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productdescription = set.getString("productdescription");
                float productprice = set.getFloat("productprice");
                int categoryid = set.getInt("categoryid");
                int quantity = set.getInt("quantity");
                String productcategory = set.getString("productcategory");
                String productimage = set.getString("productimage");
                float productdiscount = set.getFloat("productdiscount");
                float netprice = set.getFloat("netprice");
                OrderProduct op = new OrderProduct(productid, productdiscount, netprice,
                        productcategory, orderid, productname, productdescription,
                        productprice, quantity, categoryid, productimage);
                oplist.add(op);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return oplist;
    }
//    get order product by order id and product id

    public OrderProduct getOrderProductByOrderidAndProductid(String orderid, int productid) {
        OrderProduct op = null;
        try {
            String query = "select * from orderproduct where orderid=? and productid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, orderid);
            ps.setInt(2, productid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                orderid = set.getString("orderid");
                productid = set.getInt("productid");
                String productname = set.getString("productname");
                String productdescription = set.getString("productdescription");
                float productprice = set.getFloat("productprice");
                int categoryid = set.getInt("categoryid");
                int quantity = set.getInt("quantity");
                String productcategory = set.getString("productcategory");
                String productimage = set.getString("productimage");
                float productdiscount = set.getFloat("productdiscount");
                float netprice = set.getFloat("netprice");
                op = new OrderProduct(productid, productdiscount, netprice,
                        productcategory, orderid, productname, productdescription,
                        productprice, quantity, categoryid, productimage);
                return op;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return op;
    }
//    update order details by order id

    public void updateOrderByOrderid(String orderid, Timestamp expdate, String status) {

        success = false;
        try {
            String query = "update ordertable set expecteddate=? , status=? where orderid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setTimestamp(1, expdate);
            ps.setString(2, status);
            ps.setString(3, orderid);
            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    //    count total order by order id
    public int countTotalOrderByYearMonth(int month, int year) {
        int count = 0;
        try {
            String query = "select count(orderid) from ordertable where month(dateoforder)=? and year(dateoforder)=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                count = set.getInt(1);
                return count;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return count;
    }
//  get orderid by month and year

    public List<String> getAllOrderByMonthYear(int month, int year) {
        List<String> olist = new ArrayList<>();
        try {
            String query = "select orderid from ordertable where month(dateoforder)=? and year(dateoforder)=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, month);
            ps.setInt(2, year);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                String orderid = set.getString("orderid");
                olist.add(orderid);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return olist;
    }
}
