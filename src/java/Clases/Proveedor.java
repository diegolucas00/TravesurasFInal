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
public class Proveedor {
    private int Id;
    private String NIT;
    private String NombreEmpresa;
    private String NombreVendedor;
    private String Correo;
    private String Celular;
    private String Direccion;
    private ArrayList Categoria;

    public Proveedor() {
    }   

    public Proveedor(int Id, String NIT, String NombreEmpresa, String NombreVendedor, String Correo, String Celular, String Direccion) {
        this.Id = Id;
        this.NIT = NIT;
        this.NombreEmpresa = NombreEmpresa;
        this.NombreVendedor = NombreVendedor;
        this.Correo = Correo;
        this.Celular = Celular;
        this.Direccion = Direccion;
    }   
    
    public Proveedor(int Id, String NombreEmpresa, String NombreVendedor) {
        this.Id = Id;
        this.NombreEmpresa = NombreEmpresa;
        this.NombreVendedor = NombreVendedor;
    }    
    
    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNIT() {
        return NIT;
    }

    public void setNIT(String NIT) {
        this.NIT = NIT;
    }

    public String getNombreEmpresa() {
        return NombreEmpresa;
    }

    public void setNombreEmpresa(String NombreEmpresa) {
        this.NombreEmpresa = NombreEmpresa;
    }

    public String getNombreVendedorr() {
        return NombreVendedor;
    }

    public void setNombreVendedor(String NombreVwndedor) {
        this.NombreVendedor = NombreVwndedor;
    }

    public String getCorreo() {
        return Correo;
    }

    public void setCorreo(String Correo) {
        this.Correo = Correo;
    }

    public String getCelular() {
        return Celular;
    }

    public void setCelular(String Celular) {
        this.Celular = Celular;
    }

    public String getDireccion() {
        return Direccion;
    }

    public void setDireccion(String Direccion) {
        this.Direccion = Direccion;
    }

    public ArrayList getCategoria() {
        return Categoria;
    }

    public void setCategoria(ArrayList Categoria) {
        this.Categoria = Categoria;
    }
    
    
}
