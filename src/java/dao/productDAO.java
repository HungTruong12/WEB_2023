package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.Product;
import model.User;

/**
 *
 * @author 84961
 */
public class productDAO extends DBContext{
    
    
    public boolean addProduct(Product product){
        try{
            String sql = "INSERT INTO product(id, idCate, name, price, image, quantity) VALUES(?,?,?,?,?,?)";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1,product.getId());
            ps.setInt(2,product.getCate().getId());
            ps.setString(3, product.getName());
            ps.setInt(4, product.getPrice());
            ps.setString(5, product.getImage());
            ps.setInt(6, product.getQuantity());
            ps.executeUpdate();
            return true;
        }catch(Exception e){
            e.printStackTrace();
        }
        return false;
    }
    public boolean deleteProduct(String id){
        try{
            String insert = "DELETE FROM product WHERE id = ?";
            PreparedStatement ps = c.prepareStatement(insert);
            ps.setString(1, id);
            ps.executeUpdate();
            return true;
        } catch(Exception e) {
            e.printStackTrace();
        }
        
        return false;
    }
    public Product selectProduct(String id) {
        try{
            String query = "SELECT * FROM product WHERE id = ?";
            PreparedStatement ps = c.prepareStatement(query);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                Product product = new Product(
                    rs.getString("id"),
                    rs.getString("name"),
                    rs.getInt("price"),
                    rs.getString("image"),
                    rs.getInt("quantity"),
                    new CategoryDAO().getCategory(rs.getInt("idCate"))
                );
                return product;
            } 
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public boolean updateProduct(Product a) {
        try{
            String update = "UPDATE product SET name=?, price=?, quantity = ?, image=?, idCate = ? WHERE id=?";
            PreparedStatement ps = c.prepareStatement(update);
            ps.setString(1, a.getName());
            ps.setInt(2, a.getPrice());
            ps.setInt(3, a.getQuantity());
            ps.setString(4, a.getImage());
            ps.setInt(5, a.getCate().getId());
            ps.setString(6, a.getId());
            ps.executeUpdate();
            return true;
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }
//    private ArrayList<Product> products;
    public ArrayList<Product> getProduct(){
        ArrayList<Product> products = new ArrayList<>();
            try {
                String select = "SELECT * FROM product";
                PreparedStatement ps=c.prepareStatement(select);
                ResultSet rs = ps.executeQuery();
                while (rs.next()){
                    products.add(
                        new Product(rs.getString("id"), rs.getString("name"), rs.getInt("price"),rs.getString("image"), rs.getInt("quantity"), new CategoryDAO().getCategory(rs.getInt("idCate"))
                    ));
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
        return products;
    }
    
    public ArrayList<Product> getProductByName(String name){
        ArrayList<Product> products = new ArrayList<>();
        try {
            String sql = "SELECT * FROM product where LOWER(name) LIKE ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, "%" + name.toLowerCase() + "%");
            ResultSet rs = ps.executeQuery();
            while (rs.next()){
                products.add(
                    new Product(rs.getString("id"), rs.getString("name"), rs.getInt("price"),rs.getString("image"), rs.getInt("quantity"), new CategoryDAO().getCategory(rs.getInt("idCate"))
                ));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return products;
    }
}