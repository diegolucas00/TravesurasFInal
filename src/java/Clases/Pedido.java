/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.sql.Date;
import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class Pedido {
    private int Id;
    private ArrayList Id2; 
    private int IdProveedor;
    private ArrayList IdProducto;
    private Date FechaCreacion;
    private String Estado;
    private Date FechaCambioEstado;
    private ArrayList CantidadPauqete;
    private ArrayList CantidadUnidad;

    public ArrayList getId2() {
        return Id2;
    }

    public void setId2(ArrayList Id2) {
        this.Id2 = Id2;
    }
 
    public int getIdProveedor() {
        return IdProveedor;
    }

    public void setIdProveedor(int IdProveedor) {
        this.IdProveedor = IdProveedor;
    }

    public ArrayList getIdProducto() {
        return IdProducto;
    }

    public void setIdProducto(ArrayList IdProducto) {
        this.IdProducto = IdProducto;
    }

    public ArrayList getCantidadPauqete() {
        return CantidadPauqete;
    }

    public void setCantidadPauqete(ArrayList CantidadPauqete) {
        this.CantidadPauqete = CantidadPauqete;
    }

    public ArrayList getCantidadUnidad() {
        return CantidadUnidad;
    }

    public void setCantidadUnidad(ArrayList CantidadUnidad) {
        this.CantidadUnidad = CantidadUnidad;
    }

    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Date getFechaCreacion() {
        return FechaCreacion;
    }

    public void setFechaCreacion(Date FechaCreacion) {
        this.FechaCreacion = FechaCreacion;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    public Date getFechaCambioEstado() {
        return FechaCambioEstado;
    }

    public void setFechaCambioEstado(Date FechaCambioEstado) {
        this.FechaCambioEstado = FechaCambioEstado;
    }
    
    
}
