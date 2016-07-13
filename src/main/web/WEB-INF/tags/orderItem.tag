<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="time" fragment="true" %>
<%@attribute name="orderId" fragment="true" %>
<%@attribute name="totalPrice" fragment="true" %>
<%@attribute name="shipFee" fragment="true" %>
<%@attribute name="receiver" fragment="true" %>
<%@attribute name="status" fragment="true" %>

<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="number" fragment="true" %>
<%@attribute name="color" fragment="true" %>
<%@attribute name="orderDetail" fragment="true" %>
<%@attribute name="shipStatus" fragment="true" %>
<%@attribute name="commentStatus" fragment="true" %>


<div class="row order-item">
    <div class="col-md-3">
        <!--Card image-->
        <div class="view overlay hm-white-slight">
            <img src="<jsp:invoke fragment="img"/>" class="img-fluid img-product-order" alt="">
            <a href="#">
                <div class="mask"></div>
            </a>
        </div>
        <!--/.Card image-->
    </div>
    <div class="col-md-7 col-md-push-2 order-item-block">
        <div>
            <!--Title-->
            <h5 class="card-title product-order-title">
                <jsp:invoke fragment="title"/>
            </h5>
            <div><i class="fa fa-rmb" aria-hidden="true"></i>
                <jsp:invoke fragment="price"/>
                (
                <jsp:invoke fragment="number"/>
                件)
            </div>
            <div class="bag-color">
                颜色:
                <jsp:invoke fragment="color"/>
            </div>
        </div>
    </div>


</div>
