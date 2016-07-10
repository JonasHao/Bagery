<%@ taglib prefix="s" uri="/struts-tags" %>
<%--
  Created by IntelliJ IDEA.
  User: Koche
  Date: 2016/6/29
  Time: 15:56
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INSPINIA | Dashboard</title>
    <link href="/admin/css/bootstrap.min.css" rel="stylesheet">
    <link href="/admin/font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="/admin/css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="/admin/js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="/admin/css/animate.css" rel="stylesheet">
    <link href="/admin/css/style.css" rel="stylesheet">
    <!-- Data Tables -->
    <link href="/admin/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="/admin/css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
    <link href="/admin/css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">

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


</head>

<body>
<div id="wrapper">
    <nav class="navbar-default navbar-static-side" role="navigation">
        <div class="sidebar-collapse">
            <ul class="nav" id="side-menu">
                <li class="nav-header">
                    <div class="dropdown profile-element">
                        <a href="index.html">
                            <h1 class="logo-name" style="font-size:48px;">BAGERY</h1>
                        </a>

                    </div>

                    <div class="logo-element" style="font-size:15px;">BAGERY</div>
                </li>
                <li>
                    <a>
                        <i class="fa fa-diamond"></i>
                        <span class="nav-label">商品管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="add_product.html">发布商品</a></li>
                        <li>
                            <a href="product_list.html">商品列表</a></li>
                    </ul>
                </li>
                <li class="active">
                    <a>
                        <i class="fa fa-files-o"></i>
                        <span class="nav-label">订单管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li class="active">
                            <s:url action="adminQueryOrder1" namespace="/order" var="adminQueryOrder1">
                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                            </s:url>
                            <a href="${adminQueryOrder1}">发货 </a>
                        </li>
                        <li>
                            <s:url action="adminQueryOrder2" namespace="/order" var="adminQueryOrder2">
                                <s:param name="orderId"><s:property value="orderId"/></s:param>
                            </s:url>
                            <a href="${adminQueryOrder2}">订单列表</a>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    </nav>
    <div id="page-wrapper" class="gray-bg dashbard-1">
        <div class="row border-bottom">
            <nav class="navbar navbar-static-top" role="navigation" style="margin-bottom: 0">
                <div class="navbar-header">
                    <a class="navbar-minimalize minimalize-styl-2 btn btn-primary " href="#">
                        <i class="fa fa-bars"></i>
                    </a>
                </div>
                <ul class="nav navbar-top-links navbar-right">
                    <li>
                        <span class="m-r-sm text-muted welcome-message">Bagery后台管理系统</span></li>

                    <li class="dropdown">
                        <a class="dropdown-toggle count-info" data-toggle="dropdown" href="#">
                            <i class="fa fa-bell"></i>
                            <span class="label label-primary">8</span></a>
                        <ul class="dropdown-menu dropdown-alerts">
                            <li>
                                <a href="mailbox.html">
                                    <div>
                                        <i class="fa fa-envelope fa-fw"></i>8个订单待发货
                                        <span class="pull-right text-muted small">4分钟前</span></div>
                                </a>
                            </li>
                        </ul>
                    </li>
                    <li>
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i>退出</a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>订单列表</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a>订单管理</a>
                    </li>
                    <li class="active">
                        <strong>订单列表</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>订单列表</h5>

                                    <div class="ibox-tools">
                                        <a class="collapse-link">
                                            <i class="fa fa-chevron-up"></i>
                                        </a>
                                        <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                                            <i class="fa fa-wrench"></i>
                                        </a>
                                        <ul class="dropdown-menu dropdown-user">
                                            <li><a href="#">Config option 1</a>
                                            </li>
                                            <li><a href="#">Config option 2</a>
                                            </li>
                                        </ul>
                                        <a class="close-link">
                                            <i class="fa fa-times"></i>
                                        </a>
                                    </div>
                                </div>
                                <div class="ibox-content">

                                    <s:actionerror/>

                                    <table class="table table-striped table-bordered table-hover dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>用户id</th>
                                            <th>订单总价</th>
                                            <th>订单状态</th>
                                            <th>备注</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <s:iterator value="orderList" id="orders">

                                            <tr>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="#orders.orderId"/>
                                                </td>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="#orders.userId"/>
                                                </td>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="#orders.total"/>
                                                </td>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="#orders.orderStatus"/>
                                                </td>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="#orders.instruction"/>
                                                </td>
                                                <td class="center">
                                                    <a data-toggle="modal" class="btn btn-info"
                                                       style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;"
                                                       href="#modal-form-detail-<s:property value="#orders.orderId"/>">订单详情</a>


                                                    <a onclick="bootbox.confirm({
                                                            title:'删除订单',
                                                            message:'确定删除么？',
                                                            callback: function(result){
                                                            if(result){
                                                            deleteOrder(<s:property value="#orders.orderId"/>);
                                                            } }
                                                            })">
                                                            <%--<i class="fa fa-trash fa-lg" aria-hidden="true"></i>--%>
                                                        <button type="button" class="btn btn-danger"
                                                                style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;">
                                                            删除订单
                                                        </button>
                                                    </a>

                                                    <s:url action="adminCancelOrder" namespace="/order"
                                                           var="adminCancelOrder">
                                                        <s:param name="orderId"><s:property
                                                                value="#orders.orderId"/></s:param>
                                                    </s:url>
                                                    <a href="${adminCancelOrder}">
                                                        <button type="button" class="btn btn-warning"
                                                                style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;">
                                                            取消订单
                                                        </button>
                                                    </a>

                                                    <div id="modal-form-detail-<s:property value="#orders.orderId"/>"
                                                         class="modal fade"
                                                         aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-body">
                                                                    <div class="row">
                                                                        <div class="col-sm-12 b-r">
                                                                            <div class="ibox float-e-margins">
                                                                                <div class="ibox-title">
                                                                                    <h5>订单详情</h5>
                                                                                </div>
                                                                                <div class="ibox-content">

                                                                                    <h3 class="m-t-none m-b">
                                                                                        商品清单：</h3>
                                                                                    <table class="table table-striped">
                                                                                        <thead>
                                                                                        <tr>
                                                                                            <th>商品名称</th>
                                                                                            <th>单价</th>
                                                                                            <th>数量</th>
                                                                                            <th>总价</th>
                                                                                            <th>评价</th>
                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        <s:iterator value="orderItems"
                                                                                                    id="orderItem">
                                                                                            <tr>
                                                                                                <td class="center"
                                                                                                    style="padding-bottom: 16px;padding-top: 16px;">
                                                                                                    <s:property
                                                                                                            value="#orderItem.productTitle"/>
                                                                                                </td>
                                                                                                <td class="center"
                                                                                                    style="padding-bottom: 16px;padding-top: 16px;">
                                                                                                    <s:property
                                                                                                            value="#orderItem.product.getPriced().getSalePrice()"/>
                                                                                                </td>
                                                                                                <td class="center"
                                                                                                    style="padding-bottom: 16px;padding-top: 16px;">
                                                                                                    <s:property
                                                                                                            value="#orderItem.num"/>
                                                                                                </td>
                                                                                                <td class="center"
                                                                                                    style="padding-bottom: 16px;padding-top: 16px;">
                                                                                                    <s:property
                                                                                                            value="#orderItem.totalPriced"/>
                                                                                                </td>
                                                                                                <td>
                                                                                                    <a data-toggle="modal"
                                                                                                       class="btn btn-primary"
                                                                                                       style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;"
                                                                                                       href="#modal-form-test-<s:property value="#orders.orderId"/>">查看</a>
                                                                                                </td>
                                                                                            </tr>
                                                                                        </s:iterator>
                                                                                        </tbody>

                                                                                        <tfoot>
                                                                                        <tr>
                                                                                            <th></th>
                                                                                            <th></th>
                                                                                            <th></th>
                                                                                            <th>总价:<s:property
                                                                                                    value="#orders.total"/></th>
                                                                                            <th></th>
                                                                                        </tr>
                                                                                        </tfoot>
                                                                                    </table>
                                                                                    <h3 class=" m-t-none m-b">
                                                                                        物流信息：</h3>

                                                                                    <p>
                                                                                        <strong>物流公司：</strong><s:property
                                                                                            value="#orders.courierCompany"/>
                                                                                    </p>

                                                                                    <p>
                                                                                        <strong>运单号码：</strong><s:property
                                                                                            value="#orders.courierNumber"/>
                                                                                    </p>

                                                                                    <p>
                                                                                        <strong>物流动态：</strong>
                                                                                    </p>
                                                                                    <table class="table table-striped">
                                                                                        <thead>
                                                                                        <tr>
                                                                                            <th>时间</th>
                                                                                            <th>事件</th>

                                                                                        </tr>
                                                                                        </thead>
                                                                                        <tbody>
                                                                                        <tr>
                                                                                            <td>2016年5月28日
                                                                                                下午6:26:33
                                                                                            </td>
                                                                                            <td>
                                                                                                已签收,签收人是:【本人签收】
                                                                                            </td>

                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月28日
                                                                                                上午11:22:15
                                                                                            </td>
                                                                                            <td>
                                                                                                【江苏扬州公司】的派件员【吴双】正在派件
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月28日
                                                                                                上午11:16:15
                                                                                            </td>
                                                                                            <td>
                                                                                                快件已到达【江苏扬州公司】
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月28日
                                                                                                上午8:27:57
                                                                                            </td>
                                                                                            <td>
                                                                                                由【江苏泰州中转部】发往【江苏扬州公司】
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月28日
                                                                                                上午2:33:50
                                                                                            </td>
                                                                                            <td>
                                                                                                由【浙江杭州中转部】发往【江苏泰州中转部】
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月27日
                                                                                                下午11:04:22
                                                                                            </td>
                                                                                            <td>
                                                                                                由【浙江湖州公司】发往【浙江杭州中转部】
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月27日
                                                                                                下午10:38:26
                                                                                            </td>
                                                                                            <td>
                                                                                                【浙江湖州公司】正在进行【装袋】扫描
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月27日
                                                                                                下午10:38:26
                                                                                            </td>
                                                                                            <td>
                                                                                                由【浙江湖州公司】发往【江苏无锡中转部】
                                                                                            </td>
                                                                                        </tr>
                                                                                        <tr>
                                                                                            <td>2016年5月27日
                                                                                                下午5:59:37
                                                                                            </td>
                                                                                            <td>
                                                                                                【浙江湖州双林公司】的收件员【双林片】已收件
                                                                                            </td>
                                                                                        </tr>

                                                                                        </tbody>
                                                                                    </table>
                                                                                </div>
                                                                            </div>

                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </td>
                                            </tr>

                                        </s:iterator>
                                        </tbody>

                                    </table>

                                </div>
                            </div>
                        </div>

                    </div>
                </div>
                <div class="footer">
                    <div class="pull-right">
                        Based on a Bootstrap 3 framework called <strong>Inspinia</strong>
                    </div>
                    <div>
                        <strong>Copyright</strong> Exciting Company &copy; 2016
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Mainly scripts -->
<script src="/admin/js/jquery-2.1.1.js"></script>
<script src="/admin/js/bootstrap.min.js"></script>
<script src="/admin/js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="/admin/js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Flot -->
<script src="/admin/js/plugins/flot/jquery.flot.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.spline.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.resize.js"></script>
<script src="/admin/js/plugins/flot/jquery.flot.pie.js"></script>
<!-- Peity -->
<script src="/admin/js/plugins/peity/jquery.peity.min.js"></script>
<script src="/admin/js/demo/peity-demo.js"></script>
<!-- Custom and plugin javascript -->
<script src="/admin/js/inspinia.js"></script>
<script src="/admin/js/plugins/pace/pace.min.js"></script>
<!-- jQuery UI -->
<script src="/admin/js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- GITTER -->
<script src="/admin/js/plugins/gritter/jquery.gritter.min.js"></script>
<!-- Sparkline -->
<script src="/admin/js/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- Sparkline demo data -->
<script src="/admin/js/demo/sparkline-demo.js"></script>
<!-- ChartJS-->
<script src="/admin/js/plugins/chartJs/Chart.min.js"></script>
<!-- Toastr -->
<script src="/admin/js/plugins/toastr/toastr.min.js"></script>
<!-- Data Tables -->
<script src="/admin/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="/admin/js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="/admin/js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="/admin/js/plugins/dataTables/dataTables.tableTools.min.js"></script>

<script>$(document).ready(function () {
    $('.dataTables-example').dataTable({
        responsive: true,
        "dom": 'T<"clear">lfrtip',
        "tableTools": {
            "sSwfPath": "js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
        }
    });

    $('.DTTT_container').remove();


    var data1 = [[0, 4], [1, 8], [2, 5], [3, 10], [4, 4], [5, 16], [6, 5], [7, 11], [8, 6], [9, 11], [10, 30], [11, 10], [12, 13], [13, 4], [14, 3], [15, 3], [16, 6]];
    var data2 = [[0, 1], [1, 0], [2, 2], [3, 0], [4, 1], [5, 3], [6, 1], [7, 5], [8, 2], [9, 3], [10, 2], [11, 1], [12, 0], [13, 2], [14, 8], [15, 0], [16, 0]];
    $("#flot-dashboard-chart").length && $.plot($("#flot-dashboard-chart"), [data1, data2], {
        series: {
            lines: {
                show: false,
                fill: true
            },
            splines: {
                show: true,
                tension: 0.4,
                lineWidth: 1,
                fill: 0.4
            },
            points: {
                radius: 0,
                show: true
            },
            shadowSize: 2
        },
        grid: {
            hoverable: true,
            clickable: true,
            tickColor: "#d5d5d5",
            borderWidth: 1,
            color: '#d5d5d5'
        },
        colors: ["#1ab394", "#464f88"],
        xaxis: {},
        yaxis: {
            ticks: 4
        },
        tooltip: false
    });

    var doughnutData = [{
        value: 300,
        color: "#a3e1d4",
        highlight: "#1ab394",
        label: "App"
    },
        {
            value: 50,
            color: "#dedede",
            highlight: "#1ab394",
            label: "Software"
        },
        {
            value: 100,
            color: "#b5b8cf",
            highlight: "#1ab394",
            label: "Laptop"
        }];

    var doughnutOptions = {
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 2,
        percentageInnerCutout: 45,
        // This is 0 for Pie charts
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
    };

    var ctx = document.getElementById("doughnutChart").getContext("2d");
    var DoughnutChart = new Chart(ctx).Doughnut(doughnutData, doughnutOptions);

    var polarData = [{
        value: 300,
        color: "#a3e1d4",
        highlight: "#1ab394",
        label: "App"
    },
        {
            value: 140,
            color: "#dedede",
            highlight: "#1ab394",
            label: "Software"
        },
        {
            value: 200,
            color: "#b5b8cf",
            highlight: "#1ab394",
            label: "Laptop"
        }];

    var polarOptions = {
        scaleShowLabelBackdrop: true,
        scaleBackdropColor: "rgba(255,255,255,0.75)",
        scaleBeginAtZero: true,
        scaleBackdropPaddingY: 1,
        scaleBackdropPaddingX: 1,
        scaleShowLine: true,
        segmentShowStroke: true,
        segmentStrokeColor: "#fff",
        segmentStrokeWidth: 2,
        animationSteps: 100,
        animationEasing: "easeOutBounce",
        animateRotate: true,
        animateScale: false,
    };
    var ctx = document.getElementById("polarChart").getContext("2d");
    var Polarchart = new Chart(ctx).PolarArea(polarData, polarOptions);

});</script>
<script>(function (i, s, o, g, r, a, m) {
    i['GoogleAnalyticsObject'] = r;
    i[r] = i[r] ||
            function () {
                (i[r].q = i[r].q || []).push(arguments)
            },
            i[r].l = 1 * new Date();
    a = s.createElement(o),
            m = s.getElementsByTagName(o)[0];
    a.async = 1;
    a.src = g;
    m.parentNode.insertBefore(a, m)
})(window, document, 'script', '../../www.google-analytics.com/analytics.js', 'ga');

ga('create', 'UA-4625583-2', 'webapplayers.com');
ga('send', 'pageview');</script>
</body>

</html>

