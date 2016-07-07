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
    <jsp:attribute name="title">订单列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="index.jsp">首页</a></li>
           <li class="active">订单列表</li>
       </ol>
    </jsp:attribute>




    <jsp:attribute name="scripts">
        <script type="text/javascript">
            // Javascript to enable link to tab
            var url = document.location.toString();

            if (url.match('#')) {
                $('.nav-tabs a[href="#' + url.split('#')[1] + '"]').tab('show');
            }

            <%--$('.nav-tabs a[href="href#' + '<s:param value="status"/>'+ '"]').tab('show');--%>

            // Change hash for page-reload
            $('.nav-tabs a').on('shown.bs.tab', function (e) {
                window.location.hash = e.target.hash;
            });

            var test = function (id) {
                console.log("hello" + id);
            }

        </script>
     </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <ul class="nav nav-tabs tabs-5" role="tablist">
                <li class="nav-item">
                    <a class="nav-link active" data-toggle="tab" href="#all" role="tab">所有订单</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#unpaid" role="tab">待付款</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#unshipped" role="tab">待发货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#shipped" role="tab">待收货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#uncomment" role="tab">待评价</a>
                </li>

            </ul>

            <div class="tab-content">

                <!--Panel 1-->
                <div class="tab-pane active" id="all" role="tabpanel">
                    <br>
                    <s:iterator value="orderList">

                        <div class="card">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <p>2016-6-24</p>

                                        <p>订单号：<s:property value="orderId"/></p>
                                    </div>
                                    <div class="col-md-2 ">
                                        <p>总价:<s:property value="total"/></p>

                                        <p>运费:不要钱</p>
                                    </div>

                                    <div class="col-md-2 ">
                                        <p>收货人：<s:property value="address.receiver"/></p>

                                        <p>待收货</p>
                                    </div>

                                    <div class="col-md-1 col-md-push-4">
                                        <i class="fa fa-trash fa-lg" onclick="deleteOrder(orderId)"
                                           aria-hidden="true"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="card-block">
                                <s:iterator value="orderItems">
                                    <t:orderItem>
                                        <jsp:attribute name="img">"../../img/bags/bag1.png"</jsp:attribute>
                                        <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                        <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                        <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                        <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                    </t:orderItem>
                                </s:iterator>

                            </div>
                        </div>
                    </s:iterator>
                </div>
                <!--/.Panel 1-->


                <!--Panel 2-->
                <div class="tab-pane" id="unpaid" role="tabpanel">
                    <br>
                    <s:iterator value="orderList">

                        <s:if test='orderStatus == "unpaid" '>
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <p>2016-6-24</p>

                                            <p>订单号：<s:property value="orderId"/> </p>
                                        </div>
                                        <div class="col-md-2 ">
                                            <p>总价:<s:property value="total"/></p>

                                            <p>运费:不要钱</p>
                                        </div>

                                        <div class="col-md-2 ">
                                            <p>收货人：<s:property value="address.receiver"/></p>

                                            <p>待收货<s:property value="orderStatus"/></p>
                                        </div>

                                        <div class="col-md-1 col-md-push-4">
                                            <i onclick="bootbox.confirm({
                                                    message:'hello',
                                                    callback: function(result){   if(result){
                                                    test(<s:property value="orderId"/>);
                                                    } },
                                                    local:'zh_CN'
                                                    })"
                                               class="fa fa-trash fa-lg"
                                               aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <s:iterator value="orderItems">
                                        <t:orderItem>
                                            <jsp:attribute name="img">"../../img/bags/bag1.png"</jsp:attribute>
                                            <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                            <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                            <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                            <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                        </t:orderItem>
                                    </s:iterator>

                                </div>
                            </div>
                        </s:if>
                    </s:iterator>
                </div>
                <!--/.Panel 2-->

                <!--Panel 3-->
                <div class="tab-pane" id="unshipped" role="tabpanel">
                    <br>
                    <s:iterator value="orderList">

                        <s:if test='orderStatus == "unshipped" '>
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <p>2016-6-24</p>

                                            <p>订单号：<s:property value="orderId"/></p>
                                        </div>
                                        <div class="col-md-2 ">
                                            <p>总价:<s:property value="total"/></p>

                                            <p>运费:不要钱</p>
                                        </div>

                                        <div class="col-md-2 ">
                                            <p>收货人：<s:property value="address.receiver"/></p>

                                            <p>待收货</p>
                                        </div>

                                        <div class="col-md-1 col-md-push-4">
                                            <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <s:iterator value="orderItems">
                                        <t:orderItem>
                                            <jsp:attribute name="img">"../../img/bags/bag1.png"</jsp:attribute>
                                            <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                            <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                            <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                            <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                        </t:orderItem>
                                    </s:iterator>

                                </div>
                            </div>
                        </s:if>
                    </s:iterator>

                </div>
                <!--/.Panel 3-->

                <!--Panel 4-->
                <div class="tab-pane" id="shipped" role="tabpanel">
                    <br>
                    <s:iterator value="orderList">

                        <s:if test='orderStatus == "shipped" '>
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <p>2016-6-24</p>

                                            <p>订单号：<s:property value="orderId"/></p>
                                        </div>
                                        <div class="col-md-2 ">
                                            <p>总价:<s:property value="total"/></p>

                                            <p>运费:不要钱</p>
                                        </div>

                                        <div class="col-md-2 ">
                                            <p>收货人：<s:property value="address.receiver"/></p>

                                            <p>待收货</p>
                                        </div>

                                        <div class="col-md-1 col-md-push-4">
                                            <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <s:iterator value="orderItems">
                                        <t:orderItem>
                                            <jsp:attribute name="img">"../../img/bags/bag1.png"</jsp:attribute>
                                            <jsp:attribute name="title">产品名称：<s:property value="productTitle"/></jsp:attribute>
                                            <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                            <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                            <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                        </t:orderItem>
                                    </s:iterator>

                                </div>
                            </div>
                        </s:if>
                    </s:iterator>

                </div>
                <!--/.Panel 4-->

                <!--Panel 5-->
                <div class="tab-pane" id="uncomment" role="tabpanel">
                    <br>
                    <s:iterator value="uncomment">

                        <s:if test='orderStatus == "unpaid" '>
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <p>2016-6-24</p>

                                            <p>订单号：<s:property value="orderId"/></p>
                                        </div>
                                        <div class="col-md-2 ">
                                            <p>总价:<s:property value="total"/></p>

                                            <p>运费:不要钱</p>
                                        </div>

                                        <div class="col-md-2 ">
                                            <p>收货人：<s:property value="address.receiver"/></p>

                                            <p>待收货</p>
                                        </div>

                                        <div class="col-md-1 col-md-push-4">
                                            <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <s:iterator value="orderItems">
                                        <t:orderItem>
                                            <jsp:attribute name="img">"../../img/bags/bag1.png"</jsp:attribute>
                                            <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                            <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                            <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                            <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                        </t:orderItem>
                                    </s:iterator>

                                </div>
                            </div>
                        </s:if>
                    </s:iterator>

                </div>
                <!--/.Panel 5-->

            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
