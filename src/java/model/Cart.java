package model;

import java.util.ArrayList;

public class Cart {

    private int id;
    private ArrayList<CartItem> a;
    private User u;

    public Cart(int id, ArrayList<CartItem> a, User u) {
        this.id = id;
        this.a = a;
        this.u = u;
    }

    public Cart() {
    }

    public int getId() {
        return id;
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


    public void setA(ArrayList<CartItem> a) {
        this.a = a;
    }

    public void setU(User u) {
        this.u = u;
    }
    
}