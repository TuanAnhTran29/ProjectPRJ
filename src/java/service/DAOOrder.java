/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import connection.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order;
import model.User;

/**
 *
 * @author tuana
 */
public class DAOOrder extends DBConnect{
    private final String INSERT_TO_ORDER = "INSERT INTO [orders]\n" +
"           ([userID]\n" +
"           ,[orderStatus]\n" +
"           ,[orderDate])\n" +
"     VALUES\n" +
"           (?\n" +
"           ,?\n" +
"           ,?\n)";
    private final String GET_ORDER_BY_ORDER_DATE= "select * from orders where orderDate= ?";
    private final String UPDATE_TOTAL_PRICE= "update orders set total_price= ? where orderDate= ?";
    private final String UPDATE_TOTAL_PRICE_BY_ORDER_ID= "update orders set total_price= ? where orderID= ?";
    private final String GET_ALL_ORDER_BY_USER_ID= "select * from orders where userID= ? AND orderStatus= 'UNDONE' order by orderID desc";
    private final String GET_ALL_ORDER= "select * from orders where orderStatus= 'UNDONE' order by orderID desc";
    private final String GET_ORDER_BY_ID= "select * from orders where orderID= ?";
    private final String DELETE_BY_ORDER_ID= "delete from orders where orderID= ?";
    private final String SERVE_ORDER= "update orders set orderStatus= ?, servantID= ? where orderID= ?";
    private final String GET_ALL_ORDER_ACCEPTED= "select * from orders where orderStatus= 'In progress...' AND servantID= ?";
    private final String SUBMIT_ORDER= "update orders set orderStatus= 'DONE', serveDate= ? where orderID= ?";
    private final String GET_ALL_ORDER_SUBMITTED= "select * from orders where orderStatus= 'DONE' AND servantID= ?";
    private final String GET_ALL_USER_ACCEPTED_ORDER= "select * from orders where orderStatus= 'In progress...' AND userID= ?";
    private final String GET_ALL_USER_SERVED_ORDER= "select * from orders where orderStatus= 'DONE' AND userID= ?";
    
    public void createOrder(int userID,String status, String orderDate){
        try {
            PreparedStatement pre= conn.prepareStatement(INSERT_TO_ORDER);
            pre.setInt(1, userID);
            pre.setString(2, status);
            pre.setString(3,orderDate);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Order findOrderByOrderDate(String date){
        Order order= null;
        try {
            
            PreparedStatement pre= conn.prepareStatement(GET_ORDER_BY_ORDER_DATE);
            pre.setString(1, date);
            
            ResultSet rs= pre.executeQuery();
            while(rs.next()){
                int orderID= rs.getInt(1);
                int userID= rs.getInt(2);
                String status= rs.getString(3);
                String serveDate= rs.getString(5);
                float totalPrice= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                order= new Order(orderID,userID,status,date,serveDate,totalPrice,servantID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return order;
    }
    
    public void updateTotalPrice(double totalPrice, String orderDate){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_TOTAL_PRICE);
            
            pre.setDouble(1, totalPrice);
            pre.setString(2, orderDate);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateTotalPriceByOrderID(double totalPrice, int orderID){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_TOTAL_PRICE_BY_ORDER_ID);
            
            pre.setDouble(1, totalPrice);
            pre.setInt(2, orderID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector findAllOrderByUserID(int userID){
        Vector<Order> vector= new Vector<>();
        
        try {
            PreparedStatement pre= conn.prepareStatement(GET_ALL_ORDER_BY_USER_ID);
            
            pre.setInt(1, userID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float totalPrice= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                vector.add(new Order(orderID,userID, status, orderDate, serveDate, totalPrice, servantID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public Vector<Order> findAllUserOrder(){
        Vector<Order> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(GET_ALL_ORDER);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                int userID= rs.getInt(2);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float total= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                vector.add(new Order(orderID,userID,status,orderDate,serveDate,total,servantID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
        
    }
    
    public void deleteByOrderID(int orderID){
        try {
            PreparedStatement pre= conn.prepareStatement(DELETE_BY_ORDER_ID);
            
            pre.setInt(1, orderID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Order findByID(int orderID){
        Order order= null;
        try {
            PreparedStatement pre= conn.prepareStatement(GET_ORDER_BY_ID);
            
            pre.setInt(1, orderID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(2);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float total= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                order= new Order(orderID, userID, status, orderDate, serveDate,total,servantID);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return order;

    }
    
    public void serveOrder(String status,int servantID,int orderID){
        try {
            PreparedStatement pre= conn.prepareStatement(SERVE_ORDER);
            
            pre.setString(1, status);
            pre.setInt(2, servantID);
            pre.setInt(3, orderID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector<Order> findAllOrderAccepted(int cusID){
        Vector<Order> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(GET_ALL_ORDER_ACCEPTED);
            
            pre.setInt(1, cusID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                int userID= rs.getInt(2);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float total= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                vector.add(new Order(orderID,userID,status,orderDate,serveDate,total,servantID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
        
    }
    
    public void submitOrder(String serveDate, int orderID){
        try {
            PreparedStatement pre= conn.prepareStatement(SUBMIT_ORDER);
            
            pre.setString(1, serveDate);
            pre.setInt(2, orderID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector<Order> findAllOrderSubmitted(int cusID){
        Vector<Order> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(GET_ALL_ORDER_SUBMITTED);
            
            pre.setInt(1, cusID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                int userID= rs.getInt(2);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float total= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                vector.add(new Order(orderID,userID,status,orderDate,serveDate,total,servantID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
        
    }
    
    public Vector<Order> getAllUserAcceptedOrder(int userID){
        Vector<Order> vector= new Vector<>();
        try {

            PreparedStatement pre= conn.prepareStatement(GET_ALL_USER_ACCEPTED_ORDER);
            
            pre.setInt(1, userID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float total= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                vector.add(new Order(orderID,userID,status,orderDate,serveDate,total,servantID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public Vector<Order> getAllUserServedOrder(int userID){
        Vector<Order> vector= new Vector<>();
        try {

            PreparedStatement pre= conn.prepareStatement(GET_ALL_USER_SERVED_ORDER);
            
            pre.setInt(1, userID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                String status= rs.getString(3);
                String orderDate= rs.getString(4);
                String serveDate= rs.getString(5);
                float total= rs.getFloat(6);
                int servantID= rs.getInt(7);
                
                vector.add(new Order(orderID,userID,status,orderDate,serveDate,total,servantID));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
}
