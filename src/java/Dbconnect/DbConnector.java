/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Dbconnect;

import java.sql.*;

/**
 *
 * @author Administrator
 */
public class DbConnector {

    private static String driverClass ="com.mysql.jdbc.Driver"; //"sun.jdbc.odbc.JdbcOdbcDriver";
    private static String conUrl ="jdbc:mysql:///mydatabase";        //"jdbc:odbc:olsDsn";

    public static Connection getConnection() throws Exception {
        Class.forName(driverClass).newInstance();
        Connection con = DriverManager.getConnection(conUrl , "root", "root");
        return con;
    }

//    public static void main(String args[]) {
//        try {
//            System.out.println(getConnection());
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//    }
}