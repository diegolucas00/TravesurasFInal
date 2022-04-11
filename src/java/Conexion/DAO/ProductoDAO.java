/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Clases.Categoria;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class ProductoDAO extends Conexion.Conexion {
    private PreparedStatement PST = null;
    private String error;

    public JsonArray ListadoCategoria() {
        JsonArray listadoeven = new JsonArray();
        Categoria categoria;
        String sentencia = "select * from Inventario;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                ResultSet res = PST.executeQuery();

                while (res.next()) {
                    categoria = new Categoria(res.getInt("Id"), res.getString("Nombre"));
                    listadoeven.add(new Gson().toJsonTree(categoria));
                }
            } catch (SQLException ex) {
                listadoeven.add(new Gson().toJsonTree(ex));
            }

        } else {
            error = "Error con la conexion a la base de datos, verifique conexion";
            listadoeven.add(new Gson().toJsonTree(error));
        }
        return listadoeven;
    }

}
