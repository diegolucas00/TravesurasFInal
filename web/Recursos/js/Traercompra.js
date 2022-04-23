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
        $("#Estadobtn6").click(function () {
        ListaFacturaT();
    });

    const ListaFacturaT = () => {
        let ir_a = "Paginas/FacturaClie.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            ListaFactura2();
        };
        ajax(ir_a, llevar, hacer);
    };
    const ListaFactura2 = () => {
        let ir_a = "Traercompra";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
            $("#TablaClitbody").html("");
            dato.forEach(elemento => {
                let tr = $("<tr>");
                let td = $("<td>");
                td.html(elemento.Id_Factura);
                let input11 = $("<input>");
                input11.addClass("form-control Id_Factura");
                input11.val(elemento.Id_Factura);
                input11.attr("type", "number");
                input11.attr("id", "Id_Factura");
                input11.hide();
                td.append(input11);
                tr.append(td);
                let td2 = $("<td>");
                td2.html(elemento.Cliente);
                let input11 = $("<input>");
                input11.addClass("form-control Cliente");
                input11.val(elemento.Cliente);
                input11.attr("type", "number");
                input11.attr("id", "Cliente");
                input11.hide();
                td2.append(input11);
                tr.append(td2);
                let td3 = $("<td>");
                td3.html(elemento.Valor);
                let input11 = $("<input>");
                input11.addClass("form-control Valor");
                input11.val(elemento.Valor);
                input11.attr("type", "number");
                input11.attr("id", "Valor");
                input11.hide();
                td3.append(input11);
                tr.append(td3);
                let td4 = $("<td>");
                td4.html(elemento.Estado);
                let input11 = $("<input>");
                input11.addClass("form-control Estado");
                input11.val(elemento.Estado);
                input11.attr("type", "number");
                input11.attr("id", "Estado");
                input11.hide();
                td4.append(input11);
                tr.append(td4);
                let td5 = $("<td>");
                let btn = $("<button>");
                btn.addClass("btn btn-success");
                btn.html("Pago Completo");
                td5.append(btn);
                tr.append(td5);
                btn.click(function () {
                    RegistarPedido();
                });
                $("#TablaClitbody").append(tr);
            });
            $("#TablaCli").dataTable();
        };
        ajax(ir_a, llevar, hacer);
    };
    
    const RegistarPedido = () => {
         $("#datos").html(data);
        let Id_Factura = "";
        $(".datosId_Factura").each(function () {
            ID += $(this).val() + ";";
        });
        let ir_a = "RegistroPago";
        let llevar = {
            id: Id_Factura,
        };
        ajax(ir_a, llevar, hacer);
    };
    
 
});
