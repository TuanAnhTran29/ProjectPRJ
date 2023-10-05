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
import model.Role;
import model.User;

/**
 *
 * @author tuana
 */
public class DAOUser extends DBConnect{
    private DAORole daoRole= new DAORole();
    
    private final String LOGIN_USER= "select * from users where username=? AND password=?";
    private final String FIND_BY_USERNAME= "select * from users where username=?";
    private final String CHANGE_PASSWORD= "update users set password=? where username=?";
    private final String FIND_BY_ID= "select * from users where userID=?";
    private final String CREATE_USER= "INSERT INTO [users]\n"
            + "           ([firstName]\n"
            + "           ,[lastName]\n"
            + "           ,[email]\n"
            + "           ,[username]\n"
            + "           ,[password]\n"
            + "           ,[address]\n"
            + "           ,[roleID]\n"
            + "           ,[phone])\n"
            + "     VALUES\n"
            + "           (?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?)";
    private final String FIND_BY_EMAIL= "select * from users where email= ?";
    private final String FIND_BY_PHONE= "select * from users where phone= ?";
    private final String FIND_ALL_USER= "select userID, username from users";
    private final String UPDATE_USER= "update users set firstName= ?, lastName= ?, username= ?, address= ? where userID= ?";
    
    
    public User loginUser(String username, String password){
        User user= null;
        try {
            PreparedStatement pre= conn.prepareStatement(LOGIN_USER);
            
            pre.setString(1, username);
            pre.setString(2, password);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(1);
                String firstName= rs.getString(2);
                String lastName= rs.getString(3);
                String email= rs.getString(4);
                String address= rs.getString(7);
                Role role= daoRole.findByID(rs.getInt(8));
                String phone= rs.getString(9);
                
                user= new User(userID, firstName, lastName, email, phone, username, address, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return user;
    }
    
    public User findByUsername(String username){
        User user= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_USERNAME);
            
            pre.setString(1, username);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(1);
                String firstName= rs.getString(2);
                String lastName= rs.getString(3);
                String email= rs.getString(4);
                String address= rs.getString(7);
                Role role= daoRole.findByID(rs.getInt(8));
                String phone= rs.getString(9);
                
                user= new User(userID, firstName, lastName, email, phone, username, address, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return user;
    }
    
    public void changePasswordForUser(String username, String password){
        try {
            PreparedStatement pre= conn.prepareStatement(CHANGE_PASSWORD);
            pre.setString(1, password);
            pre.setString(2, username);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    public void createUser(User user){
        try {
            PreparedStatement pre= conn.prepareStatement(CREATE_USER);
            
            pre.setString(1, user.getFirstName());
            pre.setString(2, user.getLastName());
            pre.setString(3, user.getEmail());
            pre.setString(4, user.getUsername());
            pre.setString(5, user.getPassword());
            pre.setString(6, user.getAddress());
            pre.setInt(7, user.getRole().getRoleID());
            pre.setString(8, user.getPhone());
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }  
    }
    
    public User findByEmail(String email){
        User user= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_EMAIL);
            pre.setString(1, email);
            
            ResultSet rs= pre.executeQuery();
            while(rs.next()){
                int userID= rs.getInt(1);
                String firstName= rs.getString(2);
                String lastName= rs.getString(3);
                String username= rs.getString(5);
                String address= rs.getString(7);
                Role role= daoRole.findByID(rs.getInt(8));
                String phone= rs.getString(9);
                
                user= new User(userID, firstName, lastName, email, phone, username, address, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return user;
    }
    
    public User findByID(int id){
        User user= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_ID);
            
            pre.setInt(1, id);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                String firstName= rs.getString(2);
                String lastName= rs.getString(3);
                String email= rs.getString(4);
                String username= rs.getString(5);
                String address= rs.getString(7);
                Role role= daoRole.findByID(rs.getInt(8));
                String phone= rs.getString(9);
                
                user= new User(id, firstName, lastName, email, phone, username, address, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return user;
    }
    
    public User findByPhone(String phone){
        User user= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_BY_PHONE);
            
            pre.setString(1, phone);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(1);
                String firstName= rs.getString(2);
                String lastName= rs.getString(3);
                String email= rs.getString(4);
                String username= rs.getString(5);
                String address= rs.getString(7);
                Role role= daoRole.findByID(rs.getInt(8));
                
                user= new User(userID, firstName, lastName, email, phone, username, address, role);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        return user;
    }
    
    public Vector findAllUser(){
        Vector<User> vector= new Vector<>();
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ALL_USER);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int userID= rs.getInt(1);
                String username= rs.getString(2);
                
                vector.add(new User(userID, username));
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return vector;
    }
    
    public void updateUser(String firstName, String lastName, String username, String address, int userID){
        try {
            PreparedStatement pre= conn.prepareStatement(UPDATE_USER);
            
            pre.setString(1, firstName);
            pre.setString(2, lastName);
            pre.setString(3, username);
            pre.setString(4, address);
            pre.setInt(5, userID);
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOUser.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
