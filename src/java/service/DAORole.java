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

/**
 *
 * @author tuana
 */
public class DAORole extends DBConnect{
    private final String FIND_ROLE_BY_ID="select * from roles where roleID=?";
    
    public Role findByID(int id){
        Role role= null;
        try {
            PreparedStatement pre= conn.prepareStatement(FIND_ROLE_BY_ID);
            pre.setInt(1, id);
            
            ResultSet rs= pre.executeQuery();
            while(rs.next()){
                int roleID= rs.getInt(1);
                String roleName= rs.getString(2);
                
                role= new Role(roleID, roleName);
            }
        } catch (SQLException ex) {
            Logger.getLogger(DAORole.class.getName()).log(Level.SEVERE, null, ex);
        } 
        return role;
    }
}
