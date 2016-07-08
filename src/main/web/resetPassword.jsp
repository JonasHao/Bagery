<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">更改密码</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="widget-wrapper row">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">
                    <form class="form-user" action="resetPassword" namespace="/user"  method="POST">
                    <div class="card-block">

                        <div class="md-form">
                            <s:textfield label="旧密码" id="form1"  name="confirmPassword"  class="form-control" disabled="false"/>
                        </div>

                        <div class="md-form">
                            <s:textfield label="新密码" name="newPassword"  class="form-control" disabled="false"/>
                        </div>

                        <div class="md-form">
                            <s:textfield label="确认密码" name="confirmNewPassword" class="form-control" disabled="false"/>
                        </div>

                        <s:submit cssClass="grey btn btn-primary" value="确认"/>
                        <s:a action="home" namespace="/user">取消</s:a>
                    </div>
                    </form>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>