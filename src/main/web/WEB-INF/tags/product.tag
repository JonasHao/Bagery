<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="pricedId" fragment="true"  %>
<div class="card">
    <!--Card image-->
    <s:url action="viewProduct" var="Link" namespace="/product">
        <s:param name="pricedId"><jsp:invoke fragment="pricedId"/></s:param>
    </s:url>
    <div class="view overlay hm-white-slight">
        <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="">
        <a href="${Link}">
            <div class="mask"></div>
        </a>
    </div>
    <!--/.Card image-->


    <div class="view overlay hm-black-strong">
        <div class="price">
            <!--Title-->
            <h4 class="card-title product-title">
                <jsp:invoke fragment="title"/>
            </h4>
            <!--Text-->
            <div class="product-title">
                <i class="fa fa-rmb" aria-hidden="true"></i>
                <jsp:invoke fragment="price"/>
            </div>

        </div>
        <div class="mask flex-center">
            <a href="#"><i class="fa fa-shopping-cart fa-2x"></i></a>
        </div>
    </div>

    <!--/.Card content-->

</div>
