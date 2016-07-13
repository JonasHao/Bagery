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
           <li><a href="../../index.jsp">首页</a></li>
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

            // Change hash for page-reload
            $('.nav-tabs a').on('shown.bs.tab', function (e) {
                window.location.hash = e.target.hash;
            });

            function deleteOrder(id) {
                var to_delete = $(".order-" + id);
                console.log(to_delete);
                $.ajax(
                        {
                            url: "/order/deleteOrder",
                            dataType: "json",   //返回格式为json
                            type: 'post',
                            data: {orderId: id},
                            success: function (data) {
                                if (data.result == "success") {
                                    to_delete.remove();
                                    notify("成功删除订单");
                                } else {
                                    warning("删除失败！");
                                }
                            }
                        }
                )
            }

        </script>

        <script type="text/javascript">
            var status ="<s:property value="status"/>";
            $('.nav-tabs a[href="#' + status + '"]').tab('show');
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
                    <a class="nav-link " data-toggle="tab" href="#unpaid" role="tab">待付款</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#unshipped" role="tab">待发货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#shipped" role="tab">待收货</a>
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
                        <div class="card order-<s:property value="orderId"/>">
                            <div class="card-header">
                                <div class="row">
                                    <div class="col-md-3">
                                        <div>2016-7-13</div>

                                        <div>订单号：<s:property value="orderId"/></div>
                                    </div>
                                    <div class="col-md-3 ">
                                        <div>总价：<s:property value="total"/></div>

                                        <div>运费：不要钱</div>
                                    </div>

                                    <div class="col-md-3 ">
                                        <div>收货人：<s:property value="address.receiver"/></div>

                                        <div>订单状态：<s:property value="orderStatusString"/></div>
                                    </div>

                                    <div class="col-md-1 col-md-push-2">
                                        <a onclick="bootbox.confirm({
                                                title:'删除订单',
                                                message:'确定删除么？',
                                                callback: function(result){
                                                if(result){
                                                deleteOrder(<s:property value="orderId"/>);
                                                } }
                                                })">
                                            <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            <div class="card-block">
                                <div class="row">
                                    <div class="col-md-8">
                                        <s:iterator value="orderItems">
                                            <t:orderItem>
                                                <jsp:attribute name="img"><s:property value="product.priced.img"/></jsp:attribute>
                                                <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                                <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                                <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                                <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                            </t:orderItem>
                                        </s:iterator>
                                    </div>

                                    <div class="col-md-4">
                                        <s:if test='orderStatus == "unpaid"'>
                                            <s:url action="cancelOrder" namespace="/order" var="cancelOrder">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${cancelOrder}">
                                                <span>取消订单</span>
                                            </a>
                                            <br/>
                                            <s:url action="payment" namespace="/order" var="payment">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${payment}">
                                                <span>支付</span>
                                            </a>
                                        </s:if>
                                        <s:if test='orderStatus == "shipped"'>
                                            <s:url action="getLogisticsStatus" namespace="/order"
                                                   var="getLogisticsStatus">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${getLogisticsStatus}">
                                                <span>查看物流</span>
                                            </a>
                                            <br/>
                                            <s:url action="confirmReceive" namespace="/order" var="confirmReceive">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${confirmReceive}">
                                                <span>确认收货</span>
                                            </a>
                                        </s:if>
                                        <s:if test='notCommented'>
                                            <s:url action="getLogisticsStatus" namespace="/order"
                                                   var="getLogisticsStatus">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${getLogisticsStatus}">
                                                <span>查看物流</span>
                                            </a>
                                            <br/>
                                            <a href="#">
                                                <span>评论</span>
                                            </a>
                                        </s:if>
                                        <s:if test='commented'>
                                            <s:url action="getLogisticsStatus" namespace="/order"
                                                   var="getLogisticsStatus">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${getLogisticsStatus}">
                                                <span>查看物流</span>
                                            </a>
                                            <br/>
                                            <a href="#">
                                                <span>追评</span>
                                            </a>
                                        </s:if>

                                    </div>
                                </div>


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
                            <div class="card order-<s:property value="orderId"/>">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div>2016-7-13</div>

                                            <div>订单号：<s:property value="orderId"/></div>
                                        </div>
                                        <div class="col-md-3 ">
                                            <div>总价：<s:property value="total"/></div>

                                            <div>运费：不要钱</div>
                                        </div>

                                        <div class="col-md-3 ">
                                            <div>收货人：<s:property value="address.receiver"/></div>

                                            <div>订单状态：<s:property value="orderStatusString"/></div>
                                        </div>

                                        <div class="col-md-1 col-md-push-2">
                                            <a onclick="bootbox.confirm({
                                                    title:'删除订单',
                                                    message:'确定删除么？',
                                                    callback: function(result){
                                                    if(result){
                                                    deleteOrder(<s:property value="orderId"/>);
                                                    } }
                                                    })">
                                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="row">

                                        <div class="col-md-8">
                                            <s:iterator value="orderItems">
                                                <t:orderItem>
                                                    <jsp:attribute name="img"><s:property value="product.priced.img"/></jsp:attribute>
                                                    <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                                    <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                                    <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                                    <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                                </t:orderItem>
                                            </s:iterator>
                                        </div>
                                        <div class="col-md-4">
                                            <s:url action="cancelOrder" namespace="/order" var="cancelOrder">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${cancelOrder}">
                                                <span>取消订单</span>
                                            </a>
                                            <br/>
                                            <s:url action="payment" namespace="/order" var="payment">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${payment}">
                                                <span>支付</span>
                                            </a>
                                        </div>

                                    </div>
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
                                            <div>2016-7-13</div>

                                            <div>订单号：<s:property value="orderId"/></div>
                                        </div>
                                        <div class="col-md-3 ">
                                            <div>总价：<s:property value="total"/></div>

                                            <div>运费：不要钱</div>
                                        </div>

                                        <div class="col-md-3 ">
                                            <div>收货人：<s:property value="address.receiver"/></div>

                                            <div>订单状态：<s:property value="orderStatusString"/></div>
                                        </div>

                                        <div class="col-md-1 col-md-push-2">
                                            <a onclick="bootbox.confirm({
                                                    title:'删除订单',
                                                    message:'确定删除么？',
                                                    callback: function(result){
                                                    if(result){
                                                    deleteOrder(<s:property value="orderId"/>);
                                                    } }
                                                    })">
                                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <s:iterator value="orderItems">
                                        <t:orderItem>
                                            <jsp:attribute name="img"><s:property value="product.priced.img"/></jsp:attribute>
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
                                            <div>2016-7-13</div>

                                            <div>订单号：<s:property value="orderId"/></div>
                                        </div>
                                        <div class="col-md-3 ">
                                            <div>总价：<s:property value="total"/></div>

                                            <div>运费：不要钱</div>
                                        </div>

                                        <div class="col-md-3 ">
                                            <div>收货人：<s:property value="address.receiver"/></div>

                                            <div>订单状态：<s:property value="orderStatusString"/></div>
                                        </div>

                                        <div class="col-md-1 col-md-push-2">
                                            <a onclick="bootbox.confirm({
                                                    title:'删除订单',
                                                    message:'确定删除么？',
                                                    callback: function(result){
                                                    if(result){
                                                    deleteOrder(<s:property value="orderId"/>);
                                                    } }
                                                    })">
                                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <s:iterator value="orderItems">
                                                <t:orderItem>
                                                    <jsp:attribute name="img"><s:property value="product.priced.img"/></jsp:attribute>
                                                    <jsp:attribute name="title">产品名称：<s:property value="productTitle"/></jsp:attribute>
                                                    <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                                    <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                                    <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                                </t:orderItem>
                                            </s:iterator>
                                        </div>
                                        <div class="col-md-4">
                                            <s:url action="getLogisticsStatus" namespace="/order"
                                                   var="getLogisticsStatus">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${getLogisticsStatus}">
                                                <span>查看物流</span>
                                            </a>
                                            <br/>
                                            <s:url action="confirmReceive" namespace="/order" var="confirmReceive">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${confirmReceive}">
                                                <span>确认收货</span>
                                            </a>
                                        </div>
                                    </div>

                                </div>
                            </div>
                        </s:if>
                    </s:iterator>

                </div>
                <!--/.Panel 4-->

                <!--Panel 5-->
                <div class="tab-pane" id="uncomment" role="tabpanel">
                    <br>
                    <s:iterator value="orderList">

                        <s:if test='notCommented'>
                            <div class="card">
                                <div class="card-header">
                                    <div class="row">
                                        <div class="col-md-3">
                                            <div>2016-7-13</div>

                                            <div>订单号：<s:property value="orderId"/></div>
                                        </div>
                                        <div class="col-md-3 ">
                                            <div>总价：<s:property value="total"/></div>

                                            <div>运费：不要钱</div>
                                        </div>

                                        <div class="col-md-3 ">
                                            <div>收货人：<s:property value="address.receiver"/></div>

                                            <div>订单状态：<s:property value="orderStatusString"/></div>
                                        </div>

                                        <div class="col-md-1 col-md-push-2">
                                            <a onclick="bootbox.confirm({
                                                    title:'删除订单',
                                                    message:'确定删除么？',
                                                    callback: function(result){
                                                    if(result){
                                                    deleteOrder(<s:property value="orderId"/>);
                                                    } }
                                                    })">
                                                <i class="fa fa-trash fa-lg" aria-hidden="true"></i>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card-block">
                                    <div class="row">
                                        <div class="col-md-8">
                                            <s:iterator value="orderItems">
                                                <t:orderItem>
                                                    <jsp:attribute name="img"><s:property value="product.priced.img"/></jsp:attribute>
                                                    <jsp:attribute name="title"><s:property value="productTitle"/></jsp:attribute>
                                                    <jsp:attribute name="price"><s:property value="totalPriced"/></jsp:attribute>
                                                    <jsp:attribute name="number"><s:property value="num"/></jsp:attribute>
                                                    <jsp:attribute name="color"><s:property value="product.color"/></jsp:attribute>
                                                </t:orderItem>
                                            </s:iterator>
                                        </div>

                                        <div class="col-md-4">
                                            <s:url action="getLogisticsStatus" namespace="/order"
                                                   var="getLogisticsStatus">
                                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                                            </s:url>
                                            <a href="${getLogisticsStatus}">
                                                <span>查看物流</span>
                                            </a>
                                            <br/>
                                            <a href="#">
                                                <span>评论</span>
                                            </a>
                                        </div>
                                    </div>

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
