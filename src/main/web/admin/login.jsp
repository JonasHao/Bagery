<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>

    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <title>INSPINIA | Login</title>

    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">

    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">

</head>

<body class="gray-bg">

<div class="middle-box text-center loginscreen animated fadeInDown">
    <div>
        <div>

            <h1 class="logo-name" style="font-size:90px;margin-bottom: 30px;">Bagery</h1>

        </div>
        <h3>Welcome to Bagery</h3>

        <p>Login in.</p>
        <form class="m-t" role="form" action="/user/login.action" method="post">
            <div class="form-group">
                <s:textfield name="username" maxLength="12" minLength="5" errorPosition="none" class="form-control"
                             placeholder="Username" required="true"/>
            </div>
            <s:fielderror fieldName="username" name="username" cssClass="errorMessage"/>

            <div class="form-group">
                <s:password name="password" class="form-control"  maxLength="20" minLength="5" errorPosition="none" placeholder="Password" required="true"/>
            </div>
            <s:fielderror fieldName="password" name="password" cssClass="errorMessage"/>

            <s:submit  class="btn btn-primary block full-width m-b">Login</s:submit>
        </form>
        <p class="m-t">
            <small> Based on a Bootstrap 3 framework called <strong>Inspinia</strong> &copy; 2016</small>
        </p>
    </div>
</div>

<!-- Mainly scripts -->
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>

</body>

</html>
