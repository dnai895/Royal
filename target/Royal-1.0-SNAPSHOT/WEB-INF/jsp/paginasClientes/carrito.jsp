<%-- 
    Document   : listadoPlatos
    Created on : 05-may-2016, 22:22:13
    Author     : Dani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Carro | Class Royal</title>
        <jsp:include page="../css.jsp"/>
    </head>
    <body><!-- Page Content -->
        <jsp:include page="../bloques/menuRestaurante.jsp"/>
        <div class="container">

            <div class="row">
                <div class="row">
                    <div class="col-lg-10">
                        <h1 class="page-header">Carro de la compra
                        </h1>
                    </div>
                    <div class="col-lg-2">
                        <a href="#">
                            <input type="button" class="btn btn-primary fright page-header" value="Comprar" id="submit"/>
                        </a>
                    </div>
                </div>
            </div>
            <!-- /.row -->

            <c:forEach items="${carrito.getLproductos()}" var="current"> 
                <div class="row" id="producto${current.getIdProducto()}">
                    <!-- Blog Post Row -->
                    <div class="col-lg-6">
                        <div class="row item">
                            <div class="col-md-5">
                                <img class="img-responsive img-hover" src="http://placehold.it/600x300" alt="">
                            </div>
                            <div class="col-md-7">
                                <h3>
                                    ${current.getNombre()}
                                </h3>
                                <p>${current.getUnidades()} unidad/es</p>
                                <p>Precio unitario: ${current.getPrecio()}€</p>
                            <!--    <a class="btn btn-primary" href="${contextpath}/restaurante/${current.getIdProducto()}/plato.html">Editar<i class="fa fa-angle-right"></i></a> -->
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2">
                        <div class="row item">
                            <div class="col-md-12">
                                <div class="totalprice">
                                    ${current.getPrecioTotal()}€
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="col-lg-2"></div>
                    <div class="col-lg-2">
                        <div class="row item">
                            <div class="col-md-12">
                                <div class="aligncenter-v">
                                    <a class="btn btn-default btn-circle delete" producto="${current.getIdProducto()}">X</a>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                </div>
            </c:forEach>

        </div>

        <!-- /.row -->

        <hr>
        <jsp:include page="../scripts.jsp"/>
        <script type="text/javascript">
            $(document).ready(function () {
                $(".delete").click(function () {
                    var producto = this.getAttribute("producto");
                    $("#producto" + producto).hide();
                    $.ajax({
                        type: "POST",
                        url: "${contextpath}/${idRestaurante}/carrito/delete.html",
                        data: {producto: producto},
                        error: function (jqXHR, textStatus, errorThrown) {
                            alert("UPS! ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.");
                        }
                    });
                });
            });
        </script>
    </body>
</html>
