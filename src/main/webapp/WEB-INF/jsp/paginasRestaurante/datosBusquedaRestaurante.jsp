<%-- 
    Document   : registro
    Created on : 29-abr-2016, 19:00:26
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Perfil restaurante | Class Royal</title>
        <!-- Bootstrap Core CSS -->

        <jsp:include page="../css.jsp"/>
    </head>
    <body>

        <jsp:include page="../bloques/menuRestaurante.jsp"/>

        <!-- Page Content -->
        <div class="container panel padding-twice">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-xs-12">
                    <h1 class="page-header">Datos a mostrar a los clientes
                    </h1>
                    <!--    <ol class="breadcrumb">
                            <li><a href="index.html">Home</a>
                            </li>
                            <li class="active">Full Width Page</li>
                        </ol>
                    -->
                </div>
            </div>
            <!-- /.row -->

            <!-- Content Row -->
            <div class="row">
                <div class="col-xs-12">
                    <form id="fbusqueda" name="fbusqueda" method="POST" action="#" enctype="multipart/form-data">
                        <div class="panel">
                            <div class="row"><div class="col-xs-12"><h4  class="page-header">Datos página home</h4></div></div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Intro:</label>
                                            <textarea class="form-control" id="intro" name="intro">${restaurante.getIntro()}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Descripción:</label>
                                            <textarea class="form-control" id="descripcion" name="descripcion">${restaurante.getDescripcion()}</textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Imagen portada:</label>
                                            <input  type="file" name="imgPortada" id="imgPortada"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Imagen listados:</label>
                                            <input  type="file" name="imgListados" id="imgListados"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="panel">
                            <div class="row"><div class="col-xs-12"><h4  class="page-header">Datos mapa</h4></div></div>
                            <div class="row">
                                <div class="col-xs-6">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Latitud:</label>
                                            <input  type="text" name="latitud" id="latitud" value="${restaurante.getLatitud()}"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-xs-6">
                                    <div class="control-group form-group">
                                        <div class="controls">
                                            <label>Longitud:</label>
                                            <input  type="text" name="longitud" id="longitud" value="${restaurante.getLongitud()}"/>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="row"><div class="col-xs-12 info-extra">*Si no sabes tus coordenadas ves a Google Maps y haz clic izquierdo sobre tu establecimiento. Seguidamente se te abrira un pop-up con tus coordenadas.</div></div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <div class="control-group form-group">
                                    <div class="controls">
                                        <input type="button" class="btn btn-primary fright" value="Guardar" id="submit"/>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
            <!-- /.row -->
            <hr>
        </div>
        <script type="text/javascript">
            $("#submit").click(function () {
                var formData = new FormData(document.getElementById("fbusqueda"));
                $.ajax({
                    type: "POST",
                    url: "${contextpath}/restaurante/datos-busqueda.html",
                    data: formData,
                    cache: false,
                    contentType: false,
                    processData: false,
                    success: function (result) {
                        if (result === "ok") {
                            alert("Datos guardados correctamente");
                            window.location = "${contextpath}/restaurante/home.html";
                        } else if (result === "kopasswd") {
                            alert("Las contraseñas no coinciden. Vuelva a introducirlas y vuelva a intentarlo.");
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        alert("UPS! ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.");
                    }
                });
            });
        </script>
        <!-- /.container -->
        <jsp:include page="../scripts.jsp"/>
    </body>
</html>
