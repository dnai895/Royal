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
        <title>Mesas | Class Royal</title>
        <jsp:include page="../css.jsp"/>
    </head>
    <body class="body-backoffice"><!-- Page Content -->
        <jsp:include page="../bloques/menuRestaurante.jsp"/>
        <div class="container">

            <div class="row">
                <div class="col-lg-10">
                    <h1 class="page-header">Mesas
                    </h1>
                </div>
                <div class="col-lg-2">
                    <a href="${contextpath}/restaurante/mesa.html" class="btn btn-default btn-circle page-header add">+</a>
                </div>
            </div>
            <div class="row">
                <c:forEach items="${lmesas}" var="current">
                    <div class="col-md-3 col-sm-6">
                        <div class="panel panel-default text-center">
                            <div class="panel-body">
                                <h4>#${current.getNumero()}</h4>
                                <a class="btn btn-primary" href="${contextpath}/restaurante/${current.getIdMesa()}/mesa.html">Editar</a>
                            </div>
                        </div>
                    </div>
                </c:forEach>
            </div>
            <!-- /.row -->

            <hr>
            <jsp:include page="../scripts.jsp"/>
            </body>
            </html>
