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

    $("#Estadobtn4").click(function () {
        TraerProductosAgotados();
    });

    const TraerProductosAgotados = () => {
        let ir_a = "Paginas/Pedido.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            ConsultarPedidoFaltante();
        };
        ajax(ir_a, llevar, hacer);

    };
    const ConsultarPedidoFaltante = () => {
        let ir_a = "Paginas/Pedido.jsp";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
            dato.forEach(elemento => {
                
            });
        };
        ajax(ir_a, llevar, hacer);
    };
});