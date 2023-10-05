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
import model.Role;
import model.Servant;
import model.User;

/**
 *
 * @author tuana
 */
public class DAOServant extends DBConnect{
    private final String CREATE_SERVANT = "INSERT INTO [servants]\n"
            + "           ([firstName]\n"
            + "           ,[lastName]\n"
            + "           ,[email]\n"
            + "           ,[username]\n"
            + "           ,[password]\n"
            + "           ,[address]\n"
            + "           ,[phone])\n"
            + "     VALUES\n"
            + "           (?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?"
            + "           ,?)";
    private final String FIND_BY_ID= "select * from servants where servantID= ?";
    private final String FIND_BY_EMAIL= "select * from servants where email= ?";
    
    
    public void createServant(Servant servant){
        try {
            PreparedStatement pre= conn.prepareStatement(CREATE_SERVANT);
            
            pre.setString(1, servant.getFirstName());
            pre.setString(2, servant.getLastName());
            pre.setString(3, servant.getEmail());
            pre.setString(4, servant.getUsername());
            pre.setString(5, servant.getPassword());
            pre.setString(6, servant.getAddress());
            pre.setString(7, servant.getPhone());
            
            pre.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(DAOServant.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public Servant findByID(int servantID){
        Servant servant= null;
        try {
            
            PreparedStatement pre= conn.prepareStatement(FIND_BY_ID);
            
            pre.setInt(1, servantID);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String email = rs.getString(4);
                String username= rs.getString(5);
                String address = rs.getString(7);
                String phone= rs.getString(8);

                servant = new Servant(servantID, firstName, lastName, email, phone, username, address);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOServant.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return servant;
    }
    
    public Servant findByEmail(String email){
        Servant servant= null;
        try {
            
            PreparedStatement pre= conn.prepareStatement(FIND_BY_EMAIL);
            
            pre.setString(1, email);
            
            ResultSet rs= pre.executeQuery();
            
            while(rs.next()){
                int servantID= rs.getInt(1);
                String firstName = rs.getString(2);
                String lastName = rs.getString(3);
                String username= rs.getString(5);
                String address = rs.getString(7);
                String phone= rs.getString(8);

                servant = new Servant(servantID, firstName, lastName, email, phone, username, address);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAOServant.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return servant;
    }
}
