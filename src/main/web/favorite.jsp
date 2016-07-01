<%--
  Created by IntelliJ IDEA.
  User: jinzil
  Date: 2016/6/23
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>

    <jsp:attribute name="title">收藏列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li class="active">收藏列表</li>
       </ol>
    </jsp:attribute>

    <jsp:attribute name="head">
         <meta http-equiv="Pragma" content="no-cache">
        <meta http-equiv="Cache-Control" content="no-cache">
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <!--First row-->
            <div class="row">
                <s:iterator value="favoriteItemList">
                    <div class="col-md-3 col-lg-2 ">

                        <t:favoriteItem>
                            <jsp:attribute name="img">../img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title"><s:property value="priced.title"/></jsp:attribute>
                            <jsp:attribute name="price"><s:property value="priced.unitPrice"/></jsp:attribute>
                            <jsp:attribute name="pricedId"><s:property value="pricedId"/></jsp:attribute>
                            <jsp:attribute name="itemId"><s:property value="itemId"/></jsp:attribute>
                        </t:favoriteItem>
                    </div>
                </s:iterator>


            </div>


        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>
