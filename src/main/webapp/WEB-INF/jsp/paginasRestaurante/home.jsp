<%-- 
    Document   : home
    Created on : 04-may-2016, 19:39:46
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Home | Class Royal</title>

    <jsp:include page="../css.jsp"/>

</head>

<body class="body-backoffice">

    <jsp:include page="../bloques/menuRestaurante.jsp"/>

    <!-- Page Content -->
    <div class="container">

        <!-- Page Heading/Breadcrumbs -->
        <div class="row">
            <div class="col-xs-12">
                <h1 class="page-header">Menú
                   <!-- <small>Subheading</small> -->
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

        <!-- Projects Row -->
        <div class="row">
            <div class="col-xs-3 img-portfolio">
                <a href="${contextpath}/restaurante/plato.html">
                    <img class="img-responsive img-hover" src="http://placehold.it/750x450" alt="">
                    <h3 class="title-item">
                        Crear plato
                    </h3>
                </a>
                
            </div>
            <div class="col-xs-3 img-portfolio">
                <a href="${contextpath}/restaurante/mesa.html">
                    <img class="img-responsive img-hover" src="http://placehold.it/750x450" alt="">
                    <h3 class="title-item">
                        Crear mesa
                    </h3>
                </a>
                
            </div>
            <div class="col-xs-3 img-portfolio">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-hover" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
            <div class="col-xs-3 img-portfolio">
                <a href="portfolio-item.html">
                    <img class="img-responsive img-hover" src="http://placehold.it/750x450" alt="">
                </a>
            </div>
        </div>
        <!-- /.row -->

        <hr>

    <%--    <!-- Pagination -->
        <div class="row text-center">
            <div class="col-xs-12">
                <ul class="pagination">
                    <li>
                        <a href="#">&laquo;</a>
                    </li>
                    <li class="active">
                        <a href="#">1</a>
                    </li>
                    <li>
                        <a href="#">2</a>
                    </li>
                    <li>
                        <a href="#">3</a>
                    </li>
                    <li>
                        <a href="#">4</a>
                    </li>
                    <li>
                        <a href="#">5</a>
                    </li>
                    <li>
                        <a href="#">&raquo;</a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- /.row -->
    --%>
    </div>
    <!-- /.container -->

    <jsp:include page="../scripts.jsp"/>

</body>

</html>
