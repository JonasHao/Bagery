<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">支付成功</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card white-text orange" style="margin: 2rem; padding: 2rem;">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-google-wallet" aria-hidden="true"></i></strong></h3>
                    <br/>
                    <h5>此状态的订单不能支付</h5>
                    <s:url namespace="/order" action="queryOrder" var="listUrl"/>
                    <h6><a style="color: #2a4011;" href="/index.jsp">回到首页</a> &nbsp; &nbsp;
                        <a style="color: #2a4011;" href="${listUrl}">查看订单列表</a>
                    </h6>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>