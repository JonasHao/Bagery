<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="scripts">
        <script type="text/javascript">
            var reg = new RegExp("(^|&)" + "actionMessages" + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            var m;
            if (r != null)
                m=unescape(decodeURI(r[2]));
            else m=null;

            if(m!=null){
                notify(m);
            }
        </script>

        <script type="text/javascript">
            function sendCode() {
                emailStr=$("#form1").value;
                $.ajax({
                    url:"/user/sendConfirmCode",
                    dataType: "json",
                    type: 'post',
                    data: {email: emailStr},
                    success: function (data) {
                        if(data.result=="input"){
                            $("#email").text(data.error_fields);
                        }
                        if(data.result=="success"){
                            var btnSendCode =    $("btn-send-code");
                            btnSendCode.className("grey btn btn-primary disable");
                            btnSendCode.text("验证码已发送");
                        }
                    },
                })
            }
        </script>

    </jsp:attribute>

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
                                <s:textfield label="邮箱" id="form1"  name="email" errorPosition="none" class="form-control" required="true"  disabled="false"><s:property value="#session.Email"/></s:textfield>
                                <a onclick="sendCode()" id="btn-send-code" class="grey btn btn-primary">发送验证码</a>
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
                        <a href="/login.jsp" >取消</a>
                    </div>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
