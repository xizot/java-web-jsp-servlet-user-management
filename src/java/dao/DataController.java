/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import db.DBUtils;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.User;

/**
 *
 * @author Admin
 */
public class DataController {
    public  static int addNew(User user) throws ClassNotFoundException, SQLException{
        String sql = "INSERT INTO TBUSER(id,name,email,country) VALUES(?,?,?,?)";
        PreparedStatement ps = DBUtils.PreparedStatement(sql);
        ps.setString(1, user.getId());
        ps.setString(2, user.getName());
        ps.setString(3, user.getEmail());
        ps.setString(4, user.getCountry());
        
        return ps.executeUpdate();
    }
    
     public  static User getUserByID(String id) throws ClassNotFoundException, SQLException{
        User user = null;
        String sql = "SELECT * FROM TBUSER WHERE id = ?";
        PreparedStatement ps = DBUtils.PreparedStatement(sql);
        ps.setString(1, id);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {         
            user = new User(rs.getString("id"), rs.getString("name"), rs.getString("email") ,rs.getString("country"));
        }
        
        return user;
    }
    public  static List<User> getAll() throws ClassNotFoundException, SQLException{
        List<User> users = new ArrayList<>();
        String sql = "SELECT * FROM TBUSER";
        PreparedStatement ps = DBUtils.PreparedStatement(sql);
        ResultSet rs = ps.executeQuery();
        
        while (rs.next()) {         
            
            User user = new User(rs.getString("id"), rs.getString("name"), rs.getString("email") ,rs.getString("country"));
            
            System.out.println(user.getId());      
            System.out.println(user.getName());

            users.add(user);
        }
        
        return users;
    }
    
    
    public static int update(User user) throws ClassNotFoundException, SQLException{
        String sql = "UPDATE TBUSER SET name=?, email=?, country=? WHERE id=?";
        PreparedStatement ps = DBUtils.PreparedStatement(sql);
      
        ps.setString(1, user.getName());
        ps.setString(2, user.getEmail());
        ps.setString(3, user.getCountry());
        ps.setString(4, user.getId());
        
        return ps.executeUpdate();
    }
    
    public static int deleteByID(String id) throws ClassNotFoundException, SQLException{
        String sql = "DELETE FROM TBUSER WHERE id = ?";
        PreparedStatement ps = DBUtils.PreparedStatement(sql);
        ps.setString(1, id);
        
        return ps.executeUpdate();
    }
    
    public static void main(String[] args) throws ClassNotFoundException, SQLException{
        getAll();
    }
}
