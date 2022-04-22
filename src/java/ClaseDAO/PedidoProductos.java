/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package ClaseDAO;

/**
 *
 * @author ADMIN
 */
public class PedidoProductos {
    private int Id;
    private int FRPedido;
    private int CantidadPaquete;
    private int CantidadUnidad;
    private String Producto;

    public PedidoProductos() {
    }

    public PedidoProductos(int Id, int FRPedido, int CantidadPaquete, int CantidadUnidad, String Producto) {
        this.Id = Id;
        this.FRPedido = FRPedido;
        this.CantidadPaquete = CantidadPaquete;
        this.CantidadUnidad = CantidadUnidad;
        this.Producto = Producto;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public int getFRPedido() {
        return FRPedido;
    }

    public void setFRPedido(int FRPedido) {
        this.FRPedido = FRPedido;
    }

    public int getCantidadPaquete() {
        return CantidadPaquete;
    }

    public void setCantidadPaquete(int CantidadPaquete) {
        this.CantidadPaquete = CantidadPaquete;
    }

    public int getCantidadUnidad() {
        return CantidadUnidad;
    }

    public void setCantidadUnidad(int CantidadUnidad) {
        this.CantidadUnidad = CantidadUnidad;
    }

    public String getProducto() {
        return Producto;
    }

    public void setProducto(String Producto) {
        this.Producto = Producto;
    }
    
    
}
