<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">评价不完整</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card white-text pink" style="margin: 2rem; padding: 2rem;">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-exclamation-circle" aria-hidden="true"></i></strong></h3>
                    <br/>
                    <h5>评价没有填好哦！</h5>
                    <s:actionerror style="color: white " />
                    <h6>
                        <s:url namespace="/order" action="toAppendComment" var="fillUrl">
                            <s:param name="orderId"> <s:property value="orderId"/></s:param>
                        </s:url>

                        <s:url  namespace="/order" action="queryOrder" var="listUrl">
                            <s:param name="status">uncomment</s:param>
                        </s:url>
                        <a style="color:white" href="${fillUrl}">继续填写</a> &nbsp; &nbsp;
                        <a style="color:white" href="${listUrl}">回到订单列表</a>
                    </h6>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>