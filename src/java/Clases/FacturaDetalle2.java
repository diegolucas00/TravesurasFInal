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
public class FacturaDetalle2 {
    private int Id;
    private int FRFaturaPedido;
    private String Producto;
    private int CantidadPaquete;
    private int ValorPaquete;  
    private int CantidadUnidad;
    private int ValorUnidad;    
    private int ValorIVA;
    private int ValorTotal;

    public FacturaDetalle2() {
    }

    public FacturaDetalle2(int Id, int FRFaturaPedido, String Producto, int CantidadPaquete, int ValorPaquete, int CantidadUnidad, int ValorUnidad, int ValorIVA, int ValorTotal) {
        this.Id = Id;
        this.FRFaturaPedido = FRFaturaPedido;
        this.Producto = Producto;
        this.CantidadPaquete = CantidadPaquete;
        this.ValorPaquete = ValorPaquete;
        this.CantidadUnidad = CantidadUnidad;
        this.ValorUnidad = ValorUnidad;        
        this.ValorIVA = ValorIVA;
        this.ValorTotal = ValorTotal;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getFRFaturaPedido() {
        return FRFaturaPedido;
    }

    public void setFRFaturaPedido(int FRFaturaPedido) {
        this.FRFaturaPedido = FRFaturaPedido;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }

    public int getCantidadPaquete() {
        return CantidadPaquete;
    }

    public void setCantidadPaquete(int CantidadPaquete) {
        this.CantidadPaquete = CantidadPaquete;
    }

    public int getValorPaquete() {
        return ValorPaquete;
    }

    public void setValorPaquete(int ValorPaquete) {
        this.ValorPaquete = ValorPaquete;
    }

    public int getCantidadUnidad() {
        return CantidadUnidad;
    }

    public void setCantidadUnidad(int CantidadUnidad) {
        this.CantidadUnidad = CantidadUnidad;
    }

    public int getValorUnidad() {
        return ValorUnidad;
    }

    public void setValorUnidad(int ValorUnidad) {
        this.ValorUnidad = ValorUnidad;
    }   

    public int getValorIVA() {
        return ValorIVA;
    }

    public void setValorIVA(int ValorIVA) {
        this.ValorIVA = ValorIVA;
    }

    public int getValorTotal() {
        return ValorTotal;
    }

    public void setValorTotal(int ValorTotal) {
        this.ValorTotal = ValorTotal;
    }
    
    
}
