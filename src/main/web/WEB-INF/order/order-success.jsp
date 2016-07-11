<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">下单成功</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card white-text light-blue" style="margin: 2rem; padding: 2rem;">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-send" aria-hidden="true"></i></strong></h3>
                    <br/>
                    <h5>下单成功！</h5>
                    <s:url namespace="/order" action="queryOrder" var="listUrl">
                        <s:param name="status">"unpaid"</s:param>
                    </s:url>
                    <h6>
                        <a style="color: #05354a;" href="/index.jsp">回到首页</a> &nbsp; &nbsp;
                        <a style="color: #05354a;" href="${listUrl}">去支付</a>
                    </h6>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>