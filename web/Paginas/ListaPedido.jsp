<%-- 
    Document   : ListaPedido
    Created on : Apr 21, 2022, 9:56:34 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center" >
        <table class="table table-sm" id="TablaPedido">
            <thead>
                <tr>
                    <td scope="col">ID</td>
                    <td scope="col">Nombre de proveedor</td>
                    <td scope="col">Fecha de creacion</td>
                    <td scope="col">Estado</td>
                    <td scope="col">Fecha de cambio de estado</td>
                    <td scope="col">ACCION</td>
                </tr>
            </thead>
            <tbody id="TablaPedidotbody">

            </tbody>
        </table>
        <table class="table table-hover" id="TablaPedidosTotal">
            <thead>
                <tr>
                    <td scope="col">ID</td>
                    <td scope="col">ID pedido</td>
                    <td scope="col">Producto</td>
                    <td scope="col">Cantidad paquete</td>
                    <td scope="col">Cantidad Unidad</td>                    
                </tr>
            </thead>
            <tbody id="TablaPedidosTotaltbody">

            </tbody>
        </table>
    </div>
</html>
