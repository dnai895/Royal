<%-- 
    Document   : menu
    Created on : 04-may-2016, 20:03:56
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Navigation -->
    <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
        <div class="container">
            <!-- Brand and toggle get grouped for better mobile display -->
            <div class="navbar-header">

                <a class="navbar-brand" href="${contextpath}/restaurante/home.html">CLASS ROYAL</a>
            </div>
            <!-- Collect the nav links, forms, and other content for toggling -->
            <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                <ul class="nav navbar-nav navbar-right">
                    
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Platos <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${contextpath}/restaurante/platos.html">Ver platos</a>
                            </li>
                            <li>
                                <a href="${contextpath}/restaurante/plato.html">+ Añadir plato</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Mesas <b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${contextpath}/restaurante/mesas.html">Ver mesas</a>
                            </li>
                            <li>
                                <a href="${contextpath}/restaurante/mesa.html">+ Añadir mesas</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Estadísticas<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="#">Clientes</a>
                            </li>
                            <li>
                                <a href="${contextpath}/pedidos/reservas.html">Ventas</a>
                            </li>
                        </ul>
                    </li>
                    <li class="dropdown">
                        <a href="#" class="dropdown-toggle" data-toggle="dropdown">Perfil<b class="caret"></b></a>
                        <ul class="dropdown-menu">
                            <li>
                                <a href="${contextpath}/restaurante/datos.html">Datos restaurante</a>
                            </li>
                            <li>
                                <a href="${contextpath}/restaurante/datos-busqueda.html">Datos a mostrar búsquedas</a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="${contextpath}/usuarios/logout.html">Logout</a>
                    </li>
                </ul>
            </div>
            <!-- /.navbar-collapse -->
        </div>
        <!-- /.container -->
    </nav>