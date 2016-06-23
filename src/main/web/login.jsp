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
                <div class="card card-login">
                    <div class="card-block">
                            <%--<h2><strong>登录</strong></h2>--%>
                        <s:form>
                            <div class="md-form">
                                <i class="fa fa-user prefix"></i>
                                <s:textfield label="用户名" id="form1" class="form-control"/>
                            </div>
                            <div class="md-form">
                                <i class="fa fa-envelope prefix"></i>
                                <s:textfield label="密码" id="form2" class="form-control"/>
                            </div>
                            <s:submit class="btn btn-primary" value="登录"/>
                        </s:form> <a href="#">忘记密码</a>

                    </div>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:list>
