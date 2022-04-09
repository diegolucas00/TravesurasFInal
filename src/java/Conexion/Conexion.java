/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class Conexion {
    protected Connection cnn = null;
    private PreparedStatement pst = null;
    public ResultSet rs = null;
    private String user = "root";
    private String pass = "";
    private String bd = "travesuras";
    private String url = "jdbc:mysql://localhost:3306/" + bd;

    public boolean Connexion(){
        boolean b = false;
        try {
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            cnn = DriverManager.getConnection(url, user, pass);
            if (cnn != null) {
                b = true;
            }
        } catch (ClassNotFoundException | SQLException | InstantiationException | IllegalAccessException ex) {
           System.out.print(ex);
            
        }
        return b;
    }    
   
    
    public PreparedStatement sentences (String sentence) throws SQLException{
        
        if (Connexion()) {
            pst = cnn.prepareStatement(sentence);
            
            
        }
        return pst;
    }
    public void cerrar () throws SQLException{
        
        cnn.close();
    }
}
