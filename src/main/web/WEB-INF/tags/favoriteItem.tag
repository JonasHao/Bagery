<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="favoriteId" type="java.lang.Integer" %>
<div class="card card-favorite">
    <!--Card image-->
    <div class="view overlay hm-white-slight">
        <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="">
        <a href="#">
            <div class="mask"></div>
        </a>
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