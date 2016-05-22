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

        <jsp:include page="../bloques/menuCliente.jsp" />

        <div class="container">

            <div class="row">
                <div class="row">
                    <div class="col-lg-10">
                        <h1 class="page-header">Platos
                        </h1>
                    </div>
                    <div class="col-lg-2">
                        <input type="button" class="btn btn-primary fright page-header" value="Pedir" id="submit"/>
                    </div>
                </div>
            </div>
            <div class="row">
                <ul class="nav nav-tabs nav-justified">
                    <li><a data-toggle="tab" href="#comidas">Comidas</a></li>
                    <li><a data-toggle="tab" href="#bebidas">Bebidas</a></li>
                    <li><a data-toggle="tab" href="#postres">Postres</a></li>
                </ul>
            </div>
            <form id="platos" name="platos" method="POST" action="#">
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
                                        <a class="btn btn-default btn-circle remove" href="#" producto="${current.getIdProducto()}" id="remove${current.getIdProducto()}" style="display: none;">-</a>
                                        <a id="unidades${current.getIdProducto()}" class="btn btn-default btn-circle">0</a>
                                        <input type="hidden" id="inputUnidades${current.getIdProducto()}" name="inputUnidades${current.getIdProducto()}" value="0"/>
                                        <a class="btn btn-default btn-circle add" href="#" producto="${current.getIdProducto()}" id="add{current.getIdProducto()}">+</a>
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
                                        <a class="btn btn-default btn-circle remove" href="#" producto="${current.getIdProducto()}" id="remove${current.getIdProducto()}" style="display: none;">-</a>
                                        <a id="unidades${current.getIdProducto()}" class="btn btn-default btn-circle">0</a>
                                        <input type="hidden" id="inputUnidades${current.getIdProducto()}" name="inputUnidades${current.getIdProducto()}" value="0"/>
                                        <a class="btn btn-default btn-circle add" href="#" producto="${current.getIdProducto()}" id="add{current.getIdProducto()}">+</a>
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
                                        <a class="btn btn-default btn-circle remove" href="#" producto="${current.getIdProducto()}" id="remove${current.getIdProducto()}" style="display: none;">-</a>
                                        <a id="unidades${current.getIdProducto()}" class="btn btn-default btn-circle">0</a>
                                        <input type="hidden" id="inputUnidades${current.getIdProducto()}" name="inputUnidades${current.getIdProducto()}" value="0"/>
                                        <a class="btn btn-default btn-circle add" href="#" producto="${current.getIdProducto()}" id="add{current.getIdProducto()}">+</a>
                                    </div>
                                </div>
                            </c:forEach>
                        </div>
                    </div>
                </div>
                <div class="row">
                    <div class="well">
                        <label for="comment">Consideraciones:</label>
                        <textarea class="form-control" rows="5" id="comments"></textarea>
                    </div>
                </div>
                <input type="hidden" id="productos" name="productos" value="" />
            </form>
            <!-- /.row -->

            <hr>
            <jsp:include page="../scripts.jsp"/>

            <script type="text/javascript">
                $(document).ready(function () {
                    var producto = 0;
                    var unidades = 0;
                    $(".add").click(function () {
                        producto = this.getAttribute("producto");
                        unidades = parseInt($("#unidades"+producto).html());
                        unidades++
                        if(unidades > 0) {
                            $("#remove"+producto).show();
                        }
                        $("#unidades"+producto).html(unidades);
                        $("#inputUnidades"+producto).val(unidades);
                        if(!checkProductoCarrito(producto)) {
                            var prods = $("#productos").val();
                            if(prods == "") {
                                $("#productos").val(producto);
                            } else {
                                $("#productos").val(prods+","+producto);
                            }
                        }
                    });
                    
                    $(".remove").click(function () {
                        producto = this.getAttribute("producto");
                        unidades = parseInt($("#unidades"+producto).html());
                        if(unidades > 0) {
                            unidades--;
                            $("#unidades"+producto).html(unidades);
                            if(unidades == 0) {
                                $("#remove"+producto).hide();
                            }
                            $("#inputUnidades"+producto).val(unidades);
                        }
                        var newProds = "";
                        if(checkProductoCarrito(producto)) {
                            var prods = $("#productos").val().split(",");
                            for(var i = 0; i < prods.length; i++) {
                                if(prods[i] != producto) {
                                    if(newProds == "") {
                                        newProds = prods[i];
                                    } else {
                                        newProds = newProds+","+prods[i];
                                    }
                                } else {
                                    if(unidades > 0) {
                                        newProds = newProds+","+prods[i];
                                    }
                                }
                            };
                            $("#productos").val(newProds);
                        }
                    });
                    
                    function checkProductoCarrito(producto) {
                        var productos = $("#productos").val().split(",");
                        var isIn = false;
                        for (var i = 0; i < productos.length; i++) {
                            if(productos[i] == producto) {
                                isIn = true;
                                return isIn;
                            }
                        };
                        return isIn;
                    }
                    
                    $("#submit").click(function() {
                        if(producto != 0 && unidades != 0) {
                            $.ajax({
                                type: "POST",
                                url: "${contextpath}/${idRestaurante}/carrito/add.html",
                                data: $("#platos").serialize(),
                                success: function(result){
                                    if (result === "ok") {
                                    window.location = "${contextpath}/${idRestaurante}/carrito.html";
                                    } else {
                                    alert("¡Datos incorrectos!");
                                    }
                                },
                                error: function(jqXHR, textStatus, errorThrown) {
                                    alert("UPS! ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.");
                                }
                            });
                        } else {
                            alert("¡Tienes que seleccionar algún producto!");
                        }
                    });
                });
            </script>
    </body>
</html>
