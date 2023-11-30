/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import java.sql.PreparedStatement;
import java.sql.*;
import model.Category;

/**
 *
 * @author ADMIN
 */
public class CategoryDAO extends DBContext{
    
    public Category getCategory(int id){
        try {
            String sql = "SELECT * FROM WHERE id = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, id);
            ResultSet rs = ps.executeQuery();
            if(rs.next())
                return new Category(rs.getInt("id"), rs.getString("nameCate"), rs.getString("des"));
        } catch (Exception e) {
        }
        return null;
    }
}
