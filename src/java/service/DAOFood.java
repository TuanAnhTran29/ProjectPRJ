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
import model.Food;

/**
 *
 * @author tuana
 */
public class DAOFood extends DBConnect{
    private final String FIND_ALL_FOOD= "select * from foods";
    private final String FIND_BY_ID= "select * from foods where foodID= ?";
    private final String FIND_BY_NAME= "select * from foods where foodName=?";
    private final String FIND_ALL_FOOD_REMAINING= "select a.foodID, foodName, categoryName, brandName, price, description from foods a join stocks b on a.foodID= b.foodID where quantity> 0";
    private final String FIND_ALL_BY_NAME= "select * from foods where foodName like ? ";
    private final String FIND_ALL_CATEGORY= "select distinct categoryName from foods";
    private final String FIND_ALL_BY_CATEGORY= "select * from foods where categoryName= ? ";
    private final String FIND_ALL_BY_USER_ID= "select * from foods a join stocks b on a.foodID= b.foodID where b.userID= ?";
    private final String FIND_ALL_CATEGORY_BY_USER_ID= "select distinct categoryName from foods a join stocks b on a.foodID= b.foodID where b.userID= ?";
    private final String FIND_ALL_BY_CATE_BY_USER_ID= "select * from foods a join stocks b on a.foodID= b.foodID where b.userID=? AND categoryName=?";
    private final String INSERT_NEW_FOOD= "INSERT INTO [foods]\n"
            + "           ([foodID]\n"
            + "           ,[foodName]\n"
            + "           ,[categoryName]\n"
            + "           ,[brandName]\n"
            + "           ,[price]\n"
            + "           ,[description])\n"
            + "     VALUES\n"
            + "           (?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?)";
    private final String UPDATE_FOOD= "UPDATE [foods]\n"
            + "   SET [categoryName] = ?"
            + "      ,[brandName] = ?"
            + "      ,[price] = ?"
            + "      ,[description] = ?"
            + " WHERE [foodID] = ?";
    private final String DELETE_FOOD= "DELETE FROM [foods] WHERE [foodID]= ?";

    
    public Food findByID(int id){
        Food food= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_ID);
            pre.setInt(1, id);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                String foodName= rs.getString(2);
                String categoryName= rs.getString(3);
                String brandName= rs.getString(4);
                float price= rs.getFloat(5);
                String description= rs.getString(6);
                
                food= new Food(id,foodName, price, categoryName, brandName, description);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return food;
    }
    
    public Food findByName(String name){
        Food food= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_NAME);
            pre.setString(1, name);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                String foodName= rs.getString(2);
                String categoryName= rs.getString(3);
                String brandName= rs.getString(4);
                float price= rs.getFloat(5);
                String description= rs.getString(6);
                
                food= new Food(foodName, price, categoryName, brandName, description);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return food;
    }
    
    
    public Vector<Food> findAllFood(){
        Vector<Food> vector= new Vector<>();
        try {
             PreparedStatement pre = conn.prepareStatement(FIND_ALL_FOOD);
             ResultSet rs= pre.executeQuery();
             while(rs.next()){
                 int foodID= rs.getInt(1);
                 String foodName= rs.getString(2);
                 String categoryName = rs.getString(3);
                 String brandName = rs.getString(4);
                 float price = rs.getFloat(5);
                 String description= rs.getString(6);
                 
                 Food food= new Food(foodID, foodName, price, categoryName, brandName, description);
                 vector.add(food);
             }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public Vector<Food> findAllFoodRemaining(){
        Vector<Food> vector= new Vector<>();
        try {
             PreparedStatement pre = conn.prepareStatement(FIND_ALL_FOOD_REMAINING);
             ResultSet rs= pre.executeQuery();
             while(rs.next()){
                 int foodID= rs.getInt(1);
                 String foodName= rs.getString(2);
                 String categoryName = rs.getString(3);
                 String brandName = rs.getString(4);
                 float price = rs.getFloat(5);
                 String description= rs.getString(6);
                 
                 Food food= new Food(foodID, foodName, price, categoryName, brandName,description);
                 vector.add(food);
             }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public Vector<Food> findAllByName(String name){
        Vector<Food> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_BY_NAME);
            pre.setString(1,"%" + name + "%");
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int foodID = rs.getInt(1);
                String foodName = rs.getString(2);
                String categoryName = rs.getString(3);
                String brandName = rs.getString(4);
                float price = rs.getFloat(5);
                String description = rs.getString(6);
                
                
                vector.add(new Food(foodID, foodName, price, categoryName, brandName, description));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<String> findAllCategory(){
        Vector<String> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_CATEGORY);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                vector.add(rs.getString(1));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector<Food> findAllByCategory(String category){
        Vector<Food> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_BY_CATEGORY);
            pre.setString(1, category);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int foodID = rs.getInt(1);
                String foodName = rs.getString(2);
                String categoryName = rs.getString(3);
                String brandName = rs.getString(4);
                float price = rs.getFloat(5);
                String description = rs.getString(6);
                
                vector.add(new Food(foodID, foodName, price, categoryName, brandName, description));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector findAllByUserID(int userID){
        Vector<Food> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_BY_USER_ID);
            
            pre.setInt(1, userID);
             
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int foodID= rs.getInt(1);
                String foodName= rs.getString(2);
                String categoryName= rs.getString(3);
                String brandName= rs.getString(4);
                float price= rs.getFloat(5);
                String description= rs.getString(6);
                
                vector.add(new Food(foodID, foodName, price, categoryName, brandName, description));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public Vector findAllCateByUserID(int userID){
        Vector<String> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_CATEGORY_BY_USER_ID);
            
            pre.setInt(1, userID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                String category= rs.getString(1);
                
                vector.add(category);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public Vector findAllFoodByCateByUserID(int userID, String category){
        Vector<Food> vector= new Vector<>();
        try{
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_BY_CATE_BY_USER_ID);
            
            pre.setInt(1, userID);
            pre.setString(2, category);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int foodID = rs.getInt(1);
                String foodName = rs.getString(2);
                String categoryName = rs.getString(3);
                String brandName = rs.getString(4);
                float price = rs.getFloat(5);
                String description = rs.getString(6);
                
                vector.add(new Food(foodID, foodName, price, categoryName, brandName, description));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
        return vector;
    }
    
    public void insertNewFood(int foodID, String foodName, String category, String brandName, float price, String description){
        try {
            PreparedStatement pre= conn.prepareStatement(INSERT_NEW_FOOD);
            
            pre.setInt(1, foodID);
            pre.setString(2, foodName);
            pre.setString(3, category);
            pre.setString(4, brandName);
            pre.setFloat(5, price);
            pre.setString(6, description);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void updateFood(String category, String brand, float price, String description, int foodID){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_FOOD);
            
            pre.setString(1, category);
            pre.setString(2, brand);
            pre.setFloat(3, price);
            pre.setString(4, description);
            pre.setInt(5, foodID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void deleteFood(int foodID){
        try {
            PreparedStatement pre= conn.prepareStatement(DELETE_FOOD);
            
            pre.setInt(1, foodID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOFood.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
