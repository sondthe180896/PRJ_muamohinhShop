/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package dal;

import model.PaymentInfo;
import java.util.ArrayList;
import java.util.List;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author hihihihaha
 */
public class PaymentInfoDAO extends DBContext {

    public void savePaymentInfo(PaymentInfo paymentInfo) {
        String sql = "INSERT INTO payment_info (order_id, name, address, phone) VALUES (?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, paymentInfo.getOrderId());
            st.setString(2, paymentInfo.getName());
            st.setString(3, paymentInfo.getAddress());
            st.setString(4, paymentInfo.getPhone());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public PaymentInfo getPaymentInfoByOrderId(int orderId) {
        PaymentInfo paymentInfo = null;
        String sql = "SELECT * FROM payment_info WHERE order_id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    paymentInfo = new PaymentInfo();
                    paymentInfo.setOrderId(rs.getInt("order_id"));
                    paymentInfo.setName(rs.getString("name"));
                    paymentInfo.setAddress(rs.getString("address"));
                    paymentInfo.setPhone(rs.getString("phone"));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return paymentInfo;
    }

    public boolean deletePaymentInfo(int orderId) {
        String sql = "DELETE FROM payment_info WHERE order_id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            int affectedRows = st.executeUpdate();
            return affectedRows > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
