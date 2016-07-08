<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">验证邮箱<s:property value="#session.Code"/></jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="widget-wrapper row">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">

                    <div class="card-block">

                        <form class="form-user" action="confirmCode" namespace="/user"  method="POST">
                            <div class="md-form">
                                <s:textfield label="验证码" id="form1"  name="confirmCode"  class="form-control" disabled="false"/>
                                <s:submit cssClass="grey btn btn-primary" value="确认"/>
                            </div>
                        </form>
                        <a href="home.jsp">取消</a>
                    </div>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
