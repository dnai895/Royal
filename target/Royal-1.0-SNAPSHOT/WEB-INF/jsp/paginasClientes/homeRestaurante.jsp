<%-- 
    Document   : homeRestaurante
    Created on : 13-may-2016, 18:51:45
    Author     : Dani
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

    <head>

        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="description" content="">
        <meta name="author" content="">

        <title>${rest.getNombre()} - Class Royal</title>

        <jsp:include page="../css.jsp"/>
        <style>
            .aref {
                background-color: #5cb85c;
                border-radius: 4px;
                color: white;
                font-weight: bold;
                height: 3%;
                list-style: outside none none;
                margin-bottom: 20px;
                padding: 15px;
                text-align: center;
            }
        </style>
    </head>

    <body>

        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="${contextpath}/">
                        Class Royal
                    </a>
                </div>
                <!-- Collect the nav links, forms, and other content for toggling -->
                <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                    <ul class="nav navbar-nav navbar-right">
                        <li>
                            <a href="mailto:${rest.getEmail()}">Contacta</a> 
                        </li>
                    <!--    <li class="dropdown active">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown">Portfolio <b class="caret"></b></a>
                            <ul class="dropdown-menu">
                                <li>
                                    <a href="portfolio-1-col.html">1 Column Portfolio</a>
                                </li>
                                <li>
                                    <a href="portfolio-2-col.html">2 Column Portfolio</a>
                                </li>
                                <li>
                                    <a href="portfolio-3-col.html">3 Column Portfolio</a>
                                </li>
                                <li>
                                    <a href="portfolio-4-col.html">4 Column Portfolio</a>
                                </li>
                                <li class="active">
                                    <a href="portfolio-item.html">Single Portfolio Item</a>
                                </li>
                            </ul>
                        </li>
                    -->
                    </ul>
                </div>
                <!-- /.navbar-collapse -->
            </div>
            <!-- /.container -->
        </nav>

        <!-- Page Content -->
        <div class="container">

            <!-- Page Heading/Breadcrumbs -->
            <div class="row">
                <div class="col-lg-12">
                    <h1 class="page-header">${rest.getNombre()}
                        <small>${rest.getIntro()}</small>
                    </h1>
                </div>
            </div>
            <!-- /.row -->

            <!-- Portfolio Item Row -->
            <div class="row">

                <div class="col-md-8">
                    <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
                        <!-- Indicators -->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="1"></li>
                            <li data-target="#carousel-example-generic" data-slide-to="2"></li>
                        </ol>

                        <!-- Wrapper for slides -->
                        <div class="carousel-inner">
                            <div class="item active">
                                <img class="img-responsive" src="http://placehold.it/750x500" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive" src="http://placehold.it/750x500" alt="">
                            </div>
                            <div class="item">
                                <img class="img-responsive" src="http://placehold.it/750x500" alt="">
                            </div>
                        </div>

                        <!-- Controls -->
                        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
                            <span class="glyphicon glyphicon-chevron-left"></span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
                            <span class="glyphicon glyphicon-chevron-right"></span>
                        </a>
                    </div>
                </div>

                <div class="col-md-4">
                    <!--      <h3>Project Description</h3> -->
                    <div class="row">
                        <p>${rest.getDescripcion()}</p>
                        <p>${rest.getDireccion()}</p>
                        <p>Telefono: ${rest.getTelefono()}, email: ${rest.getEmail()}</p>
                    </div>

                    <div class="row">
                        <!--  <input type="button" class="btn btn-success allw" value="Pedir"/> -->
                        <a href="${contextpath}/${rest.getIdRestaurante()}/${rest.getNombreUrl()}/reserva.html">
                            <div class="aref">
                                Reservar
                            </div>
                        </a>
                    </div>
                    <!--      <h3>Project Details</h3>
                          <ul>
                              <li>Lorem Ipsum</li>
                              <li>Dolor Sit Amet</li>
                              <li>Consectetur</li>
                              <li>Adipiscing Elit</li>
                          </ul>
                    -->
                </div>

            </div>
            <!-- /.row -->

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
                        <c:forEach items="${comidas}" var="current"> <%-- COMIDAS --%>
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
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="bebidas" class="tab-pane fade">
                        <c:forEach items="${bebidas}" var="current"> <%-- BEBIDAS --%>
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
                                </div>
                            </div>
                        </c:forEach>
                    </div>

                    <div id="postres" class="tab-pane fade">
                        <c:forEach items="${postres}" var="current"> <%-- BEBIDAS --%>
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
                                </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <hr>
            <div class="row">
                <!--  <input type="button" class="btn btn-success allw" value="Pedir"/> -->
                <div class="col-md-4"></div>
                <div class="col-md-4">
                    <a href="${contextpath}/${rest.getIdRestaurante()}/${rest.getNombreUrl()}/reserva.html">
                        <div class="aref">
                            Reservar
                        </div>
                    </a>
                </div>
                <div class="col-md-4"></div>
            </div>
            <hr>
            <div class="row">
                <!-- Map Column -->
                <div class="col-md-12">
                    <!-- Embedded Google Map -->
                    <iframe width="100%" height="400px" frameborder="0" scrolling="no" marginheight="0" marginwidth="0" src="http://maps.google.com/maps?hl=es&amp;ie=UTF8&amp;geocode=&ll=${rest.getLatitud()},${rest.getLongitud()}&amp;spn=${rest.getLatitud()},${rest.getLongitud()}&amp;q=${rest.getNombre()}&amp;hq=&ampt=m&amp;z=16&amp;output=embed"></iframe>
                </div>
                <!-- Contact Details Column -->
            </div>
            <!-- /.row -->

            <hr>

            <!-- Footer -->
            <footer>
                <div class="row">
                    <div class="col-lg-12">
                        <p>Copyright &copy; Your Website 2014</p>
                    </div>
                </div>
            </footer>

        </div>
        <!-- /.container -->

        <jsp:include page="../scripts.jsp"/>

    </body>

</html>
