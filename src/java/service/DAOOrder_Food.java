/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import connection.DBConnect;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Vector;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Order_Food;

/**
 *
 * @author tuana
 */
public class DAOOrder_Food extends DBConnect{
    private final String INSERT_ORDER_FOOD = "INSERT INTO [orders_foods]\n"
            + "           ([orderID]\n"
            + "           ,[foodID]\n"
            + "           ,[quantity]\n"
            + "           ,[list_price])\n"
            + "     VALUES\n"
            + "           (?\n"
            + "           ,?\n"
            + "           ,?\n"
            + "           ,?)";
    
    private final String FIND_ORDER= "select foodID, quantity, list_price "
            + "from orders_foods a join orders b on a.orderID= b.orderID"
            + " where b.orderDate= ?";
    private final String FIND_ALL_BY_FOOD_ID= "select * from orders_foods where foodID= ?";
    private final String FIND_ORDER_DETAIL= "select * from orders_foods where orderID= ?";
    private final String DELETE_BY_FOOD_ID= "delete from orders_foods where foodID= ?";
    
    public void insertOrderFood(int orderID,int foodID, int quantity, double price){
        try {
            PreparedStatement pre= conn.prepareStatement(INSERT_ORDER_FOOD);
            pre.setInt(1, orderID);
            pre.setInt(2, foodID);
            pre.setInt(3, quantity);
            pre.setDouble(4, price);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Food.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector<Order_Food> findByOrderDate(String orderDate){
        Vector<Order_Food> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ORDER);
            
            pre.setString(1, orderDate);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int foodID= rs.getInt(1);
                int quantity= rs.getInt(2);
                float list_price= rs.getFloat(3);
                
                vector.add(new Order_Food(foodID,quantity,list_price));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Food.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    
    public Vector findOrderDetail(int orderID){
        Vector<Order_Food> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ORDER_DETAIL);
            
            pre.setInt(1, orderID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int foodID= rs.getInt(2);
                int quantity= rs.getInt(3);
                float list_price= rs.getFloat(4);
                
                vector.add(new Order_Food(orderID, foodID, quantity, list_price));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder_Food.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<Order_Food> findAllByFoodID(int foodID){
        Vector<Order_Food> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_BY_FOOD_ID);
            
            pre.setInt(1, foodID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int orderID= rs.getInt(1);
                int quantity= rs.getInt(3);
                float listPrice= rs.getFloat(4);
                
                vector.add(new Order_Food(orderID, foodID, quantity, listPrice));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public void deleteByFoodID(int foodID){
        try {
            PreparedStatement pre= conn.prepareStatement(DELETE_BY_FOOD_ID);
            
            pre.setInt(1, foodID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOOrder.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
}
