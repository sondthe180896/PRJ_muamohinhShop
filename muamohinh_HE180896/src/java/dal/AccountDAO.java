/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.account;

/**
 *
 * @author Admin
 */
public class AccountDAO extends DBContext {

    public account getAccountByUsername(String username) {
        account a = new account();
        String sql = "Select * FROM Account\n"
                + "Where Username=?;";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            ResultSet rs = st.executeQuery();
            while (rs.next()) {
                int id = rs.getInt("id");
                String user = rs.getString("username");
                String name = rs.getString("name");
                String password = rs.getString("password");
                String email = rs.getString("email");
                int role = rs.getInt("role");
                a.setId(id);
                a.setPassword(password);
                a.setUsername(user);
                a.setName(name);
                a.setRole(role);
                a.setEmail(email);

            }
        } catch (SQLException e) {
            System.out.println(e);

        }
        return a;
    }

    public List<account> getAllAccount() {
        List<account> account = new ArrayList<>();
        String sql = "SELECT * FROM Account";
        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                account a = new account();
                a.setId(rs.getInt("id"));
                a.setUsername(rs.getString("username"));
                a.setPassword(rs.getString("password"));
                a.setName(rs.getString("name"));
                a.setEmail(rs.getString("email"));
                a.setRole(rs.getInt("role"));

                account.add(a);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return account;
    }

    public account addAccount(String username, String name, String password, String email) {
        String sql = "INSERT INTO Account(username, name, password, email, role) VALUES (?, ?, ?, ?, 2)";

        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, name);
            st.setString(3, password);
            st.setString(4, email);
            int rowsInserted = st.executeUpdate();

            if (rowsInserted > 0) {
                // Retrieve the newly inserted account's ID
                int id = getGeneratedAccountId(username);
                // Create an account object and return it
                account a = new account(id, username, password, name, email, 2);
                return a;
            }
        } catch (SQLException e) {
            System.out.println(e);
        }
        return null;
    }

    // Helper method to retrieve the auto-generated ID for a specific username
    private int getGeneratedAccountId(String username) throws SQLException {
        String sql = "SELECT id FROM Account WHERE username = ?";
        PreparedStatement st = connection.prepareStatement(sql);
        st.setString(1, username);
        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            return rs.getInt("id");
        }
        throw new SQLException("ID could not be retrieved for username: " + username);
    }

    // Other methods omitted for brevity
    public void deleteAccount(String pid) {
        String sql = "DELETE FROM Account where id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public void insertAccount(String username, String password, String name, String email, String role) {
        String sql = "INSERT INTO Account (username, password, name, email, role) VALUES (?, ?, ?, ?, ?)";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, name);
            st.setString(4, email);
            st.setString(5, role); // Sử dụng setString vì role là kiểu String

            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public account getAllAccountbyID(String id) {
        String sql = "SELECT * FROM Account WHERE id = ?";
        account a = null;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setString(1, id);

            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    a = new account();
                    a.setId(rs.getInt("id"));
                    a.setUsername(rs.getString("username"));
                    a.setPassword(rs.getString("password"));
                    a.setName(rs.getString("name"));
                    a.setEmail(rs.getString("email"));
                    a.setRole(rs.getInt("role"));
                }

            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Handle or log the exception
        }

        return a; // Return outside the try-catch block
    }

    public void editAccount(String username, String password, String name, String email, String role, String pid) {
        String sql = "UPDATE Account SET username = ?, password = ?, name = ?, email = ?, role = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, username);
            st.setString(2, password);
            st.setString(3, name);
            st.setString(4, email);
            st.setString(5, role);
            st.setString(6, pid);
            st.executeUpdate();
        } catch (SQLException e) {
            System.out.println(e);
        }
    }

    public boolean updatePassword(int userId, String newPassword) {
        String sql = "UPDATE Account SET password = ? WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setString(1, newPassword);
            st.setInt(2, userId);

            int affectedRows = st.executeUpdate();
            System.out.println("Rows affected: " + affectedRows); // Thêm dòng này để ghi log
            return affectedRows > 0;
        } catch (SQLException e) {
            System.out.println("Error updating password: " + e.getMessage());
            return false;
        }
    }

    // Phương thức để kiểm tra mật khẩu hiện tại
    public boolean checkCurrentPassword(int userId, String currentPassword) {
        String sql = "SELECT password FROM Account WHERE id = ?";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            st.setInt(1, userId);
            ResultSet rs = st.executeQuery();
            if (rs.next()) {
                String storedPassword = rs.getString("password");
                System.out.println("Stored password: " + storedPassword);
                System.out.println("Input password: " + currentPassword);
                return storedPassword.equals(currentPassword);
            }
        } catch (SQLException e) {
            System.out.println("Error checking current password: " + e.getMessage());
        }
        return false;
    }

    public static void main(String[] args) {
        AccountDAO dao = new AccountDAO();
        System.out.println(dao.getAccountByUsername("admin"));
        System.out.println(dao.getAllAccountbyID("4"));
        System.out.println(dao.getAllAccount());
    }
}
