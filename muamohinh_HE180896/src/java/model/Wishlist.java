package model;

import java.util.ArrayList;
import java.util.List;

public class Wishlist {
    private List<Product> products;

    public Wishlist() {
        this.products = new ArrayList<>();
    }

    public void addProduct(Product product) {
        products.add(product);
    }

    public void removeProduct(int productId) {
        products.removeIf(product -> product.getId() == productId);
    }

    public List<Product> getProducts() {
        return products;
    }
}