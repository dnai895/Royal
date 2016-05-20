<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>Class Royal</title>

    <!-- Bootstrap Core CSS -->
    <link href="${contextpath}/css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="${contextpath}/css/agency.css" rel="stylesheet">
    <link href="${contextpath}/css/custom_landing.css" rel="stylesheet">    

    <!-- Custom Fonts -->
    <link href="font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
    <link href="https://fonts.googleapis.com/css?family=Montserrat:400,700" rel="stylesheet" type="text/css">
    <link href='https://fonts.googleapis.com/css?family=Kaushan+Script' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic,700italic' rel='stylesheet' type='text/css'>
    <link href='https://fonts.googleapis.com/css?family=Roboto+Slab:400,100,300,700' rel='stylesheet' type='text/css'>

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
    <jsp:include page="css.jsp"/>
    <!-- JS file -->
    <script src="${contextpath}/scripts/jquery.easy-autocomplete.min.js"></script> 

    <!-- CSS file -->
    <link rel="stylesheet" href="${contextpath}/css/easy-autocomplete.min.css"> 

    <!-- Additional CSS Themes file - not required-->
    <link rel="stylesheet" href="${contextpath}/css/easy-autocomplete.themes.min.css"> 

    <link rel="stylesheet" href="${contextpath}/css/custom_landing.css">    
    <link rel="stylesheet" href="${contextpath}/css/buscador.css">    
    <style>
        a {
            margin: auto;
            padding: 0;
            background-color: transparent !important;
            color: #5A91CB;
            border: none !important;
        }
        
        .eac-item a {
            width: 100%;
        }
        
        .selected {
            padding: 0 !important;
        }
    </style>
</head>

<body id="page-top" class="index">
    <!-- Header -->
    <header>
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="well">
                        <h1 class="page-header">Encuentra tu restaurante</h1>
                    </div>
                </div>
            </div>            
        </div>            
        <div class="row">
            <div class="input-group">
                <input type="text" id="search" placeholder="Busca tu restaurante...">
                <span class="input-group-btn">
                    <button class="btn btn-default" type="button" id="btn-buscar"><i class="fa fa-search"></i></button>
                </span>
            </div>
        </div>
        <div class="row">
            <button class="btn-info btn-lg xtra-large" type="button" data-toggle="modal" data-target="#rests">Ver todos los restaurantes</button>
        </div>        
    </header>
    <div id="rests" class="modal fade" role="dialog">
    <div class="modal-dialog">
        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Todos los restaurantes</h4>
          </div>
          <div class="modal-body">
              <c:forEach items="${lrestaurantes}" var="current">
                  <div class="row">
                      <div class="col-lg-3"></div>
                      <div class="col-lg-9 text-left">
                          <p><a href="${contextpath}/${current.getIdRestaurante()}/${current.getNombreUrl()}/home.html">${current.getNombre()}</a></p>
                      </div>
                    
                <!--    <img src="" />         -->    
                    <hr>
                  </div>
              </c:forEach>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn" data-dismiss="modal">Cerrar</button>
          </div>
        </div>
    </div>
    </div>
        
    <jsp:include page="scripts.jsp"/>
    
<script type="text/javascript">    
    var options = {
        data: [ 
            <c:forEach items="${lrestaurantes}" var="current">
                {"name": "${current.getNombre()}", "id":"${current.getIdRestaurante()}", "nombreUrl": "${current.getNombreUrl()}", "website-link":"${contextpath}/${current.getIdRestaurante()}/${current.getNombreUrl()}/home.html" }, 
            </c:forEach>
        ],
        getValue: "name",
        template: {
            type: "links",
            fields: {
                link: "website-link"
            }
        },
        list: {
            match: {
                enabled: true
            }
        }
    };

    $("#search").easyAutocomplete(options);
    
    $("#btn-buscar").click(function() {
        var item = $("#search").getSelectedItemData();
        if(item["id"] != undefined && item["nombreUrl"] != undefined) {
            window.location = "${contextpath}/"+item["id"]+"/"+item["nombreUrl"]+"/home.html";
        }
    });
</script>

</body>

</html>
