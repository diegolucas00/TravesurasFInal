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
    $("#ingresar").click(function () {
        let ir_a = "Inicioseesion";
        let llevar = {
            usuario: $("#Usuario").val(),
            contra: $("#Contra").val()
        };
        let hacer = (data) => {
            if (data === "Ok") {
                swal({
                    type: 'success',
                    icon: 'success',
                    title: 'Completo',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: '!BIENBENIDO!'
                });
                setTimeout(function () {
                    location.reload(1);
                }, 2000);
                CATALOGO();
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
    });


    $("#MenuLogoP").click(function () {
        setTimeout(function () {
            location.reload(1);
        }, 2000);
    });

});

