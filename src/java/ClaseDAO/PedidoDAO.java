/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

import Clases.Pedido;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class PedidoDAO extends Conexion.Conexion {

    private PreparedStatement PST = null;
    private String error;

    public String RegistrarProducto(Pedido pedido) {
        String resultado = "Error";
        String sentencia = "INSERT INTO `pedido`(`Id`, `FechaCreacion`, `Estado`, `FechaCambioEstado`, `FKProveedor`) "
                + "VALUES (null,NOW(),"
                + "?,NOW(), ?)";
        int cantidadp = 0;
        int catidadu = 0;
        int idproducto = 0;        
        List<Integer> arraycantidadp = pedido.getCantidadPauqete();
        List<Integer> arraycantidadu = pedido.getCantidadUnidad();
        List<Integer> arrayidproducto = pedido.getIdProducto();
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setString(1, "EN PROCESO");
                PST.setInt(2, pedido.getIdProveedor());
                if (!PST.execute()) {
                    resultado = "OK";
                    for (int i = 0; i < arraycantidadp.size(); i++) {
                        cantidadp = arraycantidadp.get(i);
                        catidadu = arraycantidadu.get(i);
                        idproducto = arrayidproducto.get(i);
                        if (RegristrarProductos(cantidadp, catidadu, idproducto)) {
                            resultado = "OK";
                        } else {
                            resultado = "Error pedido2";
                        }
                    }
                } else {
                    resultado = "Error al registrarlo";
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

    public boolean RegristrarProductos(int cantidadp, int catidadu, int idproducto) {
        boolean resultado = false;
        String sentencia = "INSERT INTO `pedidoproducto`(`Id`, `FRPedido`, `FRProducto`, `CantidadPauqete`, `CantidadUnidad`) "
                + "VALUES (null,?,"
                + "?,?,"
                + "?)";
        String sentencia2 = "SELECT MAX(Id) AS Id FROM pedido";
        int numero = 0;
        if (this.Connexion()) {
            try {

                PST = super.sentences(sentencia2);
                ResultSet res = PST.executeQuery();
                if (res.next()) {
                    numero = res.getInt("Id");
                }
                PST = super.sentences(sentencia);
                PST.setInt(1, numero);
                PST.setInt(2, idproducto);
                PST.setInt(3, cantidadp);
                PST.setInt(4, catidadu);
                if (!PST.execute()) {
                    resultado = true;
                }
                super.cerrar();
            } catch (SQLException ex) {
                resultado = false;
            }

        } else {
            error = "Error con la conexion a la base de datos, verifique conexion";
            resultado = false;
        }

        return resultado;
    }
}
