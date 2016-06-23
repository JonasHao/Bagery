<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="full" fragment="true" %>
<!DOCTYPE html>
<html>

<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta http-equiv="x-ua-compatible" content="ie=edge">

    <title><jsp:invoke fragment="title"/></title>

    <!-- Font Awesome -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.0/css/font-awesome.min.css">

    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="../../css/mdb.min.css" rel="stylesheet">

    <!-- Template styles -->
    <link href="../../css/style.css" rel="stylesheet">

    <jsp:invoke fragment="head"/>

</head>

<body>

<!--Navbar-->
<nav class="navbar navbar-light  navbar-fixed-top scrolling-navbar">
    <%@include file="nav.tag"%>
</nav>
<!--/.Navbar-->

<!--Carousel Wrapper-->
<div id="carousel-example-1" class="carousel slide carousel-fade" data-ride="carousel">
    <!--Indicators-->
    <ol class="carousel-indicators">
        <li data-target="#carousel-example-1" data-slide-to="0" class="active"></li>
        <li data-target="#carousel-example-1" data-slide-to="1"></li>
        <li data-target="#carousel-example-1" data-slide-to="2"></li>
    </ol>
    <!--/.Indicators-->

    <!--Slides-->
    <div class="carousel-inner" role="listbox">

        <!--First slide-->
        <div class="carousel-item active">
            <!--Caption-->
            <div class="flex-center animated fadeInDown">
                <ul>
                    <li>
                        <h1 class="h1-responsive">Material Design for Bootstrap 4</h1></li>
                    <li>
                        <p>The most powerful and free UI KIT for the newest Bootstrap</p>
                    </li>
                    <li>
                        <a target="_blank" href="http://mdbootstrap.com/getting-started/"
                           class="btn btn-primary btn-lg">Sign up!</a>
                        <a target="_blank" href="http://mdbootstrap.com/material-design-for-bootstrap/"
                           class="btn btn-default btn-lg">Learn more</a>
                    </li>
                </ul>
            </div>
            <!--Caption-->
        </div>
        <!--/.First slide-->

        <!--Second slide -->
        <div class="carousel-item">
            <!--Caption-->
            <div class="flex-center animated fadeInDown">
                <ul>
                    <li>
                        <h1 class="h1-responsive">Lots of tutorials at your disposal</h1>
                    </li>
                    <li>
                        <p>And all of them are FREE!</p>
                    </li>
                    <li>
                        <a target="_blank" href="http://mdbootstrap.com/bootstrap-tutorial/"
                           class="btn btn-primary btn-lg">Start learning</a>
                    </li>
                </ul>
            </div>
            <!--Caption-->
        </div>
        <!--/.Second slide -->

        <!--Third slide-->
        <div class="carousel-item">
            <!--Caption-->
            <div class="flex-center animated fadeInDown">
                <ul>
                    <li>
                        <h1 class="h1-responsive">Visit our support forum</h1></li>
                    <li>
                        <p>Our community can help you with any question</p>
                    </li>
                    <li>
                        <a target="_blank" href="http://mdbootstrap.com/forums/forum/support/"
                           class="btn btn-default btn-lg">Support forum</a>
                    </li>
                </ul>
            </div>
            <!--Caption-->
        </div>
        <!--/.Third slide-->
    </div>
    <!--/.Slides-->

    <!--Controls-->
    <a class="left carousel-control" href="#carousel-example-1" role="button" data-slide="prev">
        <span class="icon-prev" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#carousel-example-1" role="button" data-slide="next">
        <span class="icon-next" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
    </a>
    <!--/.Controls-->
</div>
<!--/.Carousel Wrapper-->

<br/>

<!--Content-->
<div class="container">
    <div id="body">
        <jsp:doBody/>
    </div>
</div>
<!--/.Content-->



<%@include file="footer.tag"%>


<!-- SCRIPTS -->

<!-- JQuery -->
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>

<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../../js/tether.min.js"></script>

<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>

<!-- MDB core JavaScript -->
<script type="text/javascript" src="../../js/mdb.min.js"></script>


</body>

</html>
