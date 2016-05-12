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
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="css/agency.css" rel="stylesheet">
    <link href="css/custom_landing.css" rel="stylesheet">    

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

</head>

<body id="page-top" class="index">
    <!-- Header -->
    <header>
        <div class="container">
            <div class="intro-text">
                <div class="intro-lead-in">Bienvenid@ a <!--Class Royal--><img alt="logo" src="img/logo.png" style="margin: -82px 0 0 -12px"/></div>
                <div class="intro-heading">¿Eres un cliente o un restaurante?</div>
                <a href="" class="page-scroll btn btn-xl" data-toggle="modal" data-target="#userLogin">Soy un cliente</a> 
                <a href="" class="page-scroll btn btn-xl" data-toggle="modal" data-target="#restLogin">Soy un restaurante</a>
            </div>
        </div>
    </header>
        <!-- Modal -->
    <div id="restLogin" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Login restaurante</h4>
          </div>
          <div class="modal-body">
            <form id="login" name="login" method="POST" action="${contextpath}/usuarios/landing.html">
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Usuario:</label>
                        <input class="form-control" id="username" name="username" value=""/>
                    </div>
                </div>          
                <div class="control-group form-group">
                    <div class="controls">
                        <label>Contraseña:</label>
                        <input type="password" class="form-control" id="passwd" name="passwd" value=""/>
                        <span class="help-block fright"><a href="${contextpath}/usuarios/registro.html">¿Aún no estás registrado? ¡Regístrate!</a></span>
                        <input type="button" class="btn btn-primary fright" value="Entrar" id="submitRest"/>
                    </div>
                </div>
            </form>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>

      </div>
    </div>
                        
        <!-- Modal -->
    <div id="userLogin" class="modal fade" role="dialog">
      <div class="modal-dialog">

        <!-- Modal content-->
        <div class="modal-content">
          <div class="modal-header">
            <button type="button" class="close" data-dismiss="modal">&times;</button>
            <h4 class="modal-title">Login cliente</h4>
          </div>
          <div class="modal-footer">
            <button type="button" class="btn btn-default" data-dismiss="modal">Cerrar</button>
          </div>
        </div>

      </div>
    </div>                        
        
    <!-- jQuery -->
    <script src="scripts/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="scripts/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="http://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.3/jquery.easing.min.js"></script>
    <script src="scripts/classie.js"></script>
    <script src="scripts/cbpAnimatedHeader.js"></script>

    <!-- Contact Form JavaScript -->
    <script src="scripts/jqBootstrapValidation.js"></script>
    <script src="scripts/contact_me.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="scripts/agency.js"></script>
    
    <script type="text/javascript">
        $("#submitRest").click(function() {
            $.ajax({
                type: "POST",
                url: "${contextpath}/usuarios/landing.html", 
                data: $("#login").serialize(),
                success: function(result){
                    if(result === "ok") {
                        window.location = "${contextpath}/restaurante/home.html";
                    } else {
                        alert("¡Datos incorrectos!");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert("UPS! ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.");
                }
            });
        });
        $("#submitUser").click(function() {
            $.ajax({
                type: "POST",
                url: "${contextpath}/usuarios/landing.html", 
                data: $("#loginUser").serialize(),
                success: function(result){
                    if(result === "ok") {
                        window.location = "${contextpath}/user/home.html";
                    } else {
                        alert("¡Datos incorrectos!");
                    }
                },
                error: function(jqXHR, textStatus, errorThrown) {
                    alert("UPS! ha habido un error en el proceso. Vuelva a intentarlo o contacte con el equipo técnico.");
                }
            });
        });
    </script>    

</body>

</html>
