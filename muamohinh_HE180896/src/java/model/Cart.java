package model;

import java.util.ArrayList;
import java.util.List;

public class Cart {
    private List<CartItem> items;
    
    public Cart() {
        items = new ArrayList<>();
    }
    
    public void addItem(Product product, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == product.getId()) {
                item.setQuantity(item.getQuantity() + quantity);
                return;
            }
        }
        items.add(new CartItem(product, quantity));
    }
    
    public void removeItem(int productId) {
        items.removeIf(item -> item.getProduct().getId() == productId);
    }
    
    public void updateQuantity(int productId, int quantity) {
        for (CartItem item : items) {
            if (item.getProduct().getId() == productId) {
                item.setQuantity(quantity);
                return;
            }
        }
    }
    
    public List<CartItem> getItems() {
        return items;
    }
    
    public int getTotalPrice() {
    double totalPrice = items.stream()
                             .mapToDouble(item -> item.getProduct().getPrice() * item.getQuantity())
                             .sum();
    return (int) totalPrice; // Convert double to int
}

    
    public int getTotalQuantity() {
        return items.stream().mapToInt(CartItem::getQuantity).sum();
    }
}