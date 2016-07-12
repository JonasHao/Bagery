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

    <jsp:attribute name="title">购物车列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li class="active">购物车列表</li>
       </ol>
    </jsp:attribute>
    <jsp:attribute name="head">

    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <s:if test="cartItemList.size() >0">
                <div>
                    <div class="row">
                        <div class="col-md-10 cart-item-block col-md-push-2">
                            <div class="row">
                                <div class="col-md-3">
                                    商品信息
                                </div>

                                <div class="col-md-2 text-center">
                                    单价
                                </div>

                                <div class="col-md-3 text-center">
                                    数量
                                </div>

                                <div class="col-md-2 text-center">
                                    金额
                                </div>

                                <div class="col-md-2 text-center">
                                    操作
                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <br/>

                <s:iterator value="cartItemList" status="row">
                    <t:cartItem>
                        <jsp:attribute name="title"><s:property value="product.priced.title"/></jsp:attribute>
                        <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                        <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                        <jsp:attribute name="img"><s:property value="product.priced.img"/></jsp:attribute>
                        <jsp:attribute name="totalPrice"><s:property value="subtotal"/></jsp:attribute>
                        <jsp:attribute name="unitPrice"><s:property value="product.priced.unitPrice"/></jsp:attribute>
                        <jsp:attribute name="salePrice"><s:property value="product.priced.salePrice"/></jsp:attribute>
                        <jsp:attribute name="itemId"><s:property value="itemId"/></jsp:attribute>
                        <jsp:attribute name="stock"><s:property value="product.stock"/></jsp:attribute>
                    </t:cartItem>
                </s:iterator>

                <form action="/order/balance.action">

                    <s:iterator value="cartItemList" status="row">
                        <s:hidden name="cartItemIdList[%{#row.index}]" value="%{itemId}"/>
                    </s:iterator>


                    <div class="pull-right">
                        <s:submit cssClass="btn btn-primary btn-input blue-grey" value="结算"/>
                    </div>
                </form>
            </s:if>
            <s:else>
                <h5>购物车还是空空的~</h5>
            </s:else>
        </div>


        <!--/.Main layout-->
    </jsp:body>
</t:base>
