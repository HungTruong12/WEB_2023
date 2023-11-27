package model;

import java.util.ArrayList;

public class Cart {

    private int id;
    private int totalItem;
    private ArrayList<CartItem> a;
    private User u;

    public Cart(int id, int totalItem, ArrayList<CartItem> a, User u) {
        this.id = id;
        this.totalItem = totalItem;
        this.a = a;
        this.u = u;
    }

    public int getId() {
        return id;
    }

    public int getTotalItem() {
        return totalItem;
    }

    public ArrayList<CartItem> getA() {
        return a;
    }

    public User getU() {
        return u;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setTotalItem(int totalItem) {
        this.totalItem = totalItem;
    }

    public void setA(ArrayList<CartItem> a) {
        this.a = a;
    }

    public void setU(User u) {
        this.u = u;
    }
    
}