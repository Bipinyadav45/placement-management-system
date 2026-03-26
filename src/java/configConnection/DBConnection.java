/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package configConnection;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBConnection {
    public static Connection getConnection(){

        Connection con = null;

        try{

            // step 1: load driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // step 2: create connection
            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/myprofile_db",
                    "root",
                    "spdt"
            );

        }catch(Exception e){
            e.printStackTrace();
        }

        return con;
    }
}