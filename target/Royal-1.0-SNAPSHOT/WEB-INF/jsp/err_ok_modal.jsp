<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">

<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Class Royal</title>

        <!-- Bootstrap Core CSS -->
        <link href="css/bootstrap.min.css" rel="stylesheet">

        <!-- Custom CSS -->
        <link href="css/agency.css" rel="stylesheet">
        <link href="css/custom_landing.css" rel="stylesheet">    

        <!-- Custom Fonts -->
        <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
        <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
        <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
        <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>        <title>Welcome to Spring Web MVC project</title>
    </head>

    <body>
       <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Login restaurante</h4>
          </div>
          <div class="modal-body">
            <form id="login" name="login" method="POST" action="${contextpath}/usuarios/landing.html">
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Usuario:</label>
                        <input class="form-control" id="username" name="username" value=""/>
                    </div>
                </div>          
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Contraseña:</label>
                        <input type="password" class="form-control" id="passwd" name="passwd" value=""/>
                        <span class="help-block fright"><a href="${contextpath}/usuarios/registro.html">¿Aún no estás registrado? ¡Regístrate!</a></span>
                        <input type="button" class="btn btn-primary fright" value="Entrar" id="submitRest"/>
                    </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
      </div>       
    </body>
</html>
