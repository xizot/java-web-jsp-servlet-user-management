/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package db;

import java.sql.*;

/**
 *
 * @author Admin
 */
public class DBUtils {
     public static PreparedStatement PreparedStatement(String sql) throws ClassNotFoundException, SQLException{
        PreparedStatement ps = null;
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//        String url =("jdbc:sqlserver://DESKTOP-8K4SCE8\\\\SQLEXPRESS:1433;databaseName=VKU");
        String user = ("xizot");
        String pass = ("1234");
        String IP = "DESKTOP-IKO3LOH;database=USER_MANAGEMENT";
        String DB_URL = "jdbc:sqlserver://" + IP;
        
        
        Connection con = DriverManager.getConnection(DB_URL, user, pass);
        ps = con.prepareStatement(sql);
        
        return ps; 
    }
}
