<%-- 
    Document   : ModificarProducto
    Created on : Apr 17, 2022, 8:22:30 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center">
        <form id="formProveedorModificarC" method="post" action="" >
            <div class="d-flex justify-content-center mitad" >
                <h1 class="titulo">Modificar Proveedor</h1>                      
            </div> 
            <div class="d-flex justify-content-center mitad" id="selecpro">

            </div>
            <div class="d-flex justify-content-center mitad" >
                <button class="btn btn-success" id="ConsultarProducto" name="ConsultarProducto">Consultar</button>
            </div>
        </form>
        <form id="formProveedorModificarR" method="post" action="" >
            <div  id="divmod" >
                
            </div>
            <div class="d-flex justify-content-center mitad" >
                <button class="btn btn-info" id="ModificarProveedor" name="ModificarProveedor">Modificar</button>
            </div>
        </form>
    </div>
</html>
