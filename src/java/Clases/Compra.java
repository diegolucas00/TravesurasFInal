/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author helen
 */
public class Compra {

    private int Id_Factura;
    private String Cliente;
    private Float Valor;
    private String Estado;
    
    public Compra() {
    }
    
    public Compra(int Id_Factura,  String Cliente, Float Valor,String Estado) {
        this.Id_Factura = Id_Factura;
        this.Cliente = Cliente;
        this.Valor = Valor;
        this.Estado= Estado;
    }

    public int getId_Factura() {
        return Id_Factura;
    }

    public void setId_Factura(int Id_Factura) {
        this.Id_Factura = Id_Factura;
    }

    public String getCliente() {
        return Cliente;
    }

    public void setCliente(String Cliente) {
        this.Cliente = Cliente;
    }

    public Float getValor() {
        return Valor;
    }

    public void setValor(Float Valor) {
        this.Valor = Valor;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    
}
