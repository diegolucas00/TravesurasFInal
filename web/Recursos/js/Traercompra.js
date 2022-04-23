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
        let ir_a = "TraerProductosMo";
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
                let td6 = $("<td>");
                td6.html(elemento.ValorPaquete);
                tr.append(td6);
                let td4 = $("<td>");
                let input2 = $("<input>");
                input2.addClass("form-control");
                input2.attr("type", "number");
                input2.attr("id", "CantidadU" + elemento.Id);
                input2.attr("name", "CantidadU" + elemento.Id);
                input2.attr("value", "0");
                td4.append(input2);
                tr.append(td4);
                let td7 = $("<td>");
                td7.html(elemento.ValorUnidad);
                tr.append(td7);
                let td5 = $("<td>");
                let btn = $("<button>");
                btn.addClass("btn btn-success");
                btn.html("Agregar Carrito");
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

        let td6 = $("<td>");
        td6.attr("id", "IDP" + elemento.Id);
        td6.html(parseInt(elemento.ValorPaquete) * parseInt(cantidadP));
        let input6 = $("<input>");
        input6.addClass("datospvp");
        input6.val(parseInt(elemento.ValorPaquete) * parseInt(cantidadP));
        input6.hide();
        td6.append(input6);
        tr.append(td6);

        let td4 = $("<td>");
        td4.attr("id", "CanU" + elemento.Id);
        td4.html(CantidadU);
        let input3 = $("<input>");
        input3.addClass("datospcu");
        input3.attr("value", CantidadU);
        input3.hide();
        td4.append(input3);
        tr.append(td4);

        let td7 = $("<td>");
        td7.attr("id", "IDP" + elemento.Id);
        td7.html(parseInt(elemento.ValorUnidad) * parseInt(CantidadU));
        let input7 = $("<input>");
        input7.addClass("datospvu");
        input7.val(parseInt(elemento.ValorUnidad) * parseInt(CantidadU));
        input7.hide();
        td7.append(input7);
        tr.append(td7);

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

        let btn5 = $("<button>");
        btn5.addClass("btn btn-success");
        btn5.html("Calcular");
        $("#btncalcular").html(btn5);

        btn5.click(function () {
            let datospvp = 0;
            let datospvu = 0
            $(".datospvp").each(function () {
                datospvp += parseInt($(this).val());
            });
            $(".datospvu").each(function () {
                datospvu += parseInt($(this).val());
            });


            let input = $("<input>");
            input.addClass("form-control TOTALT");
            input.val(datospvp + datospvu);
            input.attr("type", "number");
            input.attr("id", "TOTALT");
            input.attr("disabled", true);

            $("#Total").html(input);
            let btn10 = $("<button>");
            btn10.addClass("btn btn-info");
            btn10.html("Registrar");
            $("#btncalcular").append(btn10);
            btn10.click(function () {
                RegistrarFacturaCompra();
            });
        });
    };

    const RegistrarFacturaCompra = () => {
        let ir_a = "RegistrarFacturaCompra";

        let datospid = "";
        let datospcp = "";
        let datospvp = "";
        let datospcu = "";
        let datospvu = "";      
        let TOTALT = $("#TOTALT").val();
        
        $(".datospid").each(function () {
            datospid += $(this).val() + ";";
        });
        $(".datospcp").each(function () {
            datospcp += $(this).val() + ";";
        });
        $(".datospvp").each(function () {
            datospvp += $(this).val() + ";";
        });
        $(".datospcu").each(function () {
            datospcu += $(this).val() + ";";
        });
        $(".datospvu").each(function () {
            datospvu += $(this).val() + ";";
        });

        let llevar = {
            datospid: datospid,
            datospcp: datospcp,
            datospvp: datospvp,
            datospcu: datospcu,
            datospvu: datospvu,            
            TOTALT: TOTALT            
        };
        let hacer = (data) => {
            if (data === "OK") {
                swal({
                    type: 'success',
                    icon: 'success',
                    title: 'Completo',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: 'La factura ya esta registrado'
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
