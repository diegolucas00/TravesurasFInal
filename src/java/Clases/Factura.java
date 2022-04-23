/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

import Clases.Pedido;
import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class Factura {
    private int Id;
    private int FRPedido1;
    private Pedido FRPedido;
    private Date Fechadecreacion;
    private int SubTotal;
    private int IVA;
    private int total;

    public Factura() {
    }

    public Factura(int Id, int FRPedido1, Date Fechadecreacion, int SubTotal, int IVA, int total) {
        this.Id = Id;
        this.FRPedido1 = FRPedido1;
        this.Fechadecreacion = Fechadecreacion;
        this.SubTotal = SubTotal;
        this.IVA = IVA;
        this.total = total;
    }

    public int getFRPedido1() {
        return FRPedido1;
    }

    public void setFRPedido1(int FRPedido1) {
        this.FRPedido1 = FRPedido1;
    }
    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Pedido getFRPedido() {
        return FRPedido;
    }

    public void setFRPedido(Pedido FRPedido) {
        this.FRPedido = FRPedido;
    }

    public Date getFechadecreacion() {
        return Fechadecreacion;
    }

    public void setFechadecreacion(Date Fechadecreacion) {
        this.Fechadecreacion = Fechadecreacion;
    }

    public int getSubTotal() {
        return SubTotal;
    }

    public void setSubTotal(int SubTotal) {
        this.SubTotal = SubTotal;
    }

    public int getIVA() {
        return IVA;
    }

    public void setIVA(int IVA) {
        this.IVA = IVA;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    
    
}
