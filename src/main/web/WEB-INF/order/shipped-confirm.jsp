<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">确认收货成功</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card white-text brown" style="margin: 2rem; padding: 2rem;">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-send" aria-hidden="true"></i></strong></h3>
                    <br/>
                    <h5>已确认收货！</h5>
                    <s:url namespace="/order" action="queryOrder" var="listUrl">
                        <s:param name="status">"shipped"</s:param>
                    </s:url>
                    <h6>
                        <a style="color: whitesmoke;" href="/index.jsp">回到首页</a> &nbsp; &nbsp;
                        <a style="color: whitesmoke;" href="${listUrl}">查看订单列表</a>
                    </h6>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>