<%-- 
    Document   : FacturaVerMas
    Created on : Apr 22, 2022, 10:09:09 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <div class="container DatosPosition center" id="facturadiv">
        <div class="d-flex justify-content-center mitad" >
            <h1 class="titulo">Factura</h1>                      
        </div>
        <table class="table table-sm" id="TablaPedido">
            <thead>
                <tr>
                    <td scope="col">ID</td>
                    <td scope="col">ID pedido</td>
                    <td scope="col">Fecha de creacion</td>
                    <td scope="col">Sub Total</td>
                    <td scope="col">IVA</td>
                    <td scope="col">TOTAL</td>
                    <td scope="col">ACCION</td>
                </tr>
            </thead>
            <tbody id="TablaPedidotbody">

            </tbody>
        </table>
        <table class="table table-hover table-dark" id="TablaPedidosTotal">
            <thead>
                <tr>
                    <td scope="col">ID</td>
                    <td scope="col">ID Factura Pedido</td>
                    <td scope="col">Producto</td>
                    <td scope="col">Cantidad paquete</td>
                    <td scope="col">Valor Paquete</td>       
                    <td scope="col">Cantidad Unidad</td>                    
                    <td scope="col">Valor Unitario</td>                    
                    <td scope="col">Valor IVA</td>                    
                    <td scope="col">Valor Total</td>   
                </tr>
            </thead>
            <tbody id="TablaPedidosTotaltbody">

            </tbody>
        </table>
       
    </div>
</html>
