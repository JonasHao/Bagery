<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Koche
  Date: 2016/6/28
  Time: 11:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>List</title>
</head>
<body>
<s:form  action="test/addList">
    <s:iterator status="st" begin="1" end="4">
        <s:textfield label="id" name="%{'itemList['+#st.index+'].id'}"/>
        <s:textfield label="tag" name="%{'itemList['+#st.index+'].tag'}"/>
    </s:iterator>
    <s:submit label="提交"/>
</s:form>

</body>
</html>
