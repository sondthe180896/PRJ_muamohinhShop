package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;

import model.Category;

public class CategoryDAO extends DBContext {
        
//    public ;
    
    public List<Category> getAllCategories() {
        List<Category> categories = new ArrayList<>();
        String sql = "SELECT * FROM Category";
        
        try (PreparedStatement st = connection.prepareStatement(sql);
             ResultSet rs = st.executeQuery()) {
            
            while (rs.next()) {
                Category c = new Category();
                c.setCid(rs.getInt("cid"));
                c.setCname(rs.getString("cname"));
                categories.add(c);
            }
        } catch (SQLException e) {
            // Consider logging the exception instead of printing stack trace
            e.printStackTrace();
        }
        
        return categories;
    }
    

    public static void main(String[] args) {
        CategoryDAO dao = new CategoryDAO();
        List<Category> categories = dao.getAllCategories();
        
        for (Category c : categories) {
            System.out.println(c.getCid() + ": " + c.getCname());
        }
    }
}
