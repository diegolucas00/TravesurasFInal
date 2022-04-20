/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

import Clases.Categoria;
import Clases.Proveedor;
import com.google.gson.Gson;
import com.google.gson.JsonArray;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class ProveedorDAO extends Conexion.Conexion {

    private PreparedStatement PST = null;
    private String error;

    public String VerificarPro(String nit) {
        String resultado = null;
        String sentencia = "SELECT * FROM `proveedor` WHERE NIT LIKE ?;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setString(1, nit);
                ResultSet res = PST.executeQuery();
                if (res.next()) {
                    resultado = "OK";
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

    public String RegistrarProveedor(Proveedor prove) {
        String resultado = "Error";
        String sentencia = "INSERT INTO `proveedor`(`Id`, `NIT`, `NombreEmpresa`,"
                + " `NombreVendedor`, `Correo`, `Celular`,"
                + "`Direccion`)"
                + " VALUES (null,?,?,?,?,?,?)";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setString(1, prove.getNIT());
                PST.setString(2, prove.getNombreEmpresa());
                PST.setString(3, prove.getNombreVendedorr());
                PST.setString(4, prove.getCorreo());
                PST.setString(5, prove.getCelular());
                PST.setString(6, prove.getDireccion());
                if (!PST.execute()) {
                    resultado = "OK";
                    if (RegistrarCategoriasProveedor(prove.getCategoria())) {
                        resultado = "OK";
                    } else {
                        resultado = "Error al registrarlo";
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

    public boolean RegistrarCategoriasProveedor(ArrayList categoria) {
        boolean resultado = false;
        String sentencia = "INSERT INTO `proveedorcategoria`(`FRProveedor`, `FRCategoria`)"
                + " VALUES (?,?)";
        String sentencia2 = "SELECT MAX(Id) AS Id FROM proveedor";
        int numero = 0;
        int as = 0;
        List<Integer> categoria1 = categoria;
        if (this.Connexion()) {
            try {

                PST = super.sentences(sentencia2);
                ResultSet res = PST.executeQuery();
                if (res.next()) {
                    numero = res.getInt("Id");
                }
                for (int i = 1; i < categoria1.size(); i++) {
                    PST = super.sentences(sentencia);
                    PST.setString(1, String.valueOf(numero));
                    as = categoria1.get(i);
                    PST.setString(2, String.valueOf(as));
                    if (!PST.execute()) {
                        resultado = true;

                    } else {
                        resultado = false;
                    }
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

    public JsonArray ListadoProveedores() {
        JsonArray listadoeven = new JsonArray();
        Proveedor provee;
        String sentencia = "SELECT `Id`, `NombreEmpresa`, `NombreVendedor` FROM `proveedor` ;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    provee = new Proveedor(res.getInt("Id"), res.getString("NombreEmpresa"), res.getString("NombreVendedor"));
                    listadoeven.add(new Gson().toJsonTree(provee));
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

    public JsonArray TraerDatosProveedor(int a) {
        JsonArray listadoeven = new JsonArray();
        Proveedor provee;
        String sentencia = "SELECT `Id`, `NIT`, `NombreEmpresa`, `NombreVendedor`, `Correo`, `Celular`, `Direccion` FROM proveedor WHERE Id = ?;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setInt(1, a);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    provee = new Proveedor(res.getInt("Id"), res.getString("NIT"), res.getString("NombreEmpresa"),
                            res.getString("NombreVendedor"), res.getString("Correo"), res.getString("Celular"), res.getString("Direccion"));
                    listadoeven.add(new Gson().toJsonTree(provee));
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

    public JsonArray ListadoCategoriaProvee(int numero) {
        JsonArray listadoeven = new JsonArray();
        Categoria categoria;
        String sentencia = "SELECT `FRCategoria` FROM `proveedorcategoria` WHERE FRProveedor = ?;";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setInt(1, numero);
                ResultSet res = PST.executeQuery();
                while (res.next()) {
                    categoria = new Categoria(res.getInt("FRCategoria"));
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

    public String ModificarProveedor(Proveedor prove) {
        String resultado = "Error";
        String sentencia = "UPDATE `proveedor` SET "
                + "`NIT`=?,`NombreEmpresa`=?,"
                + "`NombreVendedor`=?,`Correo`=?,"
                + "`Celular`=?,`Direccion`=?"
                + " WHERE Id = ?";
        if (this.Connexion()) {
            try {
                PST = super.sentences(sentencia);
                PST.setString(1, prove.getNIT());
                PST.setString(2, prove.getNombreEmpresa());
                PST.setString(3, prove.getNombreVendedorr());
                PST.setString(4, prove.getCorreo());
                PST.setString(5, prove.getCelular());
                PST.setString(6, prove.getDireccion());
                PST.setInt(7, prove.getId());
                if (!PST.execute()) {
                    resultado = "OK";
                    if (EliminarCategoriasProveedor(prove.getId())) {
                        if (RegistrarCategoriasProveedor2(prove.getCategoria(),prove.getId())) {
                            resultado = "OK";
                        } else {
                            resultado = "Error al registrarlo";
                        }
                    } else {
                        resultado = "Error al registrarlo";
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

    public boolean EliminarCategoriasProveedor(int numero) {
        boolean resultado = false;
        String sentencia = "DELETE FROM `proveedorcategoria` WHERE FRProveedor = ?";       
        int as = 0;        
        if (this.Connexion()) {
            try {

                PST = super.sentences(sentencia);
                PST.setInt(1, numero);
                if (!PST.execute()) {
                    resultado = true;

                } else {
                    resultado = false;
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
    
    public boolean RegistrarCategoriasProveedor2(ArrayList categoria, int numero) {
        boolean resultado = false;
        String sentencia = "INSERT INTO `proveedorcategoria`(`FRProveedor`, `FRCategoria`)"
                + " VALUES (?,?)";   
        int as = 1;
        List<Integer> categoria1 = categoria;
        if (this.Connexion()) {
            try {                
                for (int i = 1; i < categoria1.size(); i++) {
                    PST = super.sentences(sentencia);
                    PST.setString(1, String.valueOf(numero));
                    as = categoria1.get(i);
                    PST.setString(2, String.valueOf(as));
                    if (!PST.execute()) {
                        resultado = true;

                    } else {
                        resultado = false;
                    }
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
