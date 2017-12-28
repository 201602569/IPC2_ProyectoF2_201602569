/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorwarlocksoft;

import java.sql.*;
import java.util.Properties;
import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

/**
 *
 * @author Carlos
 */
public class FirstExample {
    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.mariadb.jdbc.MariaDbDataSource";
    static final String DB_URL = "jdbc:mariadb://localhost:3306/warlock soft";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "hola";

    public static void main(String[] args) throws NamingException, SQLException {
        Connection conn = null;
        Statement stmt = null;
        try {
            //STEP 4: Execute a query
            System.out.println("Creating statement...");
            stmt = conn.createStatement();
            String sql;
            sql = "select login('charliecech','1234pass');";
            ResultSet rs = stmt.executeQuery(sql);
            //STEP 5: Extract data from result set
            while (rs.next()) {
                System.out.println("result: " + rs.getString(1));
            }
            //STEP 6: Clean-up environment
            rs.close();
            stmt.close();
            conn.close();
        } catch (SQLException se) {
            //Handle errors for JDBC
            se.printStackTrace();
        } catch (Exception e) {
            //Handle errors for Class.forName
            e.printStackTrace();
        } finally {
            //finally block used to close resources
            try {
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException se2) {
            }// nothing we can do
            try {
                if (conn != null) {
                    conn.close();
                }
            } catch (SQLException se) {
                se.printStackTrace();
            }//end finally try
        }//end try
        System.out.println("Goodbye!");
        //Find a database connection
//Do something with the connection.
//Close connection so it can be released back to the pool!
    }//end main
}//end FirstExample
