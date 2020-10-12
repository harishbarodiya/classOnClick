package dbconn;

import java.sql.*;
import java.util.*;

/**
 *
 * @author haris
 */
public class DBConnection {
    private final static String DNAME = "com.mysql.jdbc.Driver";
    private final static String URL = "jdbc:mysql://localhost:3306/ClassOnClick";
    private final static String USER = "root";
    private final static String PASS = "";
    
    
    
    public static Connection getConnect(){
        Connection conn = null;
        try {
                Class.forName(DNAME);
                conn = DriverManager.getConnection(URL,USER,PASS);
                
            } catch (ClassNotFoundException | SQLException ex) {
            System.out.println(ex);
        }
        return conn;
    }
//    public static void main(String[] args) {
//        System.out.println(DBConnection.getConnect());
//                
//    }
}
