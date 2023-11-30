/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import model.Shipment;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
/**
 *
 * @author ADMIN
 */
public class ShipmentDAO extends DBContext{
    public Shipment getShipmentOfOrder(int idOrder){
        try {
            String sql = "SELECT * FROM Shipment idOrder = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, idOrder);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                return new Shipment(rs.getInt("id"),
                        rs.getString("name"), 
                        rs.getString("email"), 
                        rs.getString("phone"), 
                        rs.getString("city"), 
                        rs.getString("district"), 
                        rs.getString("addressDetail"), 
                        rs.getInt("price"), 
                        rs.getString("note"));
            }
        } catch (Exception e) {
        }
        return null;
    }
}
