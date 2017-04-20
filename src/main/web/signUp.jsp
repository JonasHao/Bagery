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
                    <form class="form-signin" action="/user/register" method="POST">
                        <div class="card-block">

                            <div class="md-form error-msg-form">
                                <s:textfield label="用户名" name="username" errorPosition="none" class="form-control"
                                             required="true" maxLength="12"
                                             minLength="5"/>
                            </div>
                            <s:fielderror fieldName="username" name="username" cssClass="errorMessage"/>


                            <div class="md-form error-msg-form">
                                <s:textfield label="邮箱" name="email" errorPosition="none" class="form-control" required="true"/>
                            </div>
                            <s:fielderror fieldName="email" name="email" cssClass="errorMessage"/>

                            <div class="md-form error-msg-form">
                                <s:textfield label="姓名" required="true" errorPosition="none" maxLength="15"
                                             minLength="2" name="realname" class="form-control"/>
                            </div>
                            <s:fielderror fieldName="realname" name="realname" cssClass="errorMessage"/>


                            <div class="md-form error-msg-form">
                                <s:password label="密码" name="password" errorPosition="none" class="form-control"
                                            required="true"
                                            maxLength="20" minLength="5"/>
                            </div>

                            <s:fielderror fieldName="password" name="password" cssClass="errorMessage"/>


                            <div class="md-form error-msg-form">
                                <s:password label="再输一次" name="confirmpassword" errorPosition="none" required="true"
                                            maxLength="20"
                                            minLength="5"/>
                            </div>
                            <s:fielderror fieldName="confirmpassword" name="confirmpassword" cssClass="errorMessage"/>

                            <s:submit cssClass="grey btn btn-primary" value="注册"/>
                            <a href="/login.jsp">登录</a>
                            <a href="/findPassword.jsp">忘记密码</a>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
