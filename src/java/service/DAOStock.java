/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package service;

import connection.DBConnect;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Cart;

/**
 *
 * @author tuana
 */
public class DAOStock extends DBConnect{
    private final String FIND_QUANTITY_BY_FID= "select quantity from stocks a join foods b on a.foodID= b.foodID where a.foodID= ?";
    private final String UPDATE_QUANTITY_IN_STOCK= "update stocks set quantity= (quantity + ?) where foodID= ?";
    private final String INSERT_NEW_STOCK= "INSERT INTO [stocks]\n"
            + "           ([userID]\n"
            + "           ,[foodID]\n"
            + "           ,[quantity])\n"
            + "     VALUES\n"
            + "           (?"
            + "           ,?"
            + "           ,?)";
    private final String UPDATE_STOCK= "UPDATE [stocks]\n"
            + "   SET [quantity] = ?"
            + " WHERE [userID]= ? AND [foodID]= ?";
    
    private final String DELETE_STOCK= "DELETE FROM [stocks]\n"
            + "      WHERE [userID]= ? AND [foodID]= ?";
    
    public int findQuantityByFoodID(int foodID){
        int quantity= 0;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_QUANTITY_BY_FID);
            pre.setInt(1, foodID);
            ResultSet rs= pre.executeQuery();
            while(rs.next()){
                quantity= rs.getInt(1);
            } 
        } catch (SQLException ex) {
            Logger.getLogger(DAOStock.class.getName()).log(Level.SEVERE, null, ex);
        }
        return quantity;
    }
    
    public void setQuantityAfterOrder(int quantity, int foodID){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_QUANTITY_IN_STOCK);
            pre.setInt(1, quantity);
            pre.setInt(2, foodID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStock.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void insertNewStock(int userID, int foodID, int quantity){
        try {
            PreparedStatement pre= conn.prepareStatement(INSERT_NEW_STOCK);
            pre.setInt(1, userID);
            pre.setInt(2, foodID);
            pre.setInt(3, quantity);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStock.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateStock(int quantity, int userID, int foodID){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_STOCK);
            pre.setInt(1, quantity);
            pre.setInt(2, userID);
            pre.setInt(3, foodID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStock.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteStock(int userID, int foodID){
        try {
            PreparedStatement pre= conn.prepareStatement(DELETE_STOCK);
            pre.setInt(1, userID);
            pre.setInt(2, foodID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOStock.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
