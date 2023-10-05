/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Order_Food {
    private int orderID;
    private int foodID;
    private int quantity;
    private float list_price;

    public Order_Food(int orderID, int foodID, int quantity, float list_price) {
        this.orderID = orderID;
        this.foodID = foodID;
        this.quantity = quantity;
        this.list_price = list_price;
    }

    public Order_Food(int foodID, int quantity, float list_price) {
        this.foodID = foodID;
        this.quantity = quantity;
        this.list_price = list_price;
    }
    
    

    public Order_Food() {
    }

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getFoodID() {
        return foodID;
    }

    public void setFoodID(int foodID) {
        this.foodID = foodID;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public float getList_price() {
        return list_price;
    }

    public void setList_price(float list_price) {
        this.list_price = list_price;
    }
    
    
}
