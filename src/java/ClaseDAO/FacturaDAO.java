/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

import Clases.Factura;
import Clases.FacturaDetalle;
import Clases.FacturaDetalle2;
import Clases.Pedido;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class FacturaDAO extends Conexion.Conexion {

    private PreparedStatement PST = null;
    private String error;

    public String RegistrarFactura(Factura factura, FacturaDetalle facturadetalle) {
        String resultado = "Error";
        String sentencia = "INSERT INTO `facturapedido`(`Id`, `FRPedido`, `FechaCreacion`, `SubTotal`, `IVA`, `Total`) "
                + "VALUES (null,"
                + "?,NOW(),"
                + "?,?,"
                + "?)";
        int cantidadp = 0;
        int idproducto = 0;
        int valorp = 0;
        int cantidadu = 0;
        int valoru = 0;
        int iva = 0;
        int valortotal = 0;
        List<Integer> arraycantidadp = facturadetalle.getCantidadPaquete();
        List<Integer> arrayproducto = facturadetalle.getFRProducto();
        List<Integer> arrayvalorp = facturadetalle.getValorPaquete();
        List<Integer> arraycantidadu = facturadetalle.getCantidadUnidad();
        List<Integer> arrayvaloru = facturadetalle.getValorUnidad();
        List<Integer> arrayiva = facturadetalle.getValorIVA();
        List<Integer> arrayvalortotal = facturadetalle.getValorSubTotal();
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setInt(1, factura.getFRPedido().getId());
                PST.setInt(2, factura.getSubTotal());
                PST.setInt(3, factura.getIVA());
                PST.setInt(4, factura.getTotal());
                if (!PST.execute()) {
                    resultado = "OK";
                    for (int i = 0; i < arraycantidadp.size(); i++) {
                        cantidadp = arraycantidadp.get(i);
                        idproducto = arrayproducto.get(i);
                        valorp = arrayvalorp.get(i);
                        cantidadu = arraycantidadu.get(i);
                        valoru = arrayvaloru.get(i);
                        iva = arrayiva.get(i);
                        valortotal = arrayvalortotal.get(i);
                        if (RegristrarFacturadetalle(idproducto, cantidadp, valorp, cantidadu, valoru, iva, valortotal)) {
                            resultado = "OK";
                        } else {
                            resultado = "Error pedido2";
                        }
                    }
                    if (RegistrarEstadoPedido(factura.getFRPedido().getId())) {
                        resultado = "OK";
                    } else {
                        resultado = "Error pedido2";
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

    public boolean RegristrarFacturadetalle(int producto, int cantidadp, int valorp, int cantidadu, int valoru, int iva, int total) {
        boolean resultado = false;
        String sentencia = "INSERT INTO `facturadetalle`(`Id`, `FRFacturaPedido`, `FRProducto`, "
                + "`CantidadPaquete`, `ValorPaquete`, `CantidadUnidad`, `ValorUnidad`, `ValorIVA`, `ValorTotal`) "
                + "VALUES (null,?,?,"
                + "?,?,?,"
                + "?,?,?)";
        String sentencia2 = "SELECT MAX(Id) AS Id FROM facturapedido";
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
                PST.setInt(2, producto);
                PST.setInt(3, cantidadp);
                PST.setInt(4, valorp);
                PST.setInt(5, cantidadu);
                PST.setInt(6, valoru);
                PST.setInt(7, iva);
                PST.setInt(8, total);
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

    public boolean RegistrarEstadoPedido(int numero) {
        boolean resultado = false;
        String sentencia = "UPDATE `pedido` SET `Estado`='APROVADO' WHERE Id = ?";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setInt(1, numero);
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

    public JsonArray ListadoFacturaPedido() {
        JsonArray listadoeven = new JsonArray();
        Factura factura;
        String sentencia = "SELECT * FROM `facturapedido` ;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    factura = new Factura(res.getInt("Id"), res.getInt("FRPedido"), res.getDate("FechaCreacion"), res.getInt("SubTotal"), res.getInt("IVA"), res.getInt("Total"));
                    listadoeven.add(new Gson().toJsonTree(factura));
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
    public JsonArray ListadoFacturaPedidoCompleto(int numero) {
        JsonArray listadoeven = new JsonArray();
        FacturaDetalle2 factura;
        String sentencia = "SELECT f.*,pro.Nombre FROM facturadetalle AS f INNER JOIN producto AS pro ON f.FRProducto = pro.Id WHERE f.FRFacturaPedido = ?;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setInt(1, numero);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    factura = new FacturaDetalle2(res.getInt("Id"), res.getInt("FRFacturaPedido"), res.getString("Nombre"), res.getInt("CantidadPaquete"), res.getInt("ValorPaquete"), res.getInt("CantidadUnidad"),res.getInt("ValorUnidad"),res.getInt("ValorIVA"),res.getInt("ValorTotal"));
                    listadoeven.add(new Gson().toJsonTree(factura));
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
}
