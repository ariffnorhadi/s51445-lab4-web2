/*
 * Talk is cheap. Show me the code.
 */
package lab4.Exercise;

import java.sql.*;
import java.util.*;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author Ariff Norhadi <Cucumorsed.Al-Johori at https://t.me/ariffnorhadi>
 */
public class VehicleDAO {

    public int addVehicle(Vehicle v) {
        int status = 0;
        try {
            String sqlInsert = "insert into vehicle(veh_plate,veh_type,veh_brand,"
                    + "veh_marketprice,cust_id)"
                    + "values(?,?,?,?,?)";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlInsert);
            pstmt.setString(1, v.getPlate());
            pstmt.setString(2, v.getType());
            pstmt.setString(3, v.getBrand());
            pstmt.setDouble(4, v.getPrice());
            pstmt.setInt(5, v.getCust_id());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            //  Logger.getLogger(VehicleDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.getMessage();
        }
        return status;
    }

    public Vehicle getVehicle(int id) {
        Vehicle v = new Vehicle();
        try {
            Connection connection = MySQL.getConnection();
            Statement stmt = connection.createStatement();
            String sqlSelect = "select * from vehicle where veh_id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            if (rs.next()) {
                v.setId(rs.getInt(1));
                v.setPlate(rs.getString(2));
                v.setType(rs.getString(3));
                v.setBrand(rs.getString(4));
                v.setPrice(rs.getDouble(5));
                v.setCust_id(rs.getInt(6));

            }
        } catch (SQLException ex) {
            //Logger.getLogger(VehicleDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.getMessage();
        }
        return v;
    }

    public Vehicle getVehicle(String plate) {
        Vehicle v = new Vehicle();
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlSelect = "select * from vehicle where veh_plate=" + plate;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                v.setId(rs.getInt(1));
                v.setPlate(rs.getString(2));
                v.setType(rs.getString(3));
                v.setBrand(rs.getString(4));
                v.setPrice(rs.getDouble(5));
                v.setCust_id(rs.getInt(6));
            }
        } catch (SQLException ex) {
            //Logger.getLogger(VehicleDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.getMessage();
        }
        return v;
    }

    public int updateVehicle(Vehicle e) {
        int status = 0;
        try {
            String sqlUpdate = "update vehicle set veh_plate=?,veh_type=?,veh_brand=?,"
                    + "veh_marketprice=? where veh_id=?";
            PreparedStatement pstmt = MySQL.getConnection().prepareStatement(sqlUpdate);
            pstmt.setString(1, e.getPlate());
            pstmt.setString(2, e.getType());
            pstmt.setString(3, e.getBrand());
            pstmt.setDouble(4, e.getPrice());
            pstmt.setInt(5, e.getId());
            status = pstmt.executeUpdate();
        } catch (SQLException ex) {
            //Logger.getLogger(VehicleDAO.class.getName()).log(Level.SEVERE, null, ex);
            ex.getMessage();
        }
        return status;
    }

    public List<Vehicle> getAllVehiclesbyCustID(int id) {
        List<Vehicle> vehList = new ArrayList<>();
        try {
            Connection conn = MySQL.getConnection();
            Statement stmt = conn.createStatement();
            String sqlSelect = "select * from vehicle where cust_id=" + id;
            ResultSet rs = stmt.executeQuery(sqlSelect);
            while (rs.next()) {
                Vehicle v = new Vehicle();
                v.setId(rs.getInt(1));
                v.setPlate(rs.getString(2));
                v.setType(rs.getString(3));
                v.setBrand(rs.getString(4));
                v.setPrice(rs.getDouble(5));
                v.setCust_id(rs.getInt(5));
                vehList.add(v);

            }
        } catch (SQLException ex) {
            Logger.getLogger(VehicleDAO.class.getName()).log(Level.SEVERE, null, ex);
        }

        return vehList;
    }

    /**
     * This method delete the information of vehicle from database
     *
     * @param v
     * @return status > 0 if the sql command is executed if not then the status
     * remain unchanged
     */
    public int deleteVehicle(Vehicle v) {
        int status = 0;
        try {
            Statement stmt = MySQL.getConnection().createStatement();
            String sqlDelete = "delete from vehicle where veh_id=" + v.getId();
            status = stmt.executeUpdate(sqlDelete);

        } catch (SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, null, ex);
        }
        return status;
    }

}
