<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <jsp:attribute name="title">你点了不该点的哦~</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card-danger white-text" style="margin: 2rem; padding: 2rem; text-align: center">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-bell" aria-hidden="true"></i></strong></h3>
                    <br/>
                    <h5>对不起，您无权访问该页面</h5>
                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>