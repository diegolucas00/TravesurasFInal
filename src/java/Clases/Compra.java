/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Clases;
import java.sql.Date;
/**
 *
 * @author helen
 */
public class Compra {
    private int Id;
    private Date Fecha_Creacion;
    private Float Valor_Total;
    private String  Estado;
;
    public Compra() {
    }
    
    public Compra(int Id, Date Fecha_Creacion, Float Valor_Total,String Estado) {
        this.Id = Id;
        this.Fecha_Creacion = Fecha_Creacion;
        this.Valor_Total = Valor_Total;
        this.Estado= Estado;
    }

    public int getId() {
        return Id;
    }

    public void setId(int Id) {
        this.Id = Id;
    }

    public Date getFecha_Creacion() {
        return Fecha_Creacion;
    }

    public void setFecha_Creacion(Date Fecha_Creacion) {
        this.Fecha_Creacion = Fecha_Creacion;
    }

    public Float getValor_Total() {
        return Valor_Total;
    }

    public void setValor_Total(Float Valor_Total) {
        this.Valor_Total = Valor_Total;
    }

    public String getEstado() {
        return Estado;
    }

    public void setEstado(String Estado) {
        this.Estado = Estado;
    }

    
}
