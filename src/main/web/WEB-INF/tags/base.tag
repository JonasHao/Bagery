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
    <meta http-equiv="pragma" content="no-cache">
    <meta http-equiv="Cache-Control" content="no-cache">
    <meta http-equiv="expires" content="0">
    <% response.setHeader("Cache-Control", "no-cache"); //HTTP 1.1
        response.setHeader("Pragma", "no-cache"); //HTTP 1.0
        response.setDateHeader("Expires", 0); //prevents caching at the proxy server
    %>

    <title>
        <jsp:invoke fragment="title"/>
    </title>

    <!-- Font Awesome -->
    <link href="../../font-awesome-4.6.3/css/font-awesome.min.css" rel="stylesheet">
    <!-- Bootstrap core CSS -->
    <link href="../../css/bootstrap.min.css" rel="stylesheet">

    <!-- Material Design Bootstrap -->
    <link href="../../css/mdb.min.css" rel="stylesheet">

    <link href="../../css/toastr.min.css" rel="stylesheet">

    <link href="../../css/style.css" rel="stylesheet">

    <!-- Template styles -->
    <link href="../../css/base.css" rel="stylesheet">


    <jsp:invoke fragment="head"/>

</head>

<body>


<header>

    <!--Navbar-->
    <nav class="navbar navbar-light white">
        <%@include file="../components/nav.tag" %>
    </nav>
    <!--/.Navbar-->
    <jsp:invoke fragment="breadcrumb"/>
</header>

<main>
    <div id="body">
        <jsp:doBody/>
    </div>
</main>

<%@include file="../components/footer.tag" %>

<!-- SCRIPTS -->

<!-- JQuery -->
<script type="text/javascript" src="../../js/jquery-2.2.3.min.js"></script>

<!-- Bootstrap tooltips -->
<script type="text/javascript" src="../../js/tether.min.js"></script>

<!-- Bootstrap core JavaScript -->
<script type="text/javascript" src="../../js/bootstrap.min.js"></script>

<!-- MDB core JavaScript -->
<script type="text/javascript" src="../../js/mdb.min.js"></script>

<%--通知--%>
<script type="text/javascript" src="../../js/plugin/toastr/toastr.min.js"></script>

<script type="text/javascript" src="../../js/notify.js"></script>

<%--弹出框--%>
<script type="text/javascript" src="../../js/plugin/bootbox/bootbox.min.js"></script>

<script type="text/javascript">
    bootbox.addLocale("Bagery", {
        OK : '确定',
        CANCEL : '取消',
        CONFIRM : '确认'
    });
    bootbox.setDefaults("locale","Bagery")
</script>

<jsp:invoke fragment="scripts"/>

</body>

</html>