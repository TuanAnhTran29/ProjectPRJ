/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package model;

/**
 *
 * @author tuana
 */
public class Order {
    private int orderID;
    private int userID;
    private String orderStatus;
    private String orderDate;
    private String serveDate;
    private float totalPrice;
    private int servantID;

    public Order() {
    }

    public Order(int orderID, int userID, String orderStatus, String orderDate, String serveDate,float totalPrice, int servantID) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.serveDate = serveDate;
        this.totalPrice= totalPrice;
        this.servantID= servantID;
    }

    public Order(int userID, String orderStatus, String orderDate, String serveDate,float totalPrice, int servantID) {
        this.userID = userID;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.serveDate = serveDate;
        this.totalPrice= totalPrice;
        this.servantID= servantID;
    }

    public Order(int orderID, int userID, String orderStatus, String orderDate, String serveDate) {
        this.orderID = orderID;
        this.userID = userID;
        this.orderStatus = orderStatus;
        this.orderDate = orderDate;
        this.serveDate = serveDate;
    }
    
    
    

    public int getOrderID() {
        return orderID;
    }

    public void setOrderID(int orderID) {
        this.orderID = orderID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getOrderStatus() {
        return orderStatus;
    }

    public void setOrderStatus(String orderStatus) {
        this.orderStatus = orderStatus;
    }

    public String getOrderDate() {
        return orderDate;
    }

    public void setOrderDate(String orderDate) {
        this.orderDate = orderDate;
    }

    public String getServeDate() {
        return serveDate;
    }

    public void setServeDate(String serveDate) {
        this.serveDate = serveDate;
    }

    public float getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(float totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getServantID() {
        return servantID;
    }

    public void setServantID(int servantID) {
        this.servantID = servantID;
    }
    
    
    
}
