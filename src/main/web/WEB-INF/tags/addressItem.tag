<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="receiver" fragment="true" %>
<%@attribute name="address" fragment="true" %>
<%@attribute name="phone" fragment="true" %>
<%@attribute name="addressId" type="java.lang.Integer" %>
<%@attribute name="isDefault" type="java.lang.Boolean" %>
<div class="card">
    <div class="row card-block">
        <div class="col-md-10 address-info">
            <div class="row">
                <div class="col-md-10 address-line">
                    <jsp:invoke fragment="receiver"/>
                </div>
                <div class="col-md-10 address-line">
                    <jsp:invoke fragment="address"/>
                </div>
                <div class="col-md-10 address-line">
                    <jsp:invoke fragment="phone"/>
                </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-2">
            <a>编辑</a>
            <br>
            <s:a action="deleteAddress" namespace="/address" >删除</s:a>
            <br>
            <% if (isDefault) { %>
            默认地址
            <% } else {%>
            <a>设为默认</a>
            <br>
            <% }%>

        </div>
    </div>
</div>