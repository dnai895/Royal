<%-- 
    Document   : scripts
    Created on : 02-may-2016, 19:32:26
    Author     : Dani
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!-- Bootstrap Core JavaScript -->
<script src="${contextpath}/scripts/bootstrap.min.js"></script>
<script src="${contextpath}/scripts/bootstrap-datepicker.js"></script>

<script type="text/javascript">
    function muestraAlertOk(texto) {
        $("#ok").modal('show');
        if(text != null && texto != undefined && text != "") {
             $("#modal-texto-ok").html(texto);
        }
    }
    
    function muestraAlertKO(texto) {
        $("#error").modal('show');
        if(text != null && texto != undefined && text != "") {
             $("#modal-texto-ko").html(texto);
        }
    }
</script>
