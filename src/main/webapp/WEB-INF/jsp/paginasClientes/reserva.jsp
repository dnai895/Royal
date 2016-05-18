<%-- 
    Document   : home
    Created on : 04-may-2016, 19:39:46
    Author     : Dani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>
            Reserva | Class Royal
        </title>

        <jsp:include page="../css.jsp"/>

    </head>

    <body>

        <jsp:include page="../bloques/menuCliente.jsp" />

        <!-- Page Content -->
        <div class="container panel padding-twice">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">

                    <h1 class="page-header">
                        Reserva
                    </h1>
                    <!--    <ol class="breadcrumb">
                            <li><a href="index.html">Home</a>
                            </li>
                            <li class="active">Four Column Portfolio</li>
                        </ol>
                    -->
                </div>
            </div>
            <!-- /.row -->

            <div class="row">
                <div class="col-lg-12">
                    <form id="mesa" name="mesa" action="#">

                        <!-- Text input-->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="control-group form-group">
                                    <div class="controls">
                                        <label>Número personas:</label>
                                        <input id="personas" name="personas" class="form-control input-md" type="number" value="">
                                    </div>
                                </div>
                            </div>
                        </div>           
                        
                        <!-- Text input-->
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="control-group form-group">
                                    <div class="controls">
                                        <label>Turno:</label>
                                        <select class="form-control" id="turno" name="turno">
                                            <option value="1">Comida</option>
                                            <option value="2">Cena</option>
                                        </select> 
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-12">
                                <div class="control-group form-group">
                                    <%--        <div class="input-group date" data-provide="datepicker">
                                                <input id="fecha" name="fecha" type="text" class="form-control " data-date-format="YYYY-MM-DD">
                                                <div class="input-group-addon">
                                                    <span class="glyphicon glyphicon-th"></span>
                                                </div>
                                            </div>
                                    --%>
                                    <div class="input-append date" id="dp3" data-date="18-05-2016" data-date-format="dd/mm/yyyy">
                                        <label>Día:</label>
                                        <input class="form-control span2" size="16" type="text" value="18/05/2016">
                                        <span class="add-on"><i class="icon-th"></i></span>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-lg-8">
                            </div>
                            <div class="col-lg-2">
                            </div>
                            <div class="col-lg-2">
                                <input type="button" class="btn btn-primary fright" value="Reservar" id="submit"/>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>
        <!-- /.row -->

    </div>
    <!-- /.container -->

    <script type="text/javascript">
        $(document).ready(function() {
          $(".span2").datepicker({
         format: 'dd/mm/yyyy'
         });
        });
        $("#submit").click(function() {
        $.ajax({
        type: "POST",
        <c:if test="${action == 1}">
        url: "${contextpath}/restaurante/0/mesa.html",
        </c:if>
        <c:if test="${action == 2}">
        url: "${contextpath}/restaurante/${mesa.getIdMesa()}/mesa.html",
        </c:if>
        data: $("#mesa").serialize(),
                success: function(result){
                if (result === "ok") {
                window.location = "${contextpath}/restaurante/home.html";
                } else {
                alert("¡Datos incorrectos!");
                }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                alert("UPS! ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.");
                }
        });
        });
        $("#btnEliminar").click(function() {
        $("#action").val(3);
        $("#submit").click();
        });
    </script>

    <jsp:include page="../scripts.jsp"/>

</body>

</html>
