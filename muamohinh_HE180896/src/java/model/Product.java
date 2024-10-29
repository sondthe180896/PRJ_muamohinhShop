package model;

public class Product {
    private int id;
    private String name;
    private String brand;
    private String scale;
    private double price;
    private int stock;
    private String description;
    private String image;
    private String title;
    private int cateID;

    public Product() {
    }

    public Product(String name, String brand, String scale, double price, int stock, String description, String image, String title, int cateID) {
        this.name = name;
        this.brand = brand;
        this.scale = scale;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.image = image;
        this.title = title;
        this.cateID = cateID;
    }

    
    public Product(int id, String name, String brand, String scale, double price, int stock, 
                   String description, String image, String title, int cateID) {
        this.id = id;
        this.name = name;
        this.brand = brand;
        this.scale = scale;
        this.price = price;
        this.stock = stock;
        this.description = description;
        this.image = image;
        this.title = title;
        this.cateID = cateID;
    }

    // Getters and setters for all fields
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getScale() {
        return scale;
    }

    public void setScale(String scale) {
        this.scale = scale;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public int getCateID() {
        return cateID;
    }

    public void setCateID(int cateID) {
        this.cateID = cateID;
    }

    @Override
    public String toString() {
        return "Product{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", brand='" + brand + '\'' +
                ", scale='" + scale + '\'' +
                ", price=" + price +
                ", stock=" + stock +
                ", description='" + description + '\'' +
                ", image='" + image + '\'' +
                ", title='" + title + '\'' +
                ", cateID=" + cateID +
                '}';
    }
}