/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */

$(document).ready(function () {
    const ajax = (ir_a, llevar, hacer) => {
        $.ajax({
            url: ir_a,
            encoding: "UTF-8",
            data: llevar,
            type: 'POST',
            dataType: 'html',
            contentType: "application/x-www-form-urlencoded;charset=ISO-8859-15",
            success: function (data) {
                hacer(data);
            },
            error: function (xhr, status) {
                swal({
                    type: 'error',
                    title: 'Oops...',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: status + ":" + xhr + 'Porvar contate con el administrador'
                });
            }
        });
    };

    $("#Estadobtn5").click(function () {
        ListaPedidoT();
    });

    const ListaPedidoT = () => {
        let ir_a = "Paginas/Factura.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            ListadoPedidoT2();
        };
        ajax(ir_a, llevar, hacer);
    };
    const ListadoPedidoT2 = () => {
        let ir_a = "ListaPedido";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
            dato.forEach(elemento => {
                let tr = $("<tr>");
                let td = $("<td>");
                td.html(elemento.Id);
                tr.append(td);
                let td2 = $("<td>");
                td2.html(elemento.Proveedor);
                tr.append(td2);
                let td3 = $("<td>");
                td3.html(elemento.FechaCreacion);
                tr.append(td3);
                let td4 = $("<td>");
                td4.html(elemento.Estado);
                tr.append(td4);
                let td5 = $("<td>");
                td5.html(elemento.FechaCambioEstado);
                tr.append(td5);
                let td6 = $("<td>");
                let btn = $("<button>");
                btn.addClass("btn btn-success");
                btn.html("Pedido Completo");
                td6.append(btn);
                tr.append(td6);
                btn.click(function () {
                    PedidoCompleto(elemento.Id);
                });
                $("#TablaPedidotbody").append(tr);
            });
            $("#TablaPedido").dataTable();
        };
        ajax(ir_a, llevar, hacer);
    };

    const PedidoCompleto = (Id) => {
        let ir_a = "PedidoCompleto";
        let llevar = {
            id: Id
        };
        let hacer = (data) => {
            const dato = JSON.parse(data);
            $("#TablaPedidosTotaltbody").html("");
            dato.forEach(elemento => {
                let tr = $("<tr>");
                let td = $("<td>");
                td.html(elemento.Id);
                tr.append(td);
                let td2 = $("<td>");
                td2.html(elemento.FRPedido);
                tr.append(td2);
                let td3 = $("<td>");
                td3.html(elemento.Producto);
                tr.append(td3);
                let td4 = $("<td>");
                let input =
                td4.html(elemento.CantidadPaquete);
                tr.append(td4);
                let td5 = $("<td>");
                td5.html(elemento.CantidadUnidad);
                tr.append(td5);

                $("#TablaPedidosTotaltbody").append(tr);
            });
            $("#TablaPedidosTotal").dataTable();
        };
        ajax(ir_a, llevar, hacer);
    };
});
