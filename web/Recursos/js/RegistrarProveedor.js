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
    $("#Estadobtn3").click(function () {
        RegistrarP();
    });

    const RegistrarP = () => {
        let ir_a = "Paginas/RProveedor.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            $(".btnMenuP").removeClass("Activo");
            $("#Estadobtn3").addClass("Activo");

            let select = $("<select>");
            let nombrep = $("<input>");
            nombrep.addClass("form-control");
            nombrep.attr("id", "NIT");
            nombrep.attr("name", "NIT");
            nombrep.attr("type", "number");
            nombrep.attr("value", "");
            nombrep.attr("placeholder", "Porvador digite el NIT");
            $("#Nitdiv").append(nombrep);
            let span = $("<span>");
            span.addClass("input-group-text");
            span.text("-");
            $("#Nitdiv").append(span);
            let nombrep2 = $("<input>");
            nombrep2.addClass("form-control");
            nombrep2.attr("id", "NIT2");
            nombrep2.attr("name", "NIT2");
            nombrep2.attr("type", "text");
            nombrep2.attr("maxlength", "1");
            nombrep2.attr("size", "1");
            $("#Nitdiv").append(nombrep2);
            nombrep2.change(function () {
                VerificarPro();
            });

            select.addClass("form-control selectpicker");
            select.attr("id", "Categoria");
            select.attr("name", "Categoria");
            select.attr("multiple", "multiple");

            $("#Categoriadiv").append(select);
            select.select2();

            /*Modificar*/
            let btnm = $("<button>");
            btnm.addClass("btn btn-warning");
            btnm.attr("id", "Modificar");
            btnm.html("Modificar");
            $("#Butons").append(btnm);
            btnm.click(function () {
                Modificar();
            });


            validarproveedor();
        };
        ajax(ir_a, llevar, hacer);
        listaCategoria();


    };

    const VerificarPro = () => {
        let ir_a = "VerificarPro";
        let llevar = {
            nit2: $("#NIT2").val(),
            nit: $("#NIT").val()
        };
        let hacer = (data) => {
            if (data === "OK") {
                swal({
                    type: 'error',
                    title: 'Oops...',
                    background: 'linear-gradient(#2BD9DD , #6ACF28)',
                    html: 'El proveedor ya esta registrado'
                });
            }
        };
        ajax(ir_a, llevar, hacer);
    };

    const listaCategoria = () => {
        let ir_a = "ListaCategorias";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
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
    const validarproveedor = () => {
        $("#formProveedor").validate({
            rules: {
                Nit: {
                    required: true,
                    number: true,
                    min: 7,
                    max: 12
                },
                Nit2: {
                    required: true,
                    number: true,
                    min: 1,
                    max: 1
                },
                NombreE: {
                    required: true
                },
                NombreV: {
                    required: true,
                },
                Correo: {
                    email: true
                },
                Celular: {
                    number: true
                },
                CantidadU: {
                    number: true,
                    min: 6,
                    max: 10
                },
                Categoria: {
                    required: true
                },

            },
            submitHandler: function () {
                let categoria = $("#Categoria").val();
                let categoria1 = "";
                categoria.forEach(elemento => {
                    categoria1 = categoria1 + ";" + elemento;
                });
                alert(categoria1);
                let ir_a = "RegistrarProveedor";
                let llevar = {
                    NIT: $("#NIT").val(),
                    NIT2: $("#NIT2").val(),
                    nombree: $("#NombreE").val(),
                    nombrev: $("#NombreV").val(),
                    correo: $("#Correo").val(),
                    celular: $("#Celular").val(),
                    direccion: $("#Direccion").val(),
                    categoira: categoria1
                };
                let hacer = (data) => {
                    if (data === "OK") {
                        swal({
                            type: 'success',
                            icon: 'success',
                            title: 'Oops...',
                            background: 'linear-gradient(#2BD9DD , #6ACF28)',
                            html: 'El producto ya esta registrado'
                        });
                    } else {
                        swal({
                            type: 'error',
                            title: 'Oops...',
                            background: 'linear-gradient(#2BD9DD , #6ACF28)',
                            html: 'El producto ya esta registrado ' + data
                        });
                    }
                };
                ajax(ir_a, llevar, hacer);

            }
        });
    };
    /*_____________ modificar___________________________*/
    const Modificar = () => {
        let ir_a = "Paginas/ModificarProducto.jsp";
        let llevar;
        let hacer = (data) => {
            $("#datos").html(data);
            let select = $("<select>"); 
            select.addClass("form-control selectpicker");
            select.attr("id", "IdProveedor");
            select.attr("name", "IdProveedor");
            select.attr("multiple", "multiple");
            select.select2();
            $("#selecpro").append(select);
            
            validarproveedorConsultar();
        };
        ajax(ir_a, llevar, hacer);
    };
    
     const validarproveedorConsultar = () => {
        $("#formProveedorModificarC").validate({
            rules: {
                IdProveedor:{
                     required: true
                },

            },
            submitHandler: function () {
                 $("#datos").html("hola");

            }
        });
    };

});