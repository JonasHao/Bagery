<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <jsp:attribute name="title">商品已失效</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card-danger white-text blue-grey">
                <div class="card-block">
                    <h3><strong><img src="../../img/icon/disable.png"><span
                            class="disabled-block">商品失效啦~~快去逛逛别的吧~</span></strong></h3>
                    <a style="color: white;" href="/index.jsp">回到首页</a> &nbsp; &nbsp;
                </div>
            </div>


        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>