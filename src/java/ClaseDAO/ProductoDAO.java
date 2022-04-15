/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

import Clases.Categoria;
import Clases.SubCategoria;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

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
        String sentencia = "select * from Categoria;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    categoria = new Categoria(res.getInt("Id"), res.getString("Nombre"));
                    listadoeven.add(new Gson().toJsonTree(categoria));
                }
                super.cerrar();
            } catch (SQLException ex) {
                listadoeven.add(new Gson().toJsonTree(ex));
            }

        } else {
            error = "Error con la conexion a la base de datos, verifique conexion";
            listadoeven.add(new Gson().toJsonTree(error));
        }

        return listadoeven;
    }

    public JsonArray ListadoSubCategoria(int categoria) {
        JsonArray listadoeven = new JsonArray();
        SubCategoria subcategoria;
        String sentencia = "SELECT `Id`, `Nombre` FROM `subcategoria` WHERE  FRCategoria = ?;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setInt(1, categoria);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    subcategoria = new SubCategoria(res.getInt("Id"), res.getString("Nombre"));
                    listadoeven.add(new Gson().toJsonTree(subcategoria));
                }
                super.cerrar();
            } catch (SQLException ex) {
                listadoeven.add(new Gson().toJsonTree(ex));
            }

        } else {
            error = "Error con la conexion a la base de datos, verifique conexion";
            listadoeven.add(new Gson().toJsonTree(error));
        }

        return listadoeven;
    }

    public String VerificarP(String categoria) {
        SubCategoria subcategoria;
        String resultado = null;
        String sentencia = "SELECT * FROM `producto` WHERE Nombre LIKE ?;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setString(1, "%" + categoria + "%");
                ResultSet res = PST.executeQuery();
                if(res.next()){
                    resultado = "Repetido";
                }
                super.cerrar();
            } catch (SQLException ex) {
                resultado = String.valueOf(ex);
            }

        } else {
            error = "Error con la conexion a la base de datos, verifique conexion";
            resultado = error;
        }

        return resultado;
    }

}
