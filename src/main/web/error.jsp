<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>
    <jsp:attribute name="title">出错啦</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">


            <div class="card-danger white-text" style="margin: 2rem; padding: 2rem;">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-bug" aria-hidden="true"></i> Oops!</strong></h3>
                    <br/>
                    <h5>不小心迷路了，试试别的吧~</h5>
                </div>
            </div>


        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>