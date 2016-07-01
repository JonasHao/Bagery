<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="user" type="po.User" %>

<div class="card">

    <c:out
    <h1 value="${user.username}"> </h1>
    <h1 value="${user.userId}"></h1>
</div>