<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Koche
  Date: 2016/7/7
  Time: 16:14
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
</head>
<body>

<s:form action="test">
    <s:textfield name="username" label="用户名" />
    <s:submit/>
</s:form>
</body>
</html>
