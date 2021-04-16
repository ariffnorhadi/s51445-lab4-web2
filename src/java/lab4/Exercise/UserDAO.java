/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package lab4.Exercise;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.*;

/**
 *
 * @author ariff
 */
public class UserDAO {

    /**
     * This method is used to update the details of student
     *
     * @param e e is the Instance from User class
     * @return status Status is the number retrieved from executing sql command
     * if the sql command cannot be used, then the status should have no change.
     * later, this status is used to valid the condition in the main class.
     */
    public int update(User e) {
        int status = 0;
        try {
            //Connection con = MySQL.getConnection();
            String sqlUpdate = "update customer set cust_email=?,cust_password=?,"
                    + "cust_name=?,cust_ic=? where cust_id=?";
            PreparedStatement ps
                    = MySQL.getConnection().prepareStatement(sqlUpdate);
            ps.setString(1, e.getEmail());
            ps.setString(2, e.getPassword());
            ps.setString(3, e.getName());
            ps.setString(4, e.getNric());
            ps.setInt(5, e.getId());
            status = ps.executeUpdate();

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return status;
    }

    /**
     * This method is used to update the password of the User.
     *
     * @param e e is the instance of the User class.
     * @return status. if sql command is executed, then the status number will
     * be changed. if not then the status remain unchanged.
     */
    public int updatePass(User e) {
        int status = 0;
        try {
            String sqlUpdatePass = "update customer set cust_password=? where cust_id=?";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlUpdatePass);
            pstmt.setString(1, e.getPassword());
            pstmt.setInt(2, e.getId());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.getMessage();
        }
        return status;
    }

    public int deleteProfile(User e) {
        int status = 0;
        try {
            String sqlDelete = "delete from customer where cust_id=" + e.getId();
            PreparedStatement pstmt = MySQL.getConnection().prepareCall(sqlDelete);
            status = pstmt.executeUpdate(sqlDelete);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

}
