package com.oss.helper;

import java.sql.Connection;
import java.sql.DriverManager;
public class ConnectionProvider {

    private static Connection con;

    public static Connection getConnection() {
        try {
            if (con == null) {
                //driver load
                Class.forName("com.mysql.cj.jdbc.Driver");
                //connection estb
                con = DriverManager.getConnection("jdbc:mysql://localhost:3306/onlineshoppingsite", "root", "root");
            }
            System.out.println("connection is successfull");
        } catch (Exception e) {
            System.out.println("connection is unsuccessfull");
            e.printStackTrace();
        }
        return con;
    }
}
