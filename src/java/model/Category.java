package model;

import java.util.ArrayList;

public class Category {

    private int id;
    private String nameCate;
    private String des;
    private ArrayList<Product> list;

    public Category(int id, String nameCate, String des) {
        this.id = id;
        this.nameCate = nameCate;
        this.des = des;
    }

    public int getId() {
        return id;
    }

    public String getNameCate() {
        return nameCate;
    }

    public String getDes() {
        return des;
    }

    public ArrayList<Product> getList() {
        return list;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setNameCate(String nameCate) {
        this.nameCate = nameCate;
    }

    public void setDes(String des) {
        this.des = des;
    }

    public void setList(ArrayList<Product> list) {
        this.list = list;
    }
    
}