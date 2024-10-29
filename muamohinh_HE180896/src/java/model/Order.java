/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author hihihihaha
 */


import java.sql.Timestamp;
import java.util.List;

public class Order {
    private int id;
    private int userId;
    private int totalPrice;
    private Timestamp orderDate;
    private String status;
    private List<OrderItem> items;

    // Constructors, getters, and setters

    public Order() {
    }

    public Order(int id, int userId, int totalPrice, Timestamp orderDate, String status, List<OrderItem> items) {
        this.id = id;
        this.userId = userId;
        this.totalPrice = totalPrice;
        this.orderDate = orderDate;
        this.status = status;
        this.items = items;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(int totalPrice) {
        this.totalPrice = totalPrice;
    }

    public Timestamp getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(Timestamp orderDate) {
        this.orderDate = orderDate;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public List<OrderItem> getItems() {
        return items;
    }

    public void setItems(List<OrderItem> items) {
        this.items = items;
    }

    @Override
    public String toString() {
        return "Order{" + "id=" + id + ", userId=" + userId + ", totalPrice=" + totalPrice + ", orderDate=" + orderDate + ", status=" + status + ", items=" + items + '}';
    }
    
}