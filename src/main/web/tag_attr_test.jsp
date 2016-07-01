<%@ page import="po.User" %>
<%@ taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Koche
  Date: 2016/6/30
  Time: 16:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Tag Attr Test</title>
</head>
<body>

<s:property value="user.userId"/>
<s:property value="user.username"/>

<hr/>

<t:att user="${user}" >
</t:att>
</body>
</html>
