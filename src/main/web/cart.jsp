<%--
  Created by IntelliJ IDEA.
  User: jinzil
  Date: 2016/6/23
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>

    <jsp:attribute name="title">购物车列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="index.jsp">首页</a></li>
           <li class="active">购物车列表</li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div>
                <div class="row">
                    <div class="col-md-10 cart-item-block col-md-push-2">
                        <div class="row">
                            <div class="col-md-3">
                                商品信息
                            </div>

                            <div class="col-md-3">
                                单价（元）
                            </div>

                            <div class="col-md-2">
                                数量
                            </div>

                            <div class="col-md-2">
                                金额（元）
                            </div>

                            <div class="col-md-2">
                                操作
                            </div>
                        </div>
                    </div>

                </div>
            </div>
            <br/>
            <div class="card">
                <div class="row">
                    <div class="col-md-2">
                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="img/bags/bag1.png" class="img-fluid" alt="">
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
                                        商品标题
                                    </h5>
                                    <br/><br/>
                                    <!--Text-->
                                    <%--<i class="fa fa-circle color-icon" aria-hidden="true"></i>--%>
                                    <p class="bag-color">颜色分类:红色</p>
                                </div>
                            </div>

                            <div class="col-md-3">
                                <i class="fa fa-rmb" aria-hidden="true"></i>
                                99999.99
                            </div>

                            <div class="col-md-2">
                                1
                            </div>

                            <div class="col-md-2">
                                <i class="fa fa-rmb" aria-hidden="true"></i>
                                99999.99
                            </div>

                            <div class="col-md-2">
                                <i class="fa fa-trash" aria-hidden="true"></i>删除
                            </div>
                        </div>
                    </div>

                </div>
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>
