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
import model.Cart;

/**
 *
 * @author tuana
 */
public class DAOCart extends DBConnect{
    private final String FIND_BY_USER_ID= "select * from carts where userID=?";
    private final String INSERT_NEW_CART = "INSERT INTO [carts]\n"
            + "           ([userID]\n"
            + "           ,[foodID]\n"
            + "           ,[quantity])\n"
            + "     VALUES\n"
            + "           (?\n"
            + "           ,?\n"
            + "           ,?)";
    private final String FIND_BY_FOOD_ID= "select * from carts where foodID=?";
    private final String UPDATE_QUANTITY = "UPDATE [carts]\n"
            + "   SET [quantity] = ?\n"
            + " WHERE [foodID]= ? AND [userID]= ?";
    
    private final String DELETE_BY_FOOD_ID= "delete from carts where foodID=? AND userID=?";
    private final String FIND_CART_BY_FOOD_ID_AND_USER_ID= "select * from carts where userID=? AND foodID=?";
    
    public void addToCart(int userID, int foodID, int quantity){
        try {
            PreparedStatement pre= conn.prepareStatement(INSERT_NEW_CART);
            
            pre.setInt(1, userID);
            pre.setInt(2, foodID);
            pre.setInt(3, quantity);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Cart findByFoodID(int id){
        Cart cart= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_FOOD_ID);
            
            pre.setInt(1, id);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(1);
                int foodID= rs.getInt(2);
                int quantity= rs.getInt(3);
                
                cart= new Cart(userID, foodID, quantity);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cart;
    }
    
    public Cart findByFoodIDAndUserID(int userID,int foodID){
        Cart cart= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_CART_BY_FOOD_ID_AND_USER_ID);
            
            pre.setInt(1, userID);
            pre.setInt(2, foodID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int quantity= rs.getInt(3);
                
                cart= new Cart(userID, foodID, quantity);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        return cart;
    }
    
    public void updateQuantity(int quantity, int foodID, int userID){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_QUANTITY);
            pre.setInt(1, quantity);
            pre.setInt(2, foodID);
            pre.setInt(3, userID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Vector findByUserID(int id){
        Vector<Cart> carts= new Vector<>();
        try {
            
            PreparedStatement pre= conn.prepareStatement(FIND_BY_USER_ID);
            pre.setInt(1, id);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(1);
                int foodID= rs.getInt(2);
                int quantity= rs.getInt(3);
                
                carts.add(new Cart(userID, foodID, quantity));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return carts;
    }
    
    public void deleteFromCart(int foodID, int userID){
        try {
            PreparedStatement pre= conn.prepareStatement(DELETE_BY_FOOD_ID);
            pre.setInt(1, foodID);
            pre.setInt(2, userID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOCart.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
