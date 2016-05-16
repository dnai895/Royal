<%-- 
    Document   : menuCleinte
    Created on : 16-may-2016, 14:15:47
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- Navigation -->
        <nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
            <div class="container">
                <!-- Brand and toggle get grouped for better mobile display -->
                <div class="navbar-header">
                    <a class="navbar-brand" href="${contextpath}/">Class Royal</a>
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