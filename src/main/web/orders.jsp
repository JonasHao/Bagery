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

    <jsp:attribute name="title">订单列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="index.jsp">首页</a></li>
           <li class="active">订单列表</li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <ul class="nav nav-tabs tabs-5" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#panel1" role="tab">所有订单</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#panel2" role="tab">待付款</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#panel3" role="tab">待发货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#panel4" role="tab">待收货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#panel5" role="tab">待评价</a>
                </li>

            </ul>

            <div class="tab-content">

                <!--Panel 1-->
                <div class="tab-pane active" id="panel1" role="tabpanel">
                    <br>

                    <div class="card">
                        <div class="card-header">
                            <div class="row">
                                <div class="col-md-3">
                                    <p>2016-6-24</p>
                                    <p>订单号：9999999999999</p>
                                </div>
                                <div class="col-md-2 ">
                                    <p>总价:9999999元</p>
                                    <p>运费:5元</p>
                                </div>

                                <div class="col-md-2 ">
                                    <p>收货人：小明</p>
                                    <p>待收货</p>
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
                                    <img src="img/bags/bag1.png" class="img-fluid" alt="">
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
                                                商品标题
                                            </h5>
                                            <br/>
                                            <p><i class="fa fa-rmb" aria-hidden="true"></i>99999.99（1件）</p>
                                            <p class="bag-color">颜色分类:红色</p>
                                        </div>
                                    </div>

                                    <div class="col-md-2">
                                        <p>订单详情</p>
                                        <p>物流状态</p>
                                        <p>评价状态</p>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
                <!--/.Panel 1-->

                <!--Panel 2-->
                <div class="tab-pane" id="panel2" role="tabpanel">
                    <br>

                    <p>Content for Panel 2</p>

                </div>
                <!--/.Panel 2-->

                <!--Panel 3-->
                <div class="tab-pane" id="panel3" role="tabpanel">
                    <br>

                    <p>Content for Panel 3</p>

                </div>
                <!--/.Panel 3-->

                <!--Panel 4-->
                <div class="tab-pane" id="panel4" role="tabpanel">
                    <br>

                    <p>Content for Panel 4</p>

                </div>
                <!--/.Panel 4-->

            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>
