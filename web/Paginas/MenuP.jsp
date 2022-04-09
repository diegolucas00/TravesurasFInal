<%-- 
    Document   : MenuP
    Created on : Mar 26, 2022, 1:45:21 PM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>    
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
</html>
