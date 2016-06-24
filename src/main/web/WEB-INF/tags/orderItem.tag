<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="time" fragment="true" %>
<%@attribute name="orderId" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="totalPrice" fragment="true" %>
<%@attribute name="shipFee" fragment="true"  %>
<%@attribute name="receiver" fragment="true" %>
<%@attribute name="status" fragment="true" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="number" fragment="true"%>
<%@attribute name="color" fragment="true"%>
<%@attribute name="orderDetail" fragment="true" %>
<%@attribute name="shipStatus" fragment="true" %>
<%@attribute name="commentStatus" fragment="true" %>

<%@attribute name="productList"  type="" %>


<div class="card">
    <div class="card-header">
        <div class="row">
            <div class="col-md-3">
                <p><jsp:invoke fragment="time"/></p>
                <p><jsp:invoke fragment="orderId"/></p>
            </div>
            <div class="col-md-2 ">
                <p><jsp:invoke fragment="totalPrice"/></p>
                <p><jsp:invoke fragment="shipFee"/></p>
            </div>

            <div class="col-md-2 ">
                <p><jsp:invoke fragment="receiver"/></p>
                <p><jsp:invoke fragment="status"/></p>
            </div>

            <div class="col-md-1 col-md-push-4">
                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
            </div>
        </div>
    </div>
    <div class="row">
        <div class="col-md-2">
            <!--Card image-->
            <div class="view overlay hm-white-slight">
                <img src=<jsp:invoke fragment="img"/> class="img-fluid" alt="">
                <a href="#">
                    <div class="mask"></div>
                </a>
            </div>
            <!--/.Card image-->
        </div>
        <div class="col-md-10 cart-item-block">
            <div class="row">
                <div class="col-md-9">
                    <div>
                        <!--Title-->
                        <h5 class="card-title product-title">
                            <jsp:invoke fragment="title"/>
                        </h5>
                        <br/>
                        <p><i class="fa fa-rmb" aria-hidden="true"></i><jsp:invoke fragment="price"/>（<jsp:invoke fragment="number"/>）</p>
                        <p class="bag-color"><jsp:invoke fragment="color"/></p>
                    </div>
                </div>

                <div class="col-md-2">
                    <p><jsp:invoke fragment="orderDetail"/></p>
                    <p><jsp:invoke fragment="shipStatus"/></p>
                    <p><jsp:invoke fragment="commentStatus"/></p>
                </div>
            </div>
        </div>

    </div>
</div>