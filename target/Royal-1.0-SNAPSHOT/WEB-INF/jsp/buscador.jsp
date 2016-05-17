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
        <jsp:include page="css.jsp"/>
        <!-- JS file -->
        <script src="${contextpath}/scripts/jquery.easy-autocomplete.min.js"></script> 

        <!-- CSS file -->
        <link rel="stylesheet" href="${contextpath}/css/easy-autocomplete.min.css"> 

        <!-- Additional CSS Themes file - not required-->
        <link rel="stylesheet" href="${contextpath}/css/easy-autocomplete.themes.min.css"> 

        <link rel="stylesheet" href="${contextpath}/css/custom_landing.css">    
        <link rel="stylesheet" href="${contextpath}/css/buscador.css">       
        <link rel="stylesheet" href="${contextpath}/css/custom_landing.css">    
    </head>

    <body id="page-top" class="index">
        <!-- Header -->
        <header>
            <div class="container">
                <div class="intro-text">
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
                        <input type="text" id="search">
                        <span class="input-group-btn">
                            <button class="btn btn-default" type="button"><i class="fa fa-search"></i></button>
                        </span>
                    </div>
                </div>
            </div>
        </header>

        <jsp:include page="scripts.jsp"/>

        <script type="text/javascript">
            var options = {
                data: [
                    {"name": "Afghanistan"},
                    {"name": "Aland Islands"},
                    {"name": "Albania"},
                    {"name": "Algeria"},
                    {"name": "American Samoa"}
                ],
                getValue: "name",
                list: {
                    match: {
                        enabled: true
                    }
                }
            };

            $("#search").easyAutocomplete(options);
        </script>

    </body>

</html>
