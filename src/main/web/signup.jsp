<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">注册</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->

        <div class="container">

            <div class="widget-wrapper row">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">
                    <div class="card-block">
                            <%--<h2><strong>登录</strong></h2>--%>
                        <div class="md-form">
                            <s:textfield label="用户名" id="form1"  name="username" class="form-control"/>
                        </div>

                        <div class="md-form">
                            <s:textfield label="邮箱" name="email" class="form-control"/>
                        </div>

                        <div class="md-form">
                            <s:textfield label="姓名" name="realName" class="form-control"/>
                        </div>

                        <div class="md-form">
                            <s:password label="密码" id="form2" name="password" class="form-control"/>
                        </div>

                        <div class="md-form">
                            <s:password label="再输一次" name="password" class="form-control"/>
                        </div>
                        <s:submit cssClass="grey btn btn-primary" value="注册"/>
                        <a href="login.jsp">登录</a>
                        <a href="#">忘记密码</a>
                    </div>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
