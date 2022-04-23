/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import java.util.ArrayList;

/**
 *
 * @author ADMIN
 */
public class CompraDetalle {
    private ArrayList Producto;
    private int Factura;
    private ArrayList CantidadUnidad;
    private ArrayList ValorUnidad;
    private ArrayList CantidadPaquete;
    private ArrayList ValorPaquete;

    public ArrayList getProducto() {
        return Producto;
    }

    public void setProducto(ArrayList Producto) {
        this.Producto = Producto;
    }

    public int getFactura() {
        return Factura;
    }

    public void setFactura(int Factura) {
        this.Factura = Factura;
    }

    public ArrayList getCantidadUnidad() {
        return CantidadUnidad;
    }

    public void setCantidadUnidad(ArrayList CantidadUnidad) {
        this.CantidadUnidad = CantidadUnidad;
    }

    public ArrayList getValorUnidad() {
        return ValorUnidad;
    }

    public void setValorUnidad(ArrayList ValorUnidad) {
        this.ValorUnidad = ValorUnidad;
    }

    public ArrayList getCantidadPaquete() {
        return CantidadPaquete;
    }

    public void setCantidadPaquete(ArrayList CantidadPaquete) {
        this.CantidadPaquete = CantidadPaquete;
    }

    public ArrayList getValorPaquete() {
        return ValorPaquete;
    }

    public void setValorPaquete(ArrayList ValorPaquete) {
        this.ValorPaquete = ValorPaquete;
    }
    
    
}
