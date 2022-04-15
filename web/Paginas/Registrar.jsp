<%-- 
    Document   : Registrar
    Created on : Mar 29, 2022, 10:17:41 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center">
        <div class="d-flex justify-content-center mitad" >
            <h1 class="titulo">Registrar Producto</h1>                       
        </div>        
        <div class="d-flex justify-content-center mitad" id="mitadf" >

        </div>        
        <div class="d-flex justify-content-center mitad" >
            <img src="Imagenes/Foto.png" id="ImgSubida" class="inativo">            
        </div>          
        <div class="row">
            <div class="col col-lg-6" id="Categoriadiv">
                <label>Categoria</label>                
            </div>
            <div class="col col-lg-6" id="SubCategoriadiv">
                <label>Sub Categoria</label>
                
            </div>  
        </div>   
        <div class="row">
            <div class="col col-lg-6" id="NombrePdiv">
                <label>Nombre del Producto</label>
                
            </div>
            <div class="col col-lg-6">
                <label>Valor Unitario</label>
                <input type="number" id="ValorU" name="ValorU" class="form-control" placeholder="Valor Unitario">
            </div>
        </div>     
        <div class="row">
            <div class="col col-lg-6" >
                <label>Valor Paquete</label>
                <input type="number" id="ValorP" name="ValorP" class="form-control" placeholder="Valor Paquete">
            </div>
            <div class="col col-lg-6">
                <label>Cantidad Unitario</label>
                 <input type="number" id="CantidadU" name="CantidadU" class="form-control" placeholder="Cantidad Unitario">
            </div>
        </div> 
        <div class="row">
            <div class="col col-lg-6" >
                <label>Cantidad Paquete</label>
                <input type="number" id="CantidadP" name="CantidadP" class="form-control" placeholder="Cantidad Paquete">
            </div>
            <div class="col col-lg-6">
                <label>Descripcion</label>
                <textarea rows="4" id="Descripcion" class="form-control" placeholder="Descripcion"></textarea>
            </div>
        </div> 
    </div>
</html>
