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
            $(".btnMenuP").removeClass("Activo");
            $("#Estadobtn2").addClass("Activo");
            let file = $("<input>");
            file.attr("type", "file");
            file.attr("id", "IMGProducto");
            file.attr("name", "IMGProducto");
            $("#mitadf").append(file);
            let foto;
            $("#IMGProducto").change(function (e) {
                vistaprevia(e);
                foto = e;
            });
            let select = $("<select>");
            select.addClass("form-control");
            select.attr("id", "Categoria");
            select.attr("name", "Categoria");
            $("#Categoriadiv").append(select);
            let subc = $("<select>");
            subc.addClass("form-control");
            subc.attr("id", "SubCategoria");
            subc.attr("name", "SubCategoria");
            $("#SubCategoriadiv").append(subc);
            select.change(function () {
                subcategorias();
            });
            let nombrep = $("<input>");
            nombrep.addClass("form-control");
            nombrep.attr("id", "NombreP");
            nombrep.attr("name", "NombreP");
            nombrep.attr("type", "text");
            nombrep.attr("placeholder", "Porvador digite el nombre del producto");
            nombrep.change(function () {
                $("#NombreP").val($("#NombreP").val().toUpperCase());
                $("#NombreP").html($("#NombreP").val().toUpperCase());
                VerificarP();
            });
            $("#NombrePdiv").append(nombrep);
            validarevento(foto);
        };
        ajax(ir_a, llevar, hacer);
        listaCategoria();


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

    const listaCategoria = () => {
        let ir_a = "ListaCategorias";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
            let option = $("<option>");
            option.addClass("form-control");
            option.html("....");
            option.val(0);
            option.attr("disabled", "disabled");
            option.attr("selected", "true");
            $("#Categoria").append(option);
            dato.forEach(elemento => {
                let option = $("<option>");
                option.addClass("form-control");
                option.html(elemento.Nombre);
                option.val(elemento.id);
                $("#Categoria").append(option);
            });

        };
        ajax(ir_a, llevar, hacer);
    };
    const subcategorias = () => {
        let ir_a = "ListaSubCategorias";
        let llevar = {
            id: $("#Categoria").val()
        };
        let hacer = (data) => {
            const dato = JSON.parse(data);
            let option = $("<option>");
            option.addClass("form-control");
            option.html("....");
            option.val(0);
            option.attr("disabled", "disabled");
            option.attr("selected", "true");
            $("#SubCategoria").html(option);
            dato.forEach(elemento => {
                let option = $("<option>");
                option.addClass("form-control");
                option.html(elemento.Nombre);
                option.val(elemento.id);
                $("#SubCategoria").append(option);
            });
        };
        ajax(ir_a, llevar, hacer);
    };
    const VerificarP = () => {
        let ir_a = "VerificarP";
        let llevar = {
            nombre: $("#NombreP").val()
        };
        let hacer = (data) => {
            if (data === "OK") {
                swal({
                    type: 'error',
                    title: 'Oops...',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: 'El producto ya esta registrado'
                });
            }
        };
        ajax(ir_a, llevar, hacer);
    };
    const validarevento = (e) => {
        $("#formProducto").validate({
            rules: {
                Categoria: {
                    required: true
                },
                SubCategoria: {
                    required: true
                },
                NombreP: {
                    required: true,
                    maxlength: 80
                },
                ValorU: {
                    required: true,
                    number: true
                },
                ValorP: {
                    required: true,
                    number: true
                },
                CantidadU: {
                    required: true,
                    number: true
                },
                CantidadP: {
                    required: true,
                    number: true
                }

            },
            submitHandler: function () {
                let ir_a = "RegistrarProducto";
                let llevar = {
                    subcategoria: $("#SubCategoria").val(),
                    nombrep: $("#NombreP").val(),
                    valoru: $("#ValorU").val(),
                    valorp: $("#ValorP").val(),
                    cantidadu: $("#CantidadU").val(),
                    cantidadp: $("#CantidadP").val(),
                    descripcion: $("#Descripcion").val()
                };
                let hacer = (data) => {
                    if (data === "OK") {
                        swal({
                            type: 'error',
                            title: 'Oops...',
                            background: 'linear-gradient(#2BD9DD , #6ACF28)',
                            html: 'El producto ya esta registrado'
                        });
                    }else{
                        swal({
                            type: 'error',
                            title: 'Oops...',
                            background: 'linear-gradient(#2BD9DD , #6ACF28)',
                            html: 'El producto ya esta registrado '+data
                        });
                    }
                };
                ajax(ir_a, llevar, hacer);

            }
        });
    }
    ;
});

