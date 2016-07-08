<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">添加评论</jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/login.css" rel="stylesheet">
    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
        <s:form action="addComment" namespace="/comment">
            <s:iterator begin="1" end="2">
                    <s:textfield name="content1"/>
                    <s:textfield name="star"/>
            </s:iterator>
            <s:submit value="提交评论"/>
        </s:form>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
