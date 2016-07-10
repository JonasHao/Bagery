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
</head>

<body>
<div id="wrapper">
    <jsp:include page="/admin/admin_nav.jsp"/>

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
                        <a href="/admin/login.jsp">
                            <i class="fa fa-sign-out"></i>退出</a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>发货</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a>订单管理</a>
                    </li>
                    <li class="active">
                        <strong>发货</strong>
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
                                    <h5>订单列表（只显示待发货订单）</h5>

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
                                            <th>收货人姓名</th>
                                            <th>收货人手机</th>
                                            <th>收货人地址</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>

                                        <s:iterator value="orderList" id="orders">
                                            <s:if test='orderStatus == "unshipped"'>
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
                                                        <s:property value="#orders.address.receiver"/>
                                                    </td>
                                                    <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                        <s:property value="#orders.address.mobile"/>
                                                    </td>
                                                    <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                        <s:property value="#orders.address.addressProvince"/>
                                                        <s:property value="#orders.address.addressCity"/>
                                                        <s:property value="#orders.address.addressDistrict"/>
                                                        <s:property value="#orders.address.addressDetail"/>
                                                    </td>
                                                    <td class="center">

                                                        <a data-toggle="modal" class="btn btn-primary"
                                                           style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;"
                                                           href="#modal-form-send-<s:property value="#orders.orderId"/>">发货</a>

                                                        <a data-toggle="modal" class="btn btn-info"
                                                           style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;"
                                                           href="#modal-form-detail-<s:property value="#orders.orderId"/>">商品清单</a>

                                                        <div id="modal-form-send-<s:property value="#orders.orderId"/>"
                                                             class="modal fade" aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12 b-r">
                                                                                <h3 class="m-t-none m-b">填写物流信息</h3>


                                                                                <form role="form"
                                                                                      action="/order/sendPackage.action">

                                                                                    <input style="display: none"
                                                                                           name="orderId"
                                                                                           value="<s:property value="#orders.orderId"/>"/>

                                                                                    <div class="form-group">
                                                                                        <label>物流公司</label> <input
                                                                                            type="text" placeholder="顺丰"
                                                                                            class="form-control"
                                                                                            name="logisticsCompany"
                                                                                            value="${logisticsCompany}"/>
                                                                                    </div>
                                                                                    <div class="form-group">
                                                                                        <label>物流单号</label> <input
                                                                                            type="text"
                                                                                            placeholder="1648679434651"
                                                                                            class="form-control"
                                                                                            name="logisticsNum"
                                                                                            value="${logisticsNum}"/>
                                                                                    </div>
                                                                                    <div>
                                                                                        <button class="btn btn-sm btn-primary pull-right m-t-n-xs"
                                                                                                type="submit">
                                                                                            <strong>发货</strong></button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                        <div id="modal-form-detail-<s:property value="#orders.orderId"/>"
                                                             class="modal fade"
                                                             aria-hidden="true">
                                                            <div class="modal-dialog">
                                                                <div class="modal-content">
                                                                    <div class="modal-body">
                                                                        <div class="row">
                                                                            <div class="col-sm-12 b-r">
                                                                                <h3 class="m-t-none m-b">商品清单</h3>
                                                                                <table class="table table-striped">
                                                                                    <thead>
                                                                                    <tr>
                                                                                        <th>商品名称</th>
                                                                                        <th>单价</th>
                                                                                        <th>数量</th>
                                                                                        <th>总价</th>
                                                                                    </tr>
                                                                                    </thead>
                                                                                    <tbody>
                                                                                    <s:iterator value="orderItems"
                                                                                                id="orderItem">

                                                                                        <tr>
                                                                                            <td>
                                                                                                <s:property
                                                                                                        value="#orderItem.productTitle"/>
                                                                                            </td>
                                                                                            <td>
                                                                                                <s:property
                                                                                                        value="#orderItem.product.getPriced().getSalePrice()"/>
                                                                                            </td>
                                                                                            <td>
                                                                                                <s:property
                                                                                                        value="#orderItem.num"/>
                                                                                            </td>
                                                                                            <td>
                                                                                                <s:property
                                                                                                        value="#orderItem.totalPriced"/>
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
                                                                                    </tr>
                                                                                    </tfoot>
                                                                                </table>

                                                                            </div>
                                                                        </div>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>

                                                    </td>
                                                </tr>
                                            </s:if>
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

<script src="/js/plugin/bootbox/bootbox.min.js"></script>

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

