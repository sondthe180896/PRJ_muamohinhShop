/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

public class PaymentInfo {
    private int orderId;
    private String name;
    private String address;
    private String phone;

    // Constructors
    public PaymentInfo() {
    }

    public PaymentInfo(int orderId, String name, String address, String phone) {
        this.orderId = orderId;
        this.name = name;
        this.address = address;
        this.phone = phone;
    }

    // Getters and setters
    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "PaymentInfo{" + "orderId=" + orderId + ", name=" + name + ", address=" + address + ", phone=" + phone + '}';
    }
    
}
