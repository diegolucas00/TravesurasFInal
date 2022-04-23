<%-- 
    Document   : Factura
    Created on : Apr 21, 2022, 11:50:19 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center" >
        <div class="d-flex justify-content-center mitad" >
            <h1 class="titulo">Factura Cliente</h1>                      
        </div>
        <table class="table table-hover" id="TablaProductos">
            <thead>
                <tr>
                    <td scope="col">ID</td>
                    <td scope="col">Producto</td>
                    <td scope="col">Cantidad Paquete</td>
                    <td scope="col">Cantidad unidad</td>
                    <td scope="col">ACCION</td>
                </tr>
            </thead>
            <tbody id="TablaProductostbody">

            </tbody>
        </table>
        <table class="table table-hover table-dark" id="TablaPedido">
            <thead>
                <tr>
                    <td scope="col">ID</td>
                    <td scope="col">Producto</td>
                    <td scope="col">Cantidad Paquete</td>
                    <td scope="col">Cantidad unidad</td>
                    <td scope="col">ACCION</td>
                </tr>
            </thead>
            <tbody id="TablaPedidotbody">

            </tbody>
        </table>
    </div>
</html>
