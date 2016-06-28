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
           <li><a href="order.jsp">订单列表</a></li>
           <li class="active">订单详情</li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <h1>查看订单详情</h1>
            <div class="row">
                <div class="col-sm-3">
                    下单日：2016-6-24
                </div>
                <div class="col-sm-4">
                    订单号：9999999999999
                </div>
            </div>


            <div class="card">
                <div class="card-header">
                    <div class="row">
                        <div class="col-md-2">
                            <div class="font-weight-bold">订单状态</div>
                            <div class="h5-responsive">已完成</div>
                        </div>
                        <div class="col-md-10">
                            <div class="row">
                                <div class="col-md-8">
                                    <div class="font-weight-bold">配送地址</div>
                                    小明<br/>
                                    华南理工大学<br/>
                                    18819466666
                                </div>

                                <div class="col-md-4">
                                    <div class="font-weight-bold">订单汇总</div>
                                    运费:5元<br/>
                                    商品小计:9994元
                                    <br/> <br/>
                                    <div class="font-weight-bold">总价:9999元</div>
                                </div>
                            </div>
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
                            <div class="col-md-8">
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
        <!--/.Main layout-->
    </jsp:body>
</t:base>
