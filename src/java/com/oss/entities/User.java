package com.oss.entities;

/**
 *
 * @author Prashant
 */
public class User {
    private int userid;
    private String username;
    private String userpassword;
    private String useremail;
    private String usertype;
    private String address;
    private String phone;
    private String userimage;

    public User() {
    }

    public User(int userid, String useremail, String address, String phone) {
        this.userid = userid;
        this.useremail = useremail;
        this.address = address;
        this.phone = phone;
    }

    public User(int userid, String username, String userpassword, String useremail, String usertype, String address, String phone, String userimage) {
        this.userid = userid;
        this.username = username;
        this.userpassword = userpassword;
        this.useremail = useremail;
        this.usertype = usertype;
        this.address = address;
        this.phone = phone;
        this.userimage = userimage;
    }
    
    public User(String username, String userpassword, String useremail, String address, String phone) {
        this.username = username;
        this.userpassword = userpassword;
        this.useremail = useremail;
        this.address = address;
        this.phone = phone;
    }
    
    public int getUserid() {
        return userid;
    }

    public void setUserid(int userid) {
        this.userid = userid;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getUserpassword() {
        return userpassword;
    }

    public void setUserpassword(String userpassword) {
        this.userpassword = userpassword;
    }

    public String getUseremail() {
        return useremail;
    }

    public void setUseremail(String useremail) {
        this.useremail = useremail;
    }

    public String getUsertype() {
        return usertype;
    }

    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUserimage() {
        return userimage;
    }

    public void setUserimage(String userimage) {
        this.userimage = userimage;
    }
    
}
