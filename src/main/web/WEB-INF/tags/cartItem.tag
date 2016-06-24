<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="color" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="number" fragment="true" %>
<%@attribute name="totalPrice" fragment="true" %>
<div class="card">
    <div class="row">
        <div class="col-md-2">
            <!--Card image-->
            <div class="view overlay hm-white-slight">
                <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="">
                <a href="#">
                    <div class="mask"></div>
                </a>
            </div>
            <!--/.Card image-->
        </div>
        <div class="col-md-10 cart-item-block">
            <div class="row">
                <div class="col-md-3">
                    <div>
                        <!--Title-->
                        <h5 class="card-title product-title">
                            <jsp:invoke fragment="title"/>
                        </h5>
                        <br/><br/>
                        <!--Text-->
                        <%--<i class="fa fa-circle color-icon" aria-hidden="true"></i>--%>
                        <p class="bag-color">颜色分类：<jsp:invoke fragment="color"/></p>
                    </div>
                </div>

                <div class="col-md-3">
                    <i class="fa fa-rmb" aria-hidden="true"></i>
                    <jsp:invoke fragment="price"/>
                </div>

                <div class="col-md-2">
                    <jsp:invoke fragment="number"/>
                </div>

                <div class="col-md-2">
                    <i class="fa fa-rmb" aria-hidden="true"></i>
                    <jsp:invoke fragment="totalPrice"/>
                </div>

                <div class="col-md-2">
                    <i class="fa fa-trash" aria-hidden="true"></i>删除
                </div>
            </div>
        </div>

    </div>
</div>
