package com.oss.dao;

import com.oss.entities.User;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class UserDao {

    private Connection con;
    private boolean success;

    public boolean isSuccess() {
        return success;
    }

    public UserDao(Connection con) {
        this.con = con;
    }

    public boolean registerUser(User user) {
        success = false;
        int count = searchUserByEmail(user.getUseremail());
        if (count != 0) {
            success = false;
            return success;
        }
        try {
            //user ----------> database
            String query = "insert into user(username,userpassword,useremail,address,phone) values(?,?,?,?,?)";
            String username = user.getUsername();
            String userpassword = user.getUserpassword();
            String useremail = user.getUseremail();
            String address = user.getAddress();
            String phone = user.getPhone();
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, username);
            ps.setString(2, userpassword);
            ps.setString(3, useremail);
            ps.setString(4, address);
            ps.setString(5, phone);
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

    public User getUserByEmailAndPassword(String email, String password) {
        User user = null;
        success = false;
        try {
            //database ------> User
            String query = "select * from User where useremail=? and userpassword=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, password);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();
                user.setUserid(set.getInt("userid"));
                user.setUsername(set.getString("username"));
                user.setUserpassword(set.getString("userpassword"));
                user.setUseremail(set.getString("useremail"));
                user.setUsertype(set.getString("usertype"));
                user.setAddress(set.getString("address"));
                user.setPhone(set.getString("phone"));
                user.setUserimage(set.getString("userimage"));
                success = true;
                System.out.println("done" + user.getAddress());
                return user;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return user;
    }

    public int searchUserByEmail(String email) {
        int count = 0;
        try {
            //database ------> User
            String query = "select * from User where useremail=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                count++;
            }
            return count;
        } catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
    }

    public void updateUserByUserid(User user) {
        success = false;
        try {
            String query = "update user set useremail=? , phone=? , address=? where userid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getUseremail());
            ps.setString(2, user.getPhone());
            ps.setString(3, user.getAddress());
            ps.setInt(4, user.getUserid());
            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
//    for implementing forgot password
    public void updateUserPasswordByUserid(User user) {
        success = false;
        try {
            String query = "update user set useremail=? ,userpassword=? where userid=?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, user.getUseremail());
            ps.setString(2, user.getUserpassword());
            ps.setInt(3, user.getUserid());
            int i = ps.executeUpdate();
            if (i == 1) {
                success = true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public int countUsers() {
        int count = 0;
        try {
            String query = "select * from User";
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

    public String getUsernameByid(int userid) {
        String name = "";
        try {
            String query = "select username from User where userid=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setInt(1, userid);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                name = set.getString("username");
                return name;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return name;
    }

    public List<User> getAllUser(String usertype) {
        User user = null;
        List<User> userlist = new ArrayList<>();
        try {
            //database ------> User
            String query = "select * from User where usertype = ? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, usertype);
            ResultSet set = ps.executeQuery();
            while (set.next()) {
                user = new User();
                user.setUserid(set.getInt("userid"));
                user.setUsername(set.getString("username"));
                user.setUseremail(set.getString("useremail"));
                user.setAddress(set.getString("address"));
                user.setPhone(set.getString("phone"));
                user.setUserimage(set.getString("userimage"));
                userlist.add(user);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return userlist;
    }

//    for implementing  forgot password task
    public User getUserByEmail(String email) {
        User user = null;
        try {
            //database ------> User
            String query = "select * from User where useremail=? ;";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, email);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user=new User();
                user.setUserid(set.getInt("userid"));
                user.setUsername(set.getString("username"));
                user.setUseremail(set.getString("useremail"));
                user.setAddress(set.getString("address"));
                user.setPhone(set.getString("phone"));
                System.out.println("user  found 191 line success");
            }
        } catch (Exception e) {
            System.out.println("user not found 193 line error");
            e.printStackTrace();
        }
        return user;

    }

}
