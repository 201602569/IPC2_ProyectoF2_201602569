/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorwarlocksoft;

import java.util.logging.Level;
import java.util.logging.Logger;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.ResultSet;

/**
 *
 * @author Carlos
 */
public class ServidorWarlockSoft {

    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        try {
            // TODO code application logic here
            Connection connection = DriverManager.getConnection("jdbc:mariadb://localhost:3306/warlock_soft?user=root&password=amor123");
            Statement stmt = null;
            ResultSet rs = null;

            try {
                stmt = connection.createStatement();
                //rs = stmt.executeQuery("SELECT * FROM Prueba");

                // or alternatively, if you don't know ahead of time that
                // the query will be a SELECT...
                if (stmt.execute("SELECT * FROM Prueba")) {
                    rs = stmt.getResultSet();
                    while(rs.next()) {
                        System.out.println("Name: " + rs.getString(1) + " Age: " + rs.getString(2));
                    }
                }
                //Insertar Usuario
                //stmt.executeQuery("CALL insertarUsuario('Carlos Eduardo Cordon','carlos.edu.cordon@gmail.com','1997-04-27','1234pass','charliecech',0);");
                //Crear post
                //stmt.executeQuery("CALL crearPost(1,'Hola este es mi primer post!')");
                //Crear amistad
                //stmt.executeQuery("CALL crearAmistad(1,5)");
                // Now do something with the ResultSet ....
            } catch (SQLException ex) {
                // handle any errors
                System.out.println("SQLException: " + ex.getMessage());
                System.out.println("SQLState: " + ex.getSQLState());
                System.out.println("VendorError: " + ex.getErrorCode());
            } finally {
                // it is a good idea to release
                // resources in a finally{} block
                // in reverse-order of their creation
                // if they are no-longer needed

                if (rs != null) {
                    try {
                        rs.close();
                    } catch (SQLException sqlEx) {
                    } // ignore

                    rs = null;
                }

                if (stmt != null) {
                    try {
                        stmt.close();
                    } catch (SQLException sqlEx) {
                    } // ignore

                    stmt = null;
                }
            }
        } catch (SQLException ex) {
            Logger.getLogger(ServidorWarlockSoft.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
