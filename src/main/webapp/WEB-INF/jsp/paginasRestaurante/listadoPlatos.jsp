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
        <title>Platos | Class Royal</title>
        <jsp:include page="../css.jsp"/>
    </head>
    <body><!-- Page Content -->
        <jsp:include page="../bloques/menu.jsp"/>
        <div class="container">

            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">Platos
                    </h1>
                </div>
            </div>
            <div class="row">
                <ul class="nav nav-tabs nav-justified">
                    <li><a data-toggle="tab" href="#comidas">Comidas</a></li>
                    <li><a data-toggle="tab" href="#bebidas">Bebidas</a></li>
                    <li><a data-toggle="tab" href="#postres">Postres</a></li>
                </ul>
            </div>
            <!-- /.row -->
            <div class="row">
                <!-- Blog Post Row -->
                <div class="tab-content">
                    <div id="comidas" class="tab-pane fade in active">
                        <c:forEach items="${lcomida}" var="current"> <%-- COMIDAS --%>
                            <div class="row item">
                                <div class="col-md-5">
                                        <img class="img-responsive img-hover" src="http://placehold.it/600x300" alt="">
                                </div>
                                <div class="col-md-7">
                                    <h3>
                                        ${current.getNombre()}
                                    </h3>
                                    <p>${current.getDescripcion()}</p>
                                    <p>${current.getPrecio()}€</p>
                                    <a class="btn btn-primary" href="${contextpath}/restaurante/${current.getIdProducto()}/plato.html">Editar<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="bebidas" class="tab-pane fade">
                        <c:forEach items="${lbebida}" var="current"> <%-- BEBIDAS --%>
                            <div class="row item">
                                <div class="col-md-5">
                                        <img class="img-responsive img-hover" src="http://placehold.it/600x300" alt="">
                                </div>
                                <div class="col-md-7">
                                    <h3>
                                        ${current.getNombre()}
                                    </h3>
                                    <p>${current.getDescripcion()}</p>
                                    <p>${current.getPrecio()}€</p>
                                    <a class="btn btn-primary" href="${contextpath}/restaurante/${current.getIdProducto()}/plato.html">Editar<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="postres" class="tab-pane fade">
                        <c:forEach items="${lpostre}" var="current"> <%-- BEBIDAS --%>
                            <div class="row item">
                                <div class="col-md-5">
                                        <img class="img-responsive img-hover" src="http://placehold.it/600x300" alt="">
                                </div>
                                <div class="col-md-7">
                                    <h3>
                                        ${current.getNombre()}
                                    </h3>
                                    <p>${current.getDescripcion()}</p>
                                    <p>${current.getPrecio()}€</p>
                                    <a class="btn btn-primary" href="${contextpath}/restaurante/${current.getIdProducto()}/plato.html">Editar<i class="fa fa-angle-right"></i></a>
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <!-- /.row -->

            <hr>
            <jsp:include page="../scripts.jsp"/>
            </body>
            </html>
