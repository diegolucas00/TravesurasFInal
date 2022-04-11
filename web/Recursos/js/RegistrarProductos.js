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

    $("#Estadobtn2").click(function () {
        RegistrarP();
    });

    const RegistrarP = () => {
        let ir_a = "Paginas/Registrar.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            $("#Estadobtn2").addClass("Activo");
            let file = $("<input>");
            file.attr("type", "file");
            file.attr("id", "IMGProducto");
            $("#mitadf").append(file);
            $("#IMGProducto").change(function (e) {
                vistaprevia(e);
            });
            let select = $("<select>");
            select.addClass("form-control");
            select.attr("id", "Categoria");
            $("#Categoriadiv").append(select);
            TraerCategoria();

        };
        ajax(ir_a, llevar, hacer);

    };
    const vistaprevia = (e) => {
        let leer = new FileReader();
        leer.readAsDataURL(e.target.files[0]);

        leer.onload = function () {
            let VistaPrevia = document.getElementById("ImgSubida");
            VistaPrevia.src = leer.result;
            $(".inativo").toggleClass("cambio1");
        };
    };
    const TraerCategoria = () => {
        let ir_a = "Paginas/Registrar.jsp";
        let llevar;
        let hacer = (data) => {
            
        };
        ajax(ir_a, llevar, hacer);
    };


});

