package model;

import java.util.ArrayList;

public class CartItem {

    private int id;
    private int quantity;
    private Product product;

    public CartItem(int id, int quantity, Product product) {
        this.id = id;
        this.quantity = quantity;
        this.product = product;
    }

    

    public int getId() {
        return id;
    }

    public int getQuantity() {
        return quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public void setProduct(Product product) {
        this.product = product;
    }

}