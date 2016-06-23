<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:list>
    <jsp:attribute name="title">登录</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->

        <div class="container">

            <div class="widget-wrapper">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">
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
                        <s:submit  cssClass="grey btn btn-primary" value="登录"/>
                        <a href="signup.jsp">注册</a>
                        <a href="#">忘记密码</a>
                    </div>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:list>
