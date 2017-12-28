/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servidorwarlocksoft;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.StringWriter;
import java.net.ServerSocket;
import java.net.Socket;
import java.sql.*;
import java.util.Scanner;
import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
//import com.google.gson.Gson;

/**
 *
 * @author Carlos
 */
public class Server {

    // JDBC driver name and database URL
    static final String JDBC_DRIVER = "org.mariadb.jdbc.MariaDbDataSource";
    static final String DB_URL = "jdbc:mariadb://localhost:3306/warlock_soft";

    //  Database credentials
    static final String USER = "root";
    static final String PASS = "amor123";

    public static void main(String[] args)
            throws IOException, ClassNotFoundException, SQLException {
        try ( //Gson gson = new Gson();
                ServerSocket serverSocket = new ServerSocket(16001)) {
            System.out.println("Listening on port 16001. "
                    + "Press enter to quit "
                    + "after the next connection.");

            Connection conn = null;
            Statement stmt = null;
            //STEP 2: Register JDBC driver
            Class.forName("org.mariadb.jdbc.MariaDbDataSource");

            //STEP 3: Open a connection
            System.out.println("Connecting to database...");
            conn = DriverManager.getConnection(DB_URL, USER, PASS);
            while (System.in.available() == 0) {
                try (Socket socket = serverSocket.accept()) {
                    System.out.println("A client has connected.");
                    Scanner scanner = new Scanner(socket.getInputStream());
                    String comando = scanner.nextLine();
                    //System.out.println(comando);
                    String[] arr = comando.split(";");
                    String ans = "";
                    stmt = conn.createStatement();
                    String sql = "";
                    ResultSet rs = null;
                    String[] data = arr[1].split(",");
                    switch (Integer.parseInt(arr[0])) {
                        case 1:
                            sql = "select login('" + data[0] + "','" + data[1] + "');";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            while (rs.next()) {
                                System.out.println("result: " + rs.getString(1));
                                ans = rs.getString(1);
                            }
                            break;
                        case 2:
                            sql = "call crearAmistad('" + data[0] + "','" + data[1] + "');";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            ans = "1";
                            break;
                        case 3:
                            sql = "select checkAmistad('" + data[0] + "','" + data[1] + "');";
                            rs = stmt.executeQuery(sql);
                            while (rs.next()) {
                                System.out.println("result: " + rs.getString(1));
                                ans = rs.getString(1);
                            }
                            break;
                        case 4:
                            sql = "call delAmistad('" + data[0] + "','" + data[1] + "');";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            ans = "1";
                            break;
                        case 5:
                            sql = "call sendMessage('" + data[0] + "','" + data[1] + "','" + data[2] + "');";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            ans = "1";
                            break;
                        case 6:
                            sql = "call viewMessage('" + data[0] + "','" + data[1] + "');";
                            rs = stmt.executeQuery(sql);
                            JSONObject object = new JSONObject();
                            //JSONArray array = new JSONArray();
                            //JSONObject arrayElementOne = new JSONObject();
                            JSONArray arrayElementOneArray = new JSONArray();
                            while (rs.next()) {
                                //System.out.println("emisor: " + rs.getString(1)+" mensaje: " + rs.getString(2)+" fecha: " + rs.getString(3));
                                //ans = rs.getString(1);
                                JSONObject arrayElementOneArrayElementOne = new JSONObject();
                                arrayElementOneArrayElementOne.put("emisor", rs.getString(1));
                                arrayElementOneArrayElementOne.put("mensaje", rs.getString(2));
                                arrayElementOneArrayElementOne.put("fecha", rs.getString(3));
                                arrayElementOneArray.add(arrayElementOneArrayElementOne);
                                //array.add(arrayElementOneArray);
                                //arrayElementOne.put("setDef",arrayElementOneArray);
                            }
                            object.put("mensaje", arrayElementOneArray);

                            StringWriter out = new StringWriter();
                            object.writeJSONString(out);

                            String jsonText = out.toString();
                            ans = jsonText;
                            break;
                        case 7:
                            sql = "call insertarUsuario('" + data[0] + "','" + data[1] + "','" + data[2] + "','" + data[3] + "','" + data[4] + "','0');";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            ans = "1";
                            break;
                        case 8:
                            sql = "SELECT * FROM usuario where id='" + data[0] + "';";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            while (rs.next()) {
                                for (int i = 1; i <= 6; i++) {
                                    ans += rs.getString(i) + ",";
                                }
                            }
                            break;
                        case 9:
                            sql = "call crearPost('" + data[0] + "','"+ data[1] + "');";
                            rs = stmt.executeQuery(sql);
                            //STEP 5: Extract data from result set
                            ans = "1";
                            break;
                    }
                    PrintWriter out
                            = new PrintWriter(socket.getOutputStream(),
                                    true);
                    //Guy guy = Guy.getRandomGuy();
                    //String json = gson.toJson(guy);
                    out.print(ans);
                    out.close();
                    //STEP 6: Clean-up environment
                    rs.close();
                    stmt.close();
                }
            }
            conn.close();
            System.out.println("Quitting...");
        }
    }
}
