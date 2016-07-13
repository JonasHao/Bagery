<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">更改密码</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="breadcrumb">
    <ol class="breadcrumb">
        <li><a href="/index.jsp">首页</a></li>
        <li><s:a action="home" namespace="/user">个人中心</s:a></li>
        <li class="active">修改密码</li>
    </ol>
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="widget-wrapper row">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">
                    <form class="form-user" action="resetPassword" namespace="/user" method="POST">
                        <div class="card-block">

                            <div class="md-form">
                                <s:password label="旧密码" id="form1" name="confirmPassword" class="form-control"
                                             required="true" maxLength="20"
                                             minLength="5" disabled="false"/>
                            </div>
                            <s:fielderror fieldName="confirmPassword" name="confirmPassword" cssClass="errorMessage"/>

                            <div class="md-form">
                                <s:password label="新密码" name="newPassword" class="form-control" required="true"
                                             maxLength="20"
                                             minLength="5" disabled="false"/>
                            </div>
                            <s:fielderror fieldName="newPassword" name="newPassword" cssClass="errorMessage"/>

                            <div class="md-form">
                                <s:password label="确认密码" name="confirmNewPassword" class="form-control" required="true"
                                             maxLength="20"
                                             minLength="5" disabled="false"/>
                            </div>
                            <s:fielderror fieldName="confirmNewPassword" name="confirmNewPassword"
                                          cssClass="errorMessage"/>

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