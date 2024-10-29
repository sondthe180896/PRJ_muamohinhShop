package dal;

import java.util.ArrayList;
import java.util.List;
import java.sql.*;
import model.Order;
import model.OrderItem;

public class OrderDAO extends DBContext {

    public int createOrder(Order order) {
        String sql = "INSERT INTO Orders (user_id, total_price, status) VALUES (?, ?, ?)";
        int orderId = -1;

        try (PreparedStatement st = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS)) {
            st.setInt(1, order.getUserId());
            st.setDouble(2, order.getTotalPrice());
            st.setString(3, order.getStatus());
            st.executeUpdate();

            try (ResultSet generatedKeys = st.getGeneratedKeys()) {
                if (generatedKeys.next()) {
                    orderId = generatedKeys.getInt(1);
                } else {
                    throw new SQLException("Creating order failed, no ID obtained.");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orderId;
    }

    public void createOrderItems(int orderId, List<OrderItem> items) {
        String sql = "INSERT INTO OrderItem (order_id, product_id, quantity, price) VALUES (?, ?, ?, ?)";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            for (OrderItem item : items) {
                st.setInt(1, orderId);
                st.setInt(2, item.getProductId());
                st.setInt(3, item.getQuantity());
                st.setDouble(4, item.getPrice());
                st.addBatch();
            }
            st.executeBatch();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public List<Order> getAllOrders() {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders";

        try (PreparedStatement st = connection.prepareStatement(sql); ResultSet rs = st.executeQuery()) {

            while (rs.next()) {
                Order order = new Order();
                order.setId(rs.getInt("id"));
                order.setUserId(rs.getInt("user_id"));
                order.setTotalPrice(rs.getInt("total_price"));
                order.setOrderDate(rs.getTimestamp("order_date"));
                order.setStatus(rs.getString("status"));
                orders.add(order);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public Order getOrderById(int orderId) {
        String sql = "SELECT * FROM Orders WHERE id = ?";
        Order order = null;

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, orderId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setTotalPrice(rs.getInt("total_price"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("status"));

                    // Optionally, you can load order items here
                    // order.setItems(getOrderItems(orderId));
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return order;
    }

    public List<Order> getOrdersByUserId(int userId) {
        List<Order> orders = new ArrayList<>();
        String sql = "SELECT * FROM Orders WHERE user_id = ? ORDER BY order_date DESC";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                while (rs.next()) {
                    Order order = new Order();
                    order.setId(rs.getInt("id"));
                    order.setUserId(rs.getInt("user_id"));
                    order.setTotalPrice(rs.getInt("total_price"));
                    order.setOrderDate(rs.getTimestamp("order_date"));
                    order.setStatus(rs.getString("status"));
                    orders.add(order);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }

        return orders;
    }

    public void updateOrder(Order order) {
        String sql = "UPDATE Orders SET user_id = ?, total_price = ?, order_date = ?, status = ? WHERE id = ?";

        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, order.getUserId());
            st.setDouble(2, order.getTotalPrice());
            st.setTimestamp(3, order.getOrderDate());
            st.setString(4, order.getStatus());
            st.setInt(5, order.getId());
            st.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public boolean deleteOrder(int orderId) {
    String deletePaymentInfoSql = "DELETE FROM payment_info WHERE order_id = ?";
    String deleteOrderItemsSql = "DELETE FROM OrderItem WHERE order_id = ?";
    String deleteOrderSql = "DELETE FROM Orders WHERE id = ?";
    
    try {
        connection.setAutoCommit(false);  // Bắt đầu giao dịch
        
        try (
            PreparedStatement deletePaymentInfo = connection.prepareStatement(deletePaymentInfoSql);
            PreparedStatement deleteOrderItems = connection.prepareStatement(deleteOrderItemsSql);
            PreparedStatement deleteOrder = connection.prepareStatement(deleteOrderSql)
        ) {
            // Xóa thông tin thanh toán
            deletePaymentInfo.setInt(1, orderId);
            deletePaymentInfo.executeUpdate();
            
            // Xóa các mục trong đơn hàng
            deleteOrderItems.setInt(1, orderId);
            deleteOrderItems.executeUpdate();
            
            // Xóa đơn hàng
            deleteOrder.setInt(1, orderId);
            int affectedRows = deleteOrder.executeUpdate();
            
            connection.commit();  // Hoàn tất giao dịch
            return affectedRows > 0;
        } catch (SQLException e) {
            connection.rollback();  // Hoàn tác nếu có lỗi
            throw e;  // Ném lại ngoại lệ
        }
    } catch (SQLException e) {
        e.printStackTrace();
        return false;
    } finally {
        try {
            connection.setAutoCommit(true);  // Đặt lại chế độ tự động commit
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}

    public int getUserRole(int userId) {
        String sql = "SELECT role FROM account WHERE id = ?";
        try (PreparedStatement st = connection.prepareStatement(sql)) {
            st.setInt(1, userId);
            try (ResultSet rs = st.executeQuery()) {
                if (rs.next()) {
                    return rs.getInt("role");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return -1; // Return -1 if role not found or error occurred
    }
    public List<Order> getOrdersBasedOnRole(int userId) {
    int userRole = getUserRole(userId);
    if (userRole == 1) {
        return getAllOrders(); // Admin can see all orders
    } else {
        return getOrdersByUserId(userId); // Regular users see only their orders
    }
}
    public List<OrderItem> getOrderItems(int orderId) {
    List<OrderItem> items = new ArrayList<>();
    String sql = "SELECT * FROM OrderItem WHERE order_id = ?";

    try (PreparedStatement st = connection.prepareStatement(sql)) {
        st.setInt(1, orderId);
        try (ResultSet rs = st.executeQuery()) {
            while (rs.next()) {
                OrderItem item = new OrderItem();
                item.setId(rs.getInt("id"));
                item.setOrderId(rs.getInt("order_id"));
                item.setProductId(rs.getInt("product_id"));
                item.setQuantity(rs.getInt("quantity"));
                item.setPrice(rs.getDouble("price"));
                items.add(item);
            }
        }
    } catch (SQLException e) {
        e.printStackTrace();
    }

    return items;
}
    public static void main(String[] args) {
        OrderDAO dao = new OrderDAO();
        List<Order> orderByUser = dao.getOrdersBasedOnRole(5);
        for (Order order : orderByUser) {
            System.out.println(order);
        }
        
    }

}
