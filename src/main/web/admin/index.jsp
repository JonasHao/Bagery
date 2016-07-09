<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>

<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>INSPINIA | Dashboard</title>
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
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
                        <a href="login.html">
                            <i class="fa fa-sign-out"></i>退出</a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="row  border-bottom white-bg dashboard-header">
            <div class="col-sm-3">
                <h2>首页</h2>
                <p>本系统由Exciting团队开发完成</p>

            </div>

        </div>

        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row">
                        <div class="col-lg-6">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-success pull-right">月度</span>
                                    <h5>进账</h5></div>
                                <div class="ibox-content">
                                    <h1 class="no-margins">40 886,200</h1>

                                    <small>元</small>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <span class="label label-success pull-right">月度</span>
                                    <h5>订单数</h5></div>
                                <div class="ibox-content">
                                    <h1 class="no-margins">275,800</h1>

                                    <small>笔</small>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>团队成员</h5>
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
                                    <div class="row">
                                        <div class="col-sm-4">
                                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                                <div class="m-b-md">
                                                    <h2 class="font-bold no-margins">
                                                        郝俊楠
                                                    </h2>
                                                    <small>项目经理</small>
                                                </div>
                                                <img src="img/a1.jpg" class="img-circle circle-border m-b-md"
                                                     alt="profile">
                                                <div>
                                                    <span>100 commits</span> |
                                                    <span>350 tasks finished</span>

                                                </div>
                                            </div>
                                            <div class="widget-text-box">
                                                <h4 class="media-heading">郝俊楠</h4>
                                                <p>贡献描述</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                                <div class="m-b-md">
                                                    <h2 class="font-bold no-margins">
                                                        王嘉璇
                                                    </h2>
                                                    <small>配置管理员</small>
                                                </div>
                                                <img src="img/a2.jpg" class="img-circle circle-border m-b-md"
                                                     alt="profile">
                                                <div>
                                                    <span>100 commits</span> |
                                                    <span>350 tasks finished</span>

                                                </div>
                                            </div>
                                            <div class="widget-text-box">
                                                <h4 class="media-heading">王嘉璇</h4>
                                                <p>贡献描述</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                                <div class="m-b-md">
                                                    <h2 class="font-bold no-margins">
                                                        金悦媛
                                                    </h2>
                                                    <small>测试人员</small>
                                                </div>
                                                <img src="img/a3.jpg" class="img-circle circle-border m-b-md"
                                                     alt="profile">
                                                <div>
                                                    <span>100 commits</span> |
                                                    <span>350 tasks finished</span>

                                                </div>
                                            </div>
                                            <div class="widget-text-box">
                                                <h4 class="media-heading">金悦媛</h4>
                                                <p>贡献描述</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                                <div class="m-b-md">
                                                    <h2 class="font-bold no-margins">
                                                        张健
                                                    </h2>
                                                    <small>测试经理</small>
                                                </div>
                                                <img src="img/a4.jpg" class="img-circle circle-border m-b-md"
                                                     alt="profile">
                                                <div>
                                                    <span>100 commits</span> |
                                                    <span>350 tasks finished</span>

                                                </div>
                                            </div>
                                            <div class="widget-text-box">
                                                <h4 class="media-heading">张健</h4>
                                                <p>贡献描述</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                                <div class="m-b-md">
                                                    <h2 class="font-bold no-margins">
                                                        常诚
                                                    </h2>
                                                    <small>数据库管理员</small>
                                                </div>
                                                <img src="img/a5.jpg" class="img-circle circle-border m-b-md"
                                                     alt="profile">
                                                <div>
                                                    <span>100 commits</span> |
                                                    <span>350 tasks finished</span>

                                                </div>
                                            </div>
                                            <div class="widget-text-box">
                                                <h4 class="media-heading">常诚</h4>
                                                <p>贡献描述</p>
                                            </div>
                                        </div>
                                        <div class="col-sm-4">
                                            <div class="widget-head-color-box navy-bg p-lg text-center">
                                                <div class="m-b-md">
                                                    <h2 class="font-bold no-margins">
                                                        葛星辰
                                                    </h2>
                                                    <small>开发经理</small>
                                                </div>
                                                <img src="img/a6.jpg" class="img-circle circle-border m-b-md"
                                                     alt="profile">
                                                <div>
                                                    <span>100 commits</span> |
                                                    <span>350 tasks finished</span>

                                                </div>
                                            </div>
                                            <div class="widget-text-box">
                                                <h4 class="media-heading">葛星辰</h4>
                                                <p>贡献描述</p>
                                            </div>
                                        </div>
                                    </div>
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
<script src="js/jquery-2.1.1.js"></script>
<script src="js/bootstrap.min.js"></script>
<script src="js/plugins/metisMenu/jquery.metisMenu.js"></script>
<script src="js/plugins/slimscroll/jquery.slimscroll.min.js"></script>
<!-- Flot -->
<script src="js/plugins/flot/jquery.flot.js"></script>
<script src="js/plugins/flot/jquery.flot.tooltip.min.js"></script>
<script src="js/plugins/flot/jquery.flot.spline.js"></script>
<script src="js/plugins/flot/jquery.flot.resize.js"></script>
<script src="js/plugins/flot/jquery.flot.pie.js"></script>
<!-- Peity -->
<script src="js/plugins/peity/jquery.peity.min.js"></script>
<script src="js/demo/peity-demo.js"></script>
<!-- Custom and plugin javascript -->
<script src="js/inspinia.js"></script>
<script src="js/plugins/pace/pace.min.js"></script>
<!-- jQuery UI -->
<script src="js/plugins/jquery-ui/jquery-ui.min.js"></script>
<!-- GITTER -->
<script src="js/plugins/gritter/jquery.gritter.min.js"></script>
<!-- Sparkline -->
<script src="js/plugins/sparkline/jquery.sparkline.min.js"></script>
<!-- Sparkline demo data -->
<script src="js/demo/sparkline-demo.js"></script>
<!-- ChartJS-->
<script src="js/plugins/chartJs/Chart.min.js"></script>
<!-- Toastr -->
<script src="js/plugins/toastr/toastr.min.js"></script>
<script>$(document).ready(function () {
    setTimeout(function () {
                toastr.options = {
                    closeButton: true,
                    progressBar: true,
                    showMethod: 'slideDown',
                    timeOut: 4000
                };
                toastr.success('后台管理系统', '欢迎来到Bagery');

            },
            1300);

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