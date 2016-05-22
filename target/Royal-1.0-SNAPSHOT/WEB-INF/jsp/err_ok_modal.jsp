<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<div id="ok" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header success">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Procesado correctamente</h4>
            </div>
            <div class="modal-body">
                <span id="modal-texto-ok">Ya has terminado. Hemos procesado tu petición correctamente.</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>

<div id="error" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header danger">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">Algo ha sucedido</h4>
            </div>
            <div class="modal-body">
                <span id="modal-texto-ko">Ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.</span>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
            </div>
        </div>
    </div>
</div>
