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
           <li><a href="index.jsp">首页</a></li>
           <li><a href="home.jsp">个人中心</a></li>
           <li class="active">浏览纪录</li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="history-block">
                <!--Heading
                <div class="reviews">
                    <h2 class="h2-responsive">今天</h2>
                </div>
                -->
                <div class="row">
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
                </div>
            </div>

            <%--
            <div class="history-block">
                <!--Heading-->
                <div class="reviews">
                    <h2 class="h2-responsive">昨天</h2>
                </div>
                <div class="row">
                    <div class="col-md-3 col-lg-2 ">
                        <t:favoriteItem>
                            <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title">包包标题</jsp:attribute>
                            <jsp:attribute name="price">99999.00</jsp:attribute>
                        </t:favoriteItem>
                    </div>
                    <div class="col-md-3 col-lg-2 ">
                        <t:favoriteItem>
                            <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title">包包标题</jsp:attribute>
                            <jsp:attribute name="price">99999.00</jsp:attribute>
                        </t:favoriteItem>
                    </div>
                    <div class="col-md-3 col-lg-2 ">
                        <t:favoriteItem>
                            <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title">包包标题</jsp:attribute>
                            <jsp:attribute name="price">99999.00</jsp:attribute>
                        </t:favoriteItem>
                    </div>
                    <div class="col-md-3 col-lg-2 ">
                        <t:favoriteItem>
                            <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title">包包标题</jsp:attribute>
                            <jsp:attribute name="price">99999.00</jsp:attribute>
                        </t:favoriteItem>
                    </div>
                    <div class="col-md-3 col-lg-2 ">
                        <t:favoriteItem>
                            <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title">包包标题</jsp:attribute>
                            <jsp:attribute name="price">99999.00</jsp:attribute>
                        </t:favoriteItem>
                    </div>
                    <div class="col-md-3 col-lg-2 ">
                        <t:favoriteItem>
                            <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                            <jsp:attribute name="title">包包标题</jsp:attribute>
                            <jsp:attribute name="price">99999.00</jsp:attribute>
                        </t:favoriteItem>
                    </div>
                </div>
            </div>
                --%>
        </div>


        <!--/.Main layout-->
    </jsp:body>
</t:base>


