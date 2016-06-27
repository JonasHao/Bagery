<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="favoriteId" type="java.lang.Integer" %>
<%@attribute name="pricedId" fragment="true" %>
<div class="card card-favorite">

    <%--todo 更新商品详情action--%>
    <s:url var="productUrl" action="viewProduct">
        <s:param name="priced_id">
            <jsp:invoke fragment="pricedId"/>
        </s:param>
    </s:url>



        <!--Card image-->
        <div class="view overlay hm-white-slight">
            <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="">

            <s:a href="%{productUrl}">
                <div class="mask"></div>
            </s:a>
        </div>
        <!--/.Card image-->

    <!--Card content-->
    <div class="card-block product-text">

        <div class="price">
            <!--Title-->
            <h5 class="card-title product-title">
                <jsp:invoke fragment="title"/>
            </h5>
            <!--Text-->
            <i class="fa fa-rmb" aria-hidden="true"></i>
            <jsp:invoke fragment="price"/>
        </div>


    </div>
    <!--/.Card content-->

</div>