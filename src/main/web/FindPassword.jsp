<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">找回密码<s:property value="#session.Code"/></jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="widget-wrapper row">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">

                    <div class="card-block">

                        <form class="form-user" action="/user/sendConfirmCode"  method="POST">
                            <div class="md-form">
                                <s:textfield label="邮箱" id="form1"  name="email"  class="form-control" required="true" disabled="false"/>
                                <s:submit cssClass="grey btn btn-primary" value="发送验证码"/>
                            </div>
                            <s:fielderror fieldName="email" name="email" cssClass="errorMessage"/>
                        </form>

                        <form class="form-user" action="/user/confirmEmail" method="POST">
                            <div class="md-form">
                                <s:textfield label="验证码" name="confirmCode"  class="form-control" required="true" maxLength="4" minLength="4" disabled="false"/>
                            </div>
                            <s:fielderror fieldName="confirmCode" name="confirmCode" cssClass="errorMessage"/>

                            <div class="md-form">
                                <s:textfield label="密码" name="newPassword" class="form-control" required="true" maxLength="20" minLength="5" disabled="false"/>
                            </div>
                            <s:fielderror fieldName="newPassword" name="newPassword" cssClass="errorMessage"/>

                            <div class="md-form">
                                <s:textfield label="确认密码" name="confirmNewPassword" class="form-control" required="true" maxLength="20" minLength="5" disabled="false"/>
                            </div>
                            <s:fielderror fieldName="confirmNewPassword" name="confirmNewPassword" cssClass="errorMessage"/>

                            <s:submit cssClass="grey btn btn-primary" value="确认"/>

                        </form>

                        <s:submit cssClass="grey btn btn-primary" value="确认"/>
                        <a href="/login.jsp" >取消</a>
                    </div>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
