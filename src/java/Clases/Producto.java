/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;

/**
 *
 * @author ADMIN
 */
public class Producto {
    private int Id;
    private String Nombre;
    private String Img;
    private String ImgQR;
    private int ValorPaquete;
    private int ValorUnidad;
    private String Descripcion;
    private int SubCategoria;

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public String getNombre() {
        return Nombre;
    }

    public void setNombre(String Nombre) {
        this.Nombre = Nombre;
    }

    public String getImg() {
        return Img;
    }

    public void setImg(String Img) {
        this.Img = Img;
    }

    public String getImgQR() {
        return ImgQR;
    }

    public void setImgQR(String ImgQR) {
        this.ImgQR = ImgQR;
    }

    public int getValorPaquete() {
        return ValorPaquete;
    }

    public void setValorPaquete(int ValorPaquete) {
        this.ValorPaquete = ValorPaquete;
    }

    public int getValorUnidad() {
        return ValorUnidad;
    }

    public void setValorUnidad(int ValorUnidad) {
        this.ValorUnidad = ValorUnidad;
    }

    public String getDescripcion() {
        return Descripcion;
    }

    public void setDescripcion(String Descripcion) {
        this.Descripcion = Descripcion;
    }

    public int getSubCategoria() {
        return SubCategoria;
    }

    public void setSubCategoria(int SubCategoria) {
        this.SubCategoria = SubCategoria;
    }
    
    
}
