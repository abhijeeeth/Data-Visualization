/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package userpkg;

import Dbconnect.DbConnector;
import java.sql.*;

/**
 *
 * @author Administrator
 */
public class UserDAO {

    //private static String CREATE_SQL = "create table user(username varchar(50) primary key not null, password varchar(50) not null, name varchar(50) not null,email varchar(50)not null,mobileno int(50))";
    private static String INSERT_SQL = "insert into users values(?, ?, ?, ?,?,?,?)";
    private static String FETCH_SQL = "select * from user where userid = ?";
    private static String UPDATE_SQL = "update user set roll=?,name = ?,password = ?,mobileno=? ,address=?,email=? where userid = ?";
    private static String DELETE_SQL = "delete from user where userid = ?";

    /*
    public static void create() throws Exception {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = DbConnector.getConnection();
            pStmt = con.prepareStatement(CREATE_SQL);
            pStmt.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            pStmt.close();
            con.close();
        }
    }
*/
    public static void insert(User u) throws Exception {

        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = DbConnector.getConnection();
            pStmt = con.prepareStatement(INSERT_SQL);
            pStmt.setString(1, u.getUserId());
            pStmt.setString(2, u.getPassword());
            
           
            pStmt.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            pStmt.close();
            con.close();
        }
    }

    public static User fetch(String name) throws Exception {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = DbConnector.getConnection();
            pStmt = con.prepareStatement(FETCH_SQL);
            pStmt.setString(1, name);
            ResultSet rs = pStmt.executeQuery();
            if (rs.next()) {
                User u = new User();
                u.setUserId(rs.getString(1));
                u.setName(rs.getString(3));
                u.setPassword(rs.getString(4));
                u.setMobileNo(rs.getString(5));
                
                 
               
                return u;
            } else {
                throw new Exception("user name not found");
            }
        } catch (Exception ex) {
            throw ex;
        } finally {
            pStmt.close();
            con.close();
        }
    }

    public static void update(User u) throws Exception {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = DbConnector.getConnection();
            pStmt = con.prepareStatement(UPDATE_SQL);
            pStmt.setString(7, u.getUserId());
            pStmt.setString(2, u.getName());
            pStmt.setString(3, u.getPassword());
            pStmt.setString(4, u.getMobileNo());
            pStmt.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            pStmt.close();
            con.close();
        }
    }

    public static void delete(String name) throws Exception {
        Connection con = null;
        PreparedStatement pStmt = null;
        try {
            con = DbConnector.getConnection();
            pStmt = con.prepareStatement(DELETE_SQL);
            pStmt.setString(1, name);
            pStmt.executeUpdate();
        } catch (Exception ex) {
            throw ex;
        } finally {
            pStmt.close();
            con.close();
        }
    }
}