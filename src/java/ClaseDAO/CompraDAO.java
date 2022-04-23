/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

import Clases.Compra;
import Clases.CompraDetalle;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author helen
 */
public class CompraDAO extends Conexion.Conexion {

    private PreparedStatement PST = null;
    private String error;

    public String RegistrarFactura(Compra compra, CompraDetalle compradetalle) {
        String resultado = "Error";
        String sentencia = "INSERT INTO `factura`(`Id`, `Fecha_Creacion`, `Estado`, `Valor_Total`) VALUES (null,NOW(),'Pagado',?);";
        int cantidadp = 0;
        int idproducto = 0;
        int valorp = 0;
        int cantidadu = 0;
        int valoru = 0;

        List<Integer> arraycantidadp = compradetalle.getCantidadPaquete();
        List<Integer> arrayproducto = compradetalle.getProducto();
        List<Integer> arrayvalorp = compradetalle.getValorPaquete();
        List<Integer> arraycantidadu = compradetalle.getCantidadUnidad();
        List<Integer> arrayvaloru = compradetalle.getValorUnidad();

        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setFloat(1, compra.getValor_Total());
                if (!PST.execute()) {
                    resultado = "OK";
                    for (int i = 0; i < arraycantidadp.size(); i++) {
                        cantidadp = arraycantidadp.get(i);
                        idproducto = arrayproducto.get(i);
                        valorp = arrayvalorp.get(i);
                        cantidadu = arraycantidadu.get(i);
                        valoru = arrayvaloru.get(i);

                        if (RegristrarFacturadetalle(idproducto, cantidadp, valorp, cantidadu, valoru)) {
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

    public boolean RegristrarFacturadetalle(int producto, int cantidadp, int valorp, int cantidadu, int valoru) {
        boolean resultado = false;
        String sentencia = "INSERT INTO `facturaproducto`(`Id_Producto`, `Id_Factura`, "
                + "`CantidadUnidad`, `ValorUnidad`, "
                + "`CantidadPaquete`, `ValorPaquete`, `ID`) "
                + "VALUES (?,?,?,"
                + "?,?,?,null);";
        String sentencia2 = "SELECT MAX(Id) AS Id FROM factura";
        int numero = 0;
        if (this.Connexion()) {
            try {

                PST = super.sentences(sentencia2);
                ResultSet res = PST.executeQuery();
                if (res.next()) {
                    numero = res.getInt("Id");
                }
                PST = super.sentences(sentencia);
                PST.setInt(1, producto);
                PST.setInt(2, numero);
                PST.setInt(3, cantidadu);
                PST.setInt(4, valoru);
                PST.setInt(5, cantidadp);
                PST.setInt(6, valorp); 
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
