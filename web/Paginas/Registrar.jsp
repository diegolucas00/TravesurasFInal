<%-- 
    Document   : Registrar
    Created on : Mar 29, 2022, 10:17:41 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center">
        <div class="d-flex justify-content-center mitad" id="mitadf" >
                       
        </div>        
        <div class="d-flex justify-content-center mitad" >
            <img src="Imagenes/Foto.png" id="ImgSubida" class="inativo">            
        </div>   
       
        <div class="row">
            <div class="col col-lg-6">
                <label>Nombre del evento</label>
                <input type="text" id="NombreE" name="NombreE"  class="form-control" placeholder="Porfavor digite el nombre del evento">
            </div>
            <div class="col col-lg-6">
                <label>Fecha inicio</label>
                <input type="date" id="FechaIE" name="FechaIE" class="form-control">
            </div>
        </div>        
    </div>
</html>
