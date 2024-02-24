package com.db;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBConnect {
    private static Connection conn;

    public static Connection getConn() {
        try {
        	
        	Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3307/airline_ticket", "root","");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
            System.err.println("MySQL JDBC driver not found");
        } catch (SQLException e) {
            e.printStackTrace();
            System.err.println("Error connecting to the database");
        }
        return conn;
    }
}
