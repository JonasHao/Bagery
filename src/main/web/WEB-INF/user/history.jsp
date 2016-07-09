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

    <jsp:attribute name="title">我的足迹</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li><s:a action="home" namespace="/user">个人中心</s:a></li>
           <li class="active">浏览纪录</li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="history-block">

                <%--<div class="reviews">--%>
                    <%--<h2 class="h2-responsive">今天</h2>--%>
                <%--</div>--%>

                <div class="row">
                    <s:if test="user==null">
                        <p>您还没有登陆系统！
                    </s:if>
                    <s:if test="records.size()==0">
                        <p>您还没有浏览过任何商品！
                    </s:if>
                    <s:else>
                    <s:iterator value="records">
                        <div class="col-md-3 col-lg-2 ">
                            <t:favoriteItem>
                                <jsp:attribute name="img"><s:property value="priced.img"/></jsp:attribute>
                                <jsp:attribute name="title"><s:property value="priced.title"/></jsp:attribute>
                                <jsp:attribute name="price"><s:property value="priced.unitPrice"/></jsp:attribute>
                                <jsp:attribute name="pricedId"><s:property value="priced.pricedId"/></jsp:attribute>
                            </t:favoriteItem>
                        </div>
                    </s:iterator>
                    </s:else>
                </div>


            </div>
        </div>


        <!--/.Main layout-->
    </jsp:body>
</t:base>


