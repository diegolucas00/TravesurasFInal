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
            Productos();
        };
        ajax(ir_a, llevar, hacer);
    };

    const Productos = () => {
        let ir_a = "ListadoProductosdis";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
            dato.forEach(elemento => {
                let tr = $("<tr>");
                let td = $("<td>");
                td.html(elemento.Id);
                tr.append(td);
                let td2 = $("<td>");
                td2.html(elemento.Nombre);
                tr.append(td2);
                let td3 = $("<td>");
                let input = $("<input>");
                input.addClass("form-control");
                input.attr("type", "number");
                input.attr("id", "CantidadP" + elemento.Id);
                input.attr("name", "CantidadP" + elemento.Id);
                input.attr("value", "0");
                td3.append(input);
                tr.append(td3);
                let td4 = $("<td>");
                let input2 = $("<input>");
                input2.addClass("form-control");
                input2.attr("type", "number");
                input2.attr("id", "CantidadU" + elemento.Id);
                input2.attr("name", "CantidadU" + elemento.Id);
                input2.attr("value", "0");
                td4.append(input2);
                tr.append(td4);
                let td5 = $("<td>");
                let btn = $("<button>");
                btn.addClass("btn btn-success");
                btn.html("Agregar");
                td5.append(btn);
                tr.append(td5);

                btn.click(function () {
                    let cantidadP = $("#CantidadP" + elemento.Id).val();
                    let CantidadU = $("#CantidadU" + elemento.Id).val();

                    if (!($("#tr" + elemento.Id).length)) {
                        if (cantidadP > 0 || CantidadU > 0) {
                            ListaPedido(elemento, cantidadP, CantidadU);
                        } else {
                            swal({
                                type: 'error',
                                title: 'Oops...',
                                background: 'linear-gradient(#2BD9DD , #6ACF28)',
                                html: 'Los contadoras deben ser mayor a CERO'
                            });
                        }
                    } else {
                        swal({
                            type: 'error',
                            title: 'Oops...',
                            background: 'linear-gradient(#2BD9DD , #6ACF28)',
                            html: 'Verifique ya que este producto ya esta en el pedido'
                        });
                    }
                });

                $("#TablaProductos").append(tr);
            });
            $("#TablaProductos").dataTable();
            $("#TablaPedido").dataTable();
        };
        ajax(ir_a, llevar, hacer);
    };

    const ListaPedido = (elemento, cantidadP, CantidadU) => {
        let tr = $("<tr>");
        tr.attr("id", "tr" + elemento.Id);
        let td = $("<td>");
        td.attr("id", "IDP" + elemento.Id);
        td.html(elemento.Id);
        let input = $("<input>");
        input.addClass("datospid");
        input.attr("value", elemento.Id);
        input.hide();
        td.append(input);
        tr.append(td);
        let td2 = $("<td>");
        td2.html(elemento.Nombre);
        tr.append(td2);
        let td3 = $("<td>");
        td3.attr("id", "CanP" + elemento.Id);
        td3.html(cantidadP);
        let input2 = $("<input>");
        input2.addClass("datospcp");
        input2.attr("value", cantidadP);
        input2.hide();
        td3.append(input2);
        tr.append(td3);
        let td4 = $("<td>");
        td4.attr("id", "CanU" + elemento.Id);
        td4.html(CantidadU);
        let input3 = $("<input>");
        input3.addClass("datospcu");
        input3.attr("value", CantidadU);
        input3.hide();
        td4.append(input3);
        tr.append(td4);
        let td5 = $("<td>");
        let btn = $("<button>");
        btn.addClass("btn btn-success");
        btn.html("Retirar");
        td5.append(btn);
        tr.append(td5);

        btn.click(function () {
            $("#tr" + elemento.Id).remove();
        });

        $("#TablaPedido").append(tr);

    };


    const CrearPedido = () => {
        let ir_a = "Paginas/RegistrarPedido.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            proveedor();
            Productos();
            let btn = $("<button>");
            btn.addClass("btn btn-primary");
            btn.html("RegistrarPedido");
            btn.click(function () {
                RegistarPedido();
            });
            $("#divpedido").append(btn);

        };
        ajax(ir_a, llevar, hacer);
    };

    const RegistarPedido = () => {
        let ID = "";
        let CantidadP = "";
        let CantidadU = "";
        $(".datospid").each(function () {
            ID += $(this).val() + ";";
        });
        $(".datospcu").each(function () {
            CantidadU += $(this).val() + ";";
        });
        $(".datospcp").each(function () {
            CantidadP += $(this).val() + ";";
        });
        let ir_a = "RegistrarPedido";
        let llevar = {
            id: ID,
            cantidadp: CantidadP,
            cantidadun: CantidadU,
            idprovee: $("#selectP").val()
        };
        let hacer = (data) => {
            if (data === "OK") {
                swal({
                    type: 'success',
                    icon: 'success',
                    title: 'Completo',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: 'El producto ya esta registrado'
                });
                setTimeout(function () {
                    location.reload(1);
                }, 2000);
            } else {
                swal({
                    type: 'error',
                    title: 'Oops...',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: 'Error:' + data
                });
            }

        };
        ajax(ir_a, llevar, hacer);

    };

});
