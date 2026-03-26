/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package com.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class ShortConnection {

    public static Connection getConnection() {
        Connection con = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                "jdbc:mysql://localhost:3306/register",
                "root",
                "spdt"   // apna password likho
            );

            System.out.println("Database Connected");

        } catch (Exception e) {
            e.printStackTrace();
        }

        return con;
    }
}