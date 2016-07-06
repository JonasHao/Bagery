<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">登录</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->

        <div class="container">

            <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">
                <form class="form-signin" action="user/login"  method="POST">
                <div class="card-block">
                        <%--<h2><strong>登录</strong></h2>--%>
                    <div class="md-form">
                        <i class="fa fa-user prefix"></i>
                        <s:textfield label="用户名" id="form1" name="username" class="form-control"/>
                    </div>
                    <div class="md-form">
                        <i class="fa fa-lock prefix"></i>
                        <s:textfield label="密码" id="form2" name="password" class="form-control"/>
                    </div>
                    <s:submit cssClass="grey btn btn-primary btn-input" value="登录"/>
                    <a href="signUp.jsp">注册</a>
                    <s:a action="openFind" namespace="/user">忘记密码</s:a>
                </div>
                </form>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
