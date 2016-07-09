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

                        <form class="form-user" action="sendConfirmCode" namespace="/user"  method="POST">
                            <div class="md-form">
                                <s:textfield label="邮箱" id="form1"  name="email"  class="form-control" disabled="false"/>
                                <s:submit cssClass="grey btn btn-primary" value="发送验证码"/>
                            </div>
                        </form>

                        <form class="form-user" action="confirmEmail" namespace="/user"  method="POST">
                            <div class="md-form">
                                <s:textfield label="验证码" name="confirmCode"  class="form-control" disabled="false"/>
                            </div>

                            <div class="md-form">
                                <s:textfield label="密码" name="newPassword" class="form-control" disabled="false"/>
                            </div>

                            <div class="md-form">
                                <s:textfield label="确认密码" name="confirmNewPassword" class="form-control" disabled="false"/>
                            </div>

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
