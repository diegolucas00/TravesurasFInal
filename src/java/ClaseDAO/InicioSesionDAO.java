/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

import Clases.Compra;
import com.google.gson.Gson;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class InicioSesionDAO extends Conexion.Conexion {

    private PreparedStatement PST = null;
    private String error;

    public String TraerRol(String Usuario, String contra) {
        String resultado = "Error";
        String sentencia = "SELECT R.FRRol FROM `usuario` AS u INNER JOIN usuariorol AS R ON u.Id = R.FRUsuario WHERE u.Usuario like ? AND u.Contraseña LIKE ?;";

        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setString(1, Usuario);
                PST.setString(2, contra);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    resultado = String.valueOf(res.getInt("FRRol"));
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
