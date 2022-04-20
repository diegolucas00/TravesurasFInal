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
                option.attr("id", "OP" + elemento.id);
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
                    required: true
                },
                Correo: {
                    email: true
                },
                Celular: {
                    number: true
                },
                Direccion: {
                    required: true
                },
                Categoria: {
                    required: true
                }

            },
            submitHandler: function () {
                let categoria = $("#Categoria").val();
                let categoria1 = "";
                categoria.forEach(elemento => {
                    categoria1 = categoria1 + ";" + elemento;
                });
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
                            background: 'linear-gradient(red , #6ACF28)',
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
            $("#selecpro").append(select);
            $("#ModificarProveedor").hide();
            TraerProveedores();
            validarproveedorConsultar();
        };
        ajax(ir_a, llevar, hacer);

    };

    const TraerProveedores = () => {
        let ir_a = "TraerProveedores";
        let llevar;
        let hacer = (data) => {
            const dato = JSON.parse(data);
            dato.forEach(elemento => {
                let option = $("<option>");
                option.addClass("form-control");
                option.html(elemento.Id + " - " + elemento.NombreEmpresa + " - " + elemento.NombreVendedor);
                option.val(elemento.Id);
                $("#IdProveedor").append(option);
            });
        };
        ajax(ir_a, llevar, hacer);
    };
    const validarproveedorConsultar = () => {
        $("#formProveedorModificarC").validate({
            rules: {
                IdProveedor: {
                    required: true
                }

            },
            submitHandler: function () {
                let ir_a = "TraerDatosProveedor";
                let llevar = {
                    Id: $("#IdProveedor").val()
                };
                let hacer = (data) => {
                    const dato = JSON.parse(data);
                    dato.forEach(elemento => {
                        let div = $("<div>");
                        div.addClass("row");
                        let div1 = $("<div>");
                        div1.addClass("col col-lg-6");
                        let label = $("<label>");
                        label.html("Id de proveedor");
                        let input = $("<input>");
                        input.addClass("form-control");
                        input.attr("type", "number");
                        input.attr("name", "Id");
                        input.attr("Id", "Id");
                        input.attr("disabled", "disabled");
                        input.attr("value", elemento.Id);
                        div.append(div1);
                        div1.append(label);
                        div1.append(input);
                        /*------------------*/
                        let div3 = $("<div>");
                        div3.addClass("col col-lg-6");
                        let label2 = $("<label>");
                        label2.html("NIT de proveedor");
                        let input2 = $("<input>");
                        input2.addClass("form-control");
                        input2.attr("type", "text");
                        input2.attr("name", "NITM");
                        input2.attr("Id", "NITM");
                        input2.attr("disabled", "disabled");
                        input2.attr("value", elemento.NIT);
                        div.append(div3);
                        div3.append(label2);
                        div3.append(input2);
                        $("#divmod").html(div);
                        /* ppppppppppppppppppppppppppppp*/
                        div = $("<div>");
                        div.addClass("row");
                        div1 = $("<div>");
                        div1.addClass("col col-lg-6");
                        label = $("<label>");
                        label.html("Nombre de la empresa");
                        input = $("<input>");
                        input.addClass("form-control");
                        input.attr("type", "text");
                        input.attr("name", "NombreEmpresa");
                        input.attr("Id", "NombreEmpresa");
                        input.attr("value", elemento.NombreEmpresa);
                        div.append(div1);
                        div1.append(label);
                        div1.append(input);
                        /*------------------*/
                        div3 = $("<div>");
                        div3.addClass("col col-lg-6");
                        label2 = $("<label>");
                        label2.html("Nombre del vendedor");
                        input2 = $("<input>");
                        input2.addClass("form-control");
                        input2.attr("type", "text");
                        input2.attr("name", "NombreVendedor");
                        input2.attr("Id", "NombreVendedor");
                        input2.attr("value", elemento.NombreVendedor);
                        div.append(div3);
                        div3.append(label2);
                        div3.append(input2);
                        $("#divmod").append(div);
                        /* ppppppppppppppppppppppppppppp*/
                        div = $("<div>");
                        div.addClass("row");
                        div1 = $("<div>");
                        div1.addClass("col col-lg-6");
                        label = $("<label>");
                        label.html("Correo");
                        input = $("<input>");
                        input.addClass("form-control");
                        input.attr("type", "text");
                        input.attr("name", "Correo");
                        input.attr("Id", "Correo");
                        input.attr("value", elemento.Correo);
                        div.append(div1);
                        div1.append(label);
                        div1.append(input);
                        /*------------------*/
                        div3 = $("<div>");
                        div3.addClass("col col-lg-6");
                        label2 = $("<label>");
                        label2.html("Celular");
                        input2 = $("<input>");
                        input2.addClass("form-control");
                        input2.attr("type", "text");
                        input2.attr("name", "Celular");
                        input2.attr("Id", "Celular");
                        input2.attr("value", elemento.Celular);
                        div.append(div3);
                        div3.append(label2);
                        div3.append(input2);
                        $("#divmod").append(div);
                        /* ppppppppppppppppppppppppppppp*/
                        div = $("<div>");
                        div.addClass("row");
                        div1 = $("<div>");
                        div1.addClass("col col-lg-6");
                        label = $("<label>");
                        label.html("Direccion");
                        input = $("<input>");
                        input.addClass("form-control");
                        input.attr("type", "text");
                        input.attr("name", "Direccion");
                        input.attr("Id", "Direccion");
                        input.attr("value", elemento.Direccion);
                        div.append(div1);
                        div1.append(label);
                        div1.append(input);

                        div1 = $("<div>");
                        div1.addClass("col col-lg-6");
                        let select = $("<select>");
                        label = $("<label>");
                        label.html("Direccion");
                        select.addClass("form-control selectpicker");
                        select.attr("id", "Categoria");
                        select.attr("name", "Categoria");
                        select.attr("multiple", "multiple");
                        div.append(div1);
                        div1.append(label);
                        div1.append(select);

                        $("#divmod").append(div);
                        listaCategoria();
                        selepcionador(elemento.Id);
                        $("#ModificarProveedor").show();
                        validarproveedorM();
                        $("#ConsultarProducto").hide();
                        $("#IdProveedor").attr("disabled", true);

                    });
                };
                ajax(ir_a, llevar, hacer);
                $("#Categoria").select2();
            }
        });
    };

    const selepcionador = (a) => {
        let ir_a = "ListaCategoriasProvee";
        let llevar = {
            numero: a
        };
        let hacer = (data) => {
            const dato = JSON.parse(data);
            dato.forEach(elemento => {
                $("#OP" + elemento.id).attr("selected", true);
            });
            $("#Categoria").select2();

        };
        ajax(ir_a, llevar, hacer);
    };

    const validarproveedorM = () => {
        $("#formProveedorModificarR").validate({
            rules: {
                Id: {
                    required: true,
                    number: true
                },
                Nit: {
                    required: true,
                    number: true,
                    min: 7,
                    max: 12
                },
                NombreEmpresa: {
                    required: true
                },
                NombreVendedor: {
                    required: true
                },
                Correo: {
                    email: true
                },
                Celular: {
                    number: true
                },
                Direccion: {
                    required: true
                },
                Categoria: {
                    required: true
                }

            },
            submitHandler: function () {
                let categoria = $("#Categoria").val();
                let categoria1 = "";
                categoria.forEach(elemento => {
                    categoria1 = categoria1 + ";" + elemento;
                });
                let ir_a = "ModificarProveedor";
                let llevar = {
                    NIT: $("#NITM").val(),
                    id: $("#Id").val(),
                    nombree: $("#NombreEmpresa").val(),
                    nombrev: $("#NombreVendedor").val(),
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
                            html: 'El producto ya esta registrado ' + data
                        });
                    }
                };
                ajax(ir_a, llevar, hacer);

            }
        });
    };

});