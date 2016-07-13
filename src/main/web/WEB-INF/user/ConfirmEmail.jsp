<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="scripts">
        <script type="text/javascript">
            function getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = location.search.substr(1).match(reg);
                if (r != null) return unescape(decodeURI(r[2]));
                return null;
            }
            var m = getQueryString("message");
            if (m != null) {
                if(m=="验证码错误！"){
                    warning("验证码错误！");
                }
                else
                {
                    notify(m);
                }
            }
        </script>
    </jsp:attribute>

    <jsp:attribute name="title">验证邮箱</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="breadcrumb">
    <ol class="breadcrumb">
        <li><a href="/index.jsp">首页</a></li>
        <li><s:a action="home" namespace="/user">个人中心</s:a></li>
        <li class="active">验证邮箱</li>
    </ol>
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="widget-wrapper row">
                <div class="card card-login col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">

                    <div class="card-block">

                        <form class="form-user" action="confirmCode" namespace="/user" method="POST">
                            <div class="md-form">
                                <s:textfield label="验证码" id="form1" name="confirmCoding" class="form-control"
                                             required="true" maxLength="5"
                                             minLength="5" disabled="false"/>
                                <s:submit cssClass="grey btn btn-primary" value="确认"/>
                            </div>
                        </form>
                        <s:a namespace="/user" action="home">取消</s:a>
                    </div>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>