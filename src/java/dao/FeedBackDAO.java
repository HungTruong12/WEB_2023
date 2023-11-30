package dao;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import model.FeedBack;
public class FeedBackDAO extends DBContext{
    public ArrayList<FeedBack> getFeedBack(String id){
        ArrayList<FeedBack> a = new ArrayList<>();
        try {
            String sql = "SELECT * FROM idProduct = ?";
            PreparedStatement ps = c.prepareStatement(sql);
            ps.setString(1, id);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                a.add(new FeedBack(rs.getInt("id"), rs.getString("comment"), rs.getInt("rate")));
            }
        } catch (Exception e) {
        }
        return a;
    }
}
