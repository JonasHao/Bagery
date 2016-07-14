<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">登录</jsp:attribute>

    <jsp:attribute name="head">
            <link href="/css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script type="text/javascript">
            var src = "${param.src}";
            $("#src").val(src);
        </script>
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->

        <div class="container">

            <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">
                <form class="form-signin" action="/user/login" method="POST">
                    <div class="card-block">
                            <%--<h2><strong>登录</strong></h2>--%>
                        <div class="md-form error-msg-form">
                            <i class="fa fa-user prefix"></i>
                            <s:textfield label="用户名" errorPosition="none" name="username" class="form-control"
                                         required="true" maxLength="12"
                                         minLength="5"/>
                        </div>

                        <s:fielderror fieldName="username" name="username" cssClass="errorMessage"/>
                        <div class="md-form">
                            <i class="fa fa-lock prefix"></i>
                            <s:password label="密码" name="password" errorPosition="none" class="form-control"
                                        required="true" maxLength="20"
                                        minLength="5"/>
                        </div>
                        <s:fielderror fieldName="password" name="username" cssClass="errorMessage"/>
                        <s:hidden name="src"/>
                        <s:submit cssClass="grey btn btn-primary btn-input" value="登录"/>
                        <a href="/signUp.jsp">注册</a>
                        <a href="/FindPassword.jsp">忘记密码</a>
                    </div>
                </form>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>
