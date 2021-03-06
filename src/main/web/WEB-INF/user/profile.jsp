<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="scripts">
        <script type="text/javascript">
            function getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = location.search.substr(1).match(reg);
                if (r != null) return unescape(decodeURI(r[2])); return null;
            }
            var m=getQueryString("message");
            if(m!=null){
                if(m=="网络异常！"||m=="验证失败！"){
                    warning(m);
                }
                else {
                    notify(m);
                }
            }
        </script>
    </jsp:attribute>

    <jsp:attribute name="title">个人信息管理</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li><s:a action="home" namespace="/user">个人中心</s:a></li>
           <li class="active">个人信息</li>
       </ol>
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="widget-wrapper row">
                <div class="card card-profile col-sm-push-2 col-sm-8 col-lg-push-4 col-lg-4 ">

                    <div class="card-header">
                        <div class="center-block home-avatar">
                            <div class="media home-avatar">
                                <img class="img-circle" width="128" height="128" src="<s:property value="img"/>"/>
                            </div>
                        </div>

                        <div class="home-profile-body">
                            <h4 class="heading-username"><s:property value="username"/></h4>
                            <p><s:property value="email"/></p>
                        </div>
                    </div>

                    <div class="card-block">
                        <form class="form-user" action="/user/update.action">
                            <div class="card-block">

                                <s:set name="active" value="isActivate"/>
                                <div class="md-form input-group" >
                                    <s:textfield label="邮箱" name="email" cssClass="form-control" disabled="true"/>
                                    <span class="input-group-addon email-active-label">
                                        <s:if test="#active == 1">已验证<i class="fa fa-bullseye" aria-hidden="true"></i></s:if>
                                        <s:else><s:a action="sendConfirm">验证</s:a></s:else>
                                    </span>
                                </div>

                                <div class="md-form">
                                    <s:textfield label="姓名" name="realname" cssClass="form-control"/>
                                </div>

                                <s:submit cssClass="grey btn btn-primary" value="确认"/>
                                <s:a action="home" namespace="/user">取消</s:a>
                            </div>
                        </form>
                    </div>


                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
