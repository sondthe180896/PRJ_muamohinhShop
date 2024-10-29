/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;
import model.Product;

public class ProductDAO extends DBContext {

    public List<Product> getAllProducts() {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product";
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setBrand(rs.getString("brand"));
                p.setScale(rs.getString("scale"));
                p.setPrice(rs.getDouble("price"));
                p.setStock(rs.getInt("stock"));
                p.setDescription(rs.getString("description"));
                p.setImage(rs.getString("image"));
                p.setTitle(rs.getString("title"));
                p.setCateID(rs.getInt("cateID"));
                products.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getAllProductbyCategoryID(String cid) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE cateID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, cid);  // Set the parameter here
            try (ResultSet rs = st.executeQuery()) {  // Execute the query after setting the parameter
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getDouble("price"));
                    p.setTitle(rs.getString("title"));
                    p.setDescription(rs.getString("description"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public Product getAllProductbyID(String id) {
        String sql = "SELECT * FROM Product WHERE id = ?";
        Product p = null;
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, id);  // Set the parameter here
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setBrand(rs.getString("brand"));  // New field
                    p.setScale(rs.getString("scale"));  // New field
                    p.setPrice(rs.getDouble("price"));
                    p.setStock(rs.getInt("stock"));     // New field
                    p.setDescription(rs.getString("description"));
                    p.setImage(rs.getString("image"));
                    p.setTitle(rs.getString("title"));
                    p.setCateID(rs.getInt("cateID"));   // Assuming this field exists
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or log the exception
        }
        return p; // Return outside the try-catch block
    }

    public Product getLatestProduct() {
        String sql = "SELECT TOP 1 * FROM Product ORDER BY id DESC";
        Product p = null;

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            if (rs.next()) {
                p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setImage(rs.getString("image"));
                p.setPrice(rs.getDouble("price"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return p;
    }

    public List<Product> searchByName(String txtSearch) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE name LIKE ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, "%" + txtSearch + "%");
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getDouble("price"));
                    p.setTitle(rs.getString("title"));
                    p.setDescription(rs.getString("description"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public List<Product> getAllProductbySellID(int id) {
        List<Product> products = new ArrayList<>();
        String sql = "SELECT * FROM Product WHERE sel_ID = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, id);  // Set the parameter here
            try (ResultSet rs = st.executeQuery()) {  // Execute the query after setting the parameter
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getDouble("price"));
                    p.setTitle(rs.getString("title"));
                    p.setDescription(rs.getString("description"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return products;
    }

    public void deleteProduct(String pid) {
        String sql = "DELETE FROM Product where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertProduct(String name, String brand, String scale, double price, int stock,
            String description, String image, String title, int cateID) {
        String sql = "INSERT INTO Product (name, brand, scale, price, stock, description, image, title, cateID) "
                + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?)";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setString(2, brand);
            st.setString(3, scale);
            st.setDouble(4, price);
            st.setInt(5, stock);
            st.setString(6, description);
            st.setString(7, image);
            st.setString(8, title);
            st.setInt(9, cateID);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    private int getGeneratedProductId(String name) throws SQLException {
        String sql = "SELECT id FROM Product WHERE name = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, name);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return rs.getInt("id");
        }
        throw new SQLException("ID could not be retrieved for product: " + name);
    }

    public void editProduct(int id, String name, String brand, String scale, double price, int stock,
            String description, String image, String title, int cateID) {
        String sql = "UPDATE Product SET name = ?, brand = ?, scale = ?, price = ?, stock = ?, "
                + "description = ?, image = ?, title = ?, cateID = ? WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, name);
            st.setString(2, brand);
            st.setString(3, scale);
            st.setDouble(4, price);
            st.setInt(5, stock);
            st.setString(6, description);
            st.setString(7, image);
            st.setString(8, title);
            st.setInt(9, cateID);
            st.setInt(10, id);
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public int getTotalProducts() {
        String sql = "SELECT COUNT(*) FROM Product";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                return rs.getInt(1);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return 0;
    }

    public Product getProductById(int productId) {
        String sql = "SELECT * FROM Product WHERE id = ?";
        Product product = null;

        try (PreparedStatement ps = connection.prepareStatement(sql)) {
            ps.setInt(1, productId);
            ResultSet rs = ps.executeQuery();

            if (rs.next()) {
                product = new Product();
                product.setId(rs.getInt("id"));
                product.setName(rs.getString("name"));
                product.setBrand(rs.getString("brand"));
                product.setScale(rs.getString("scale"));
                product.setPrice(rs.getDouble("price"));
                product.setStock(rs.getInt("stock"));
                product.setDescription(rs.getString("description"));
                product.setImage(rs.getString("image"));
                product.setTitle(rs.getString("title"));
                product.setCateID(rs.getInt("cateID"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return product;
    }

    public List<Product> getProductsForPage(int start, int productsPerPage) {
        String sql = "SELECT * FROM Product ORDER BY id OFFSET ? ROWS FETCH NEXT ? ROWS ONLY";
        List<Product> list = new ArrayList<>();
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, start);
            st.setInt(2, productsPerPage);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                Product p = new Product();
                p.setId(rs.getInt("id"));
                p.setName(rs.getString("name"));
                p.setPrice(rs.getDouble("price"));
                p.setImage(rs.getString("image"));
                p.setTitle(rs.getString("title"));
                p.setDescription(rs.getString("description"));
                list.add(p);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return list;
    }

    public List<Product> getAllProductsByPrice(String price1, String price2) {
        String sql = "SELECT * FROM Product WHERE price BETWEEN ? AND ?";
        Product p = null;
        List<Product> list = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, price1);
            st.setString(2, price2);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getDouble("price"));
                    p.setTitle(rs.getString("title"));
                    p.setDescription(rs.getString("description"));
                    list.add(p);
                }
                // Note: No return inside the while loop
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or log the exception
        }

        return list; // Return outside the try-catch block
    }

    public List<Product> getAllProductByBrand(String brand) {
        String sql = "SELECT * FROM Product WHERE Brand = ?";
        Product p = null;
        List<Product> list = new ArrayList<>();

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, brand);  // Set the parameter here

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getDouble("price"));
                    p.setTitle(rs.getString("title"));
                    p.setDescription(rs.getString("description"));
                    list.add(p);
                }
                // Note: No return inside the while loop
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or log the exception
        }

        return list; // Return outside the try-catch block
    }

    public List<Product> getFilteredProducts(String cateID, String brand, int minPrice, int maxPrice) {
        List<Product> products = new ArrayList<>();

        String sql = "SELECT * FROM Product WHERE 1=1";
        if (cateID != null && !cateID.isEmpty()) {
            sql += " AND cateID = ?";
        }
        if (brand != null && !brand.isEmpty()) {
            sql += " AND brand = ?";
        }
        if (minPrice != Integer.MIN_VALUE) {
            sql += " AND price >= ?";
        }
        if (maxPrice != Integer.MAX_VALUE) {
            sql += " AND price <= ?";
        }

        try (PreparedStatement st = connection.prepareStatement(sql)) {

            int paramIndex = 1;
            if (cateID != null && !cateID.isEmpty()) {
                st.setString(paramIndex++, cateID);
            }
            if (brand != null && !brand.isEmpty()) {
                st.setString(paramIndex++, brand);
            }
            if (minPrice != Integer.MIN_VALUE) {
                st.setInt(paramIndex++, minPrice);
            }
            if (maxPrice != Integer.MAX_VALUE) {
                st.setInt(paramIndex++, maxPrice);
            }

            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Product p = new Product();
                    p.setId(rs.getInt("id"));
                    p.setName(rs.getString("name"));
                    p.setImage(rs.getString("image"));
                    p.setPrice(rs.getDouble("price"));
                    p.setTitle(rs.getString("title"));
                    p.setDescription(rs.getString("description"));
                    p.setCateID(rs.getInt("cateID"));
                    products.add(p);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle SQL exception as needed
        }
        return products;
    }

    // Similar methods for updating and deleting products can be added here
    public static void main(String[] args) {
        ProductDAO dao = new ProductDAO();

        List<Product> products = dao.getFilteredProducts("1", "Toyota", Integer.MIN_VALUE, Integer.MAX_VALUE);
        for (Product p : products) {
            System.out.println(p);
        }
        //dao.insertProduct("toyota crown", "toyota", "1:18", 4400000, 12, "xe", "https://product.hstatic.net/1000288177/product/fb23d690d81a07445e0b_1343e51f206242269853514d2b8e4a95_grande.jpg", "xe", 1);
    }
}
