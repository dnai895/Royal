<%-- 
    Document   : listadoVentas
    Created on : 22-may-2016, 18:41:54
    Author     : Dani
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Listado comandas | Class Royal</title>
        <jsp:include page="../css.jsp"/>
    </head>
    <body class="body-backoffice"><!-- Page Content -->
        <jsp:include page="../bloques/menuRestaurante.jsp"/>
        <div class="container panel">
            <div class="col-lg-1"></div>
            <div class="col-lg-10">
                <div class="row">
                    <div class="row">
                        <div class="col-lg-12">
                            <h1 class="page-header">Pedidos
                            </h1>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
                <form method="GET" action="#">


                    <div class="row">
                        <div class="col-lg-6">
                            <div class="control-group form-group">
                                <div class="input-append date" id="dp3" data-date="${fechaInicio}" data-date-format="dd/mm/yyyy">
                                    <label>Fecha inicio:</label>
                                    <input id="fechaInicio" name="fechaInicio" class="form-control span2" size="16" type="text" value="${fechaInicio}">
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="control-group form-group">
                                <div class="input-append date" id="dp3" data-date="${fechaFin}" data-date-format="dd/mm/yyyy">
                                    <label>Fecha fin:</label>
                                    <input id="fechaFin" name="fechaFin" class="form-control span2" size="16" type="text" value="${fechaFin}">
                                    <span class="add-on"><i class="icon-th"></i></span>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="control-group form-group">
                                <label>Pagado:</label>
                                <select id="pagado" name="pagado" class="form-control">
                                    <option value="-1" <c:if test="${pagado == -1}">selected</c:if> >Sí y no</option>
                                    <option value="0" <c:if test="${pagado == 0-1}">selected</c:if>>No</option>
                                    <option value="1" <c:if test="${pagado == 1}">selected</c:if>>Sí</option>
                                    </select>
                                </div>
                            </div>
                            <div class="col-lg-6">
                                <div class="control-group form-group">
                                    <label>Turno:</label>
                                    <select id="turno" name="turno" class="form-control">
                                        <option value="-1" <c:if test="${pagado == -1}">selected</c:if>>--- Selecciona un turno ---</option>
                                    <option value="1" <c:if test="${pagado == 1}">selected</c:if>>Comida</option>
                                    <option value="2" <c:if test="${pagado == 2}">selected</c:if>>Cena</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="row">
                            <input type="submit" class="btn btn-primary fright" value="Filtrar"/>
                        </div>
                    </form>
                    <br/>
                    <hr>
                    <br/>
                    <div class="row">
                        <table class="table">
                            <thead>
                            <th>Fecha</th>
                            <th>Nombre</th>
                            <th>Apellidos</th>
                            <th>Turno</th>
                            <th>Comensales</th>
                            <th>Dinero Total</th>
                            <th>Pagado</th>
                            <th></th>
                            </thead>
                            <tbody>
                            <c:forEach items="${lcomandas}" var="current"> 
                                <tr <c:if test="${current.getPagado() == 1}">class="success"</c:if>>
                                    <td>${current.getFecha()}</td>
                                    <td>${current.getNombre()}</td>
                                    <td>${current.getApellidos()}</td>
                                    <td>
                                        <c:if test="${current.getTurno() == 1}">Comida</c:if>
                                        <c:if test="${current.getTurno() == 2}">Cena</c:if>
                                        </td>
                                        <td>${current.getOcupantes()}</td>
                                    <td>${current.getFactura()}€</td>
                                    <td>${current.isPagado()}</td>
                                    <td>
                                        <c:if test="${current.getPagado() != 1}">
                                            <input type="button" class="btn btn-danger" value="Marcar pagado" id="pagar" onclick="javascript: marcarPagado(${current.getIdComanda()});">
                                        </c:if>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
            <div class="col-lg-1"></div>

        </div>
        <!-- /.row -->

        <hr>
        <jsp:include page="../scripts.jsp"/>
        <script type="text/javascript">

            $(document).ready(function () {
                $(".span2").datepicker({
                    format: 'dd/mm/yyyy'
                });
            });

            function marcarPagado(idComanda) {
                $.ajax({
                    type: "POST",
                    url: "${contextpath}/pedidos/marcar-pagado.html",
                    data: {idComanda: idComanda},
                    success: function (result) {
                        if (result === "ok") {
                            location.reload(true);
                        } else {
                            muestraAlertKO();
                        }
                    },
                    error: function (jqXHR, textStatus, errorThrown) {
                        muestraAlertKO();
                    }
                });
            }
        </script>
    </body>
</html>
