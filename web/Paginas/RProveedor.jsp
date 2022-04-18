<%-- 
    Document   : RProveedor
    Created on : Apr 17, 2022, 12:06:44 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center">
        <div class="d-flex justify-content-center mitad" >
            <h1 class="titulo">Registrar Proveedor</h1>                      
        </div>  
        <form id="formProveedor" method="post" action="" >
            <div class="row">
                <div class="col col-lg-6" >
                    <label>NIT<span>*</span></label> 
                    <div class="input-group mb-3"id="Nitdiv">                       
                        <div class="input-group-append" id="Nitdiv2">                            
                        </div>                        
                    </div>
                </div>
                <div class="col col-lg-6" id="SubCategoriadiv">
                    <label>Nombre de la empresa<span>*</span></label>
                    <input type="text" class="form-control" id="NombreE" name="NombreE" placeholder="Porvafor digite el nombre de la empresa">
                </div>  
            </div>   
            <div class="row">
                <div class="col col-lg-6" id="NombrePdiv">
                    <label>Nombre del vendedor<span>*</span></label>
                    <input type="text" class="form-control" id="NombreV" name="NombreV" placeholder="Porvafor digite el nombre del vendedor">
                </div>
                <div class="col col-lg-6">
                    <label>Correo</label>
                    <input type="text" id="Correo" name="Correo" class="form-control" placeholder="Porfavor digite el correo" >
                </div>
            </div>     
            <div class="row">
                <div class="col col-lg-6" >
                    <label>Celular</label>
                    <input type="number" id="Celular" name="Celular" class="form-control" placeholder="Porfavor digite el ceular" >
                </div>
                <div class="col col-lg-6" >
                    <label>Direccion</label>
                    <input type="text" id="Direccion" name="Direccion" class="form-control" placeholder="Porfavor digite la direccion" >
                </div>

            </div> 
            <div class="row">
                <div class="col col-lg-6" id="Categoriadiv">
                    <label>Categoria<span>*</span></label>   
                </div>                
            </div> 
            <div class="d-flex justify-content-center mitad">
                <button class="btn btn-info" id="EnviarProducto" name="EnviarProducto">Registrar</button>
            </div>
        </form>
        <div class="d-flex justify-content-center mitad" id="Butons" ></</div>
    </div>
</html>
