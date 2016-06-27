<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@attribute name="head" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="full" fragment="true" %>
<%@attribute name="breadcrumb" fragment="true" %>
<%@attribute name="scripts" fragment="true" %>
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
    <link href="../../css/base.css" rel="stylesheet">

    <link href="../../css/style.css" rel="stylesheet">
    <jsp:invoke fragment="head"/>

</head>

<body>


<header>

    <!--Navbar-->
    <nav class="navbar navbar-light white">
        <%@include file="../components/nav.tag"%>
    </nav>
    <!--/.Navbar-->
    <jsp:invoke fragment="breadcrumb"/>
</header>

<main>
    <div id="body">
        <jsp:doBody/>
    </div>
</main>

<%@include file="../components/footer.tag"%>

<!-- SCRIPTS -->

<!-- JQuery -->
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>

<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../../js/tether.min.js"></script>

<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>

<!-- MDB core JavaScript -->
<script type="text/javascript" src="../../js/mdb.min.js"></script>
<jsp:invoke fragment="scripts"/>

</body>

</html>