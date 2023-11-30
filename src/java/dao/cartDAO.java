/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dao;

import static dao.DBContext.c;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Cart;
import model.CartItem;
import model.Product;
import model.User;

/**
 *
 * @author ADMIN
 */
public class cartDAO extends DBContext{
    
    public void addCart(int idUser){
        try {
            String sql = "INSERT INTO Cart (idUser) VALUES (?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, idUser);
            ps.execute();
        } catch (Exception e) {
        }
    }
    public boolean addCartItem(int idCart, CartItem cartItem){
        try {
            String sql = "INSERT INTO CartItem (idCart, idProduct, quantity) values (?,?,?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, idCart);
            ps.setString(2, cartItem.getProduct().getId());
            ps.setInt(3, cartItem.getQuantity());
            ps.executeUpdate();

            ResultSet generatedKeys = ps.getGeneratedKeys();
            if(generatedKeys.next())
                cartItem.setId(generatedKeys.getInt(1));
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean removeCartItem(int idCartItem){
        try {
            String sql = "DELETE FROM CartItem WHERE id = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, idCartItem);
            ps.execute();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public boolean UpdateCartItem(int idCartItem, int quantity){
        try {
            String sql = "UPDATE CartItem SET quantity = ? WHERE id = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, quantity);
            ps.setInt(2, idCartItem);
            ps.execute();
            return true;
        } catch (Exception e) {
        }
        return false;
    }
    
    public ArrayList<CartItem> getAllCartItem(Cart cart){
        ArrayList<CartItem> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM CartItem WHERE idCart = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setInt(1, cart.getId());
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.add(new CartItem(rs.getInt("id"), rs.getInt("quantity"), new productDAO().selectProduct(rs.getString("idProduct"))));
            }
        } catch (Exception e) {
        }
        return a;
    }
    
    public static void main(String[] args) {
        Cart cart = new Cart();
        cart.setId(1);
        for(CartItem x : new cartDAO().getAllCartItem(cart)){
            System.out.println(x.getProduct().getPrice());
        }
    }
}
