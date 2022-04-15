<%-- 
    Document   : index
    Created on : Feb 28, 2022, 10:26:29 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>TRAVESURAS DE DOS ANGELES</title>
        <link href="Recursos/bootstrap-4.5.3-dist/bootstrap-4.5.3-dist/css/bootstrap.min.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/css/Index.css" rel="stylesheet" rel="stylesheet" type="text/css"   />
        <link href="Recursos/css/LetraCursiva.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/css/MenuP.css" rel="stylesheet" type="text/css"/>
        <link href="Recursos/css/RegistrarProducto.css" rel="stylesheet" type="text/css"/>
        <script src="Recursos/js/jquery-3.4.1.js" type="text/javascript"></script>
        <script src="Recursos/bootstrap-4.5.3-dist/bootstrap-4.5.3-dist/js/bootstrap.min.js" type="text/javascript"></script>
        <script src="Recursos/js/InicioSeccion.js" type="text/javascript"></script>
        <script src="Recursos/js/RegistrarProductos.js" type="text/javascript"></script>
        <script src="Recursos/js/Alertas.js" type="text/javascript"></script>
    </head>
    <body>
        <nav class="navbar navbar-expand-lg navbar-light ">
            <a class="navbar-brand" href="#" id="MenuLogoP"><img  src="Imagenes/LOGO.png"></a>
            <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav">
                    <li class="nav-item active">
                        <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
                    </li>
                    <li class="nav-item"  id="btnMenuP2">
                        <div class="d-flex justify-content-center" id="DivEstadobtn2">
                            <button class="btn btnMenuP" id="Estadobtn2"><img src="Imagenes/Registrar.png"></button>                        
                        </div>  
                        <div class="d-flex justify-content-center" id="btnMenuP2D">
                            <p class="Texto" id="Texto2">Registrar productos</p>         
                        </div>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link" href="#">Pricing</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link disabled" href="#">Disabled</a>
                    </li>
                </ul>
            </div>   
        </nav>
        <div class="center" id="datos">
            <div class="container" id="Containerlogin">
                <div class="row">
                    <div class="col col-lg-6">
                        <div class="container logologin">
                            <h1 class="titulo">TRAVESURAS DE DOS ANGELES</h1>
                            <img class="LogoT" src="Imagenes/LOGO.png" width="350" height="200" >   
                        </div>
                    </div>          
                    <div class="col col-lg-6" id="loginiz">
                        <h1>Inicion de seccion</h1>
                        <div class="row">
                            <div class="col col-lg-6">
                                <label>Usuario</label>
                                <input type="text" id="Usuario" name="LugarE" class="form-control" placeholder="Porfavor digite el usuario">
                            </div>                            
                        </div>
                        <div class="row">
                            <div class="col col-lg-6" id="loginder">
                                <label>Contraseña</label>
                                <input type="password" id="Contra"  name="CostoE" class="form-control" placeholder="porfavor digite la contraseña">
                            </div>

                        </div>
                        <button class="btn btn-info colorbtn" id="ingresar">Ingresar</button>
                    </div>
                </div>
            </div>
        </div>
        <div id="reboto">               
        </div>
        <h1 id="bienvenida">!HOLA ANGELES!</h1>        
    </body>
</html>
