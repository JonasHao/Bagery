<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


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
    <!-- Data Tables -->
    <link href="css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">
    <link href="css/plugins/dataTables/dataTables.responsive.css" rel="stylesheet">
    <link href="css/plugins/dataTables/dataTables.tableTools.min.css" rel="stylesheet">
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
                <li class="active">
                    <a>
                        <i class="fa fa-diamond"></i>
                        <span class="nav-label">商品管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <s:url action="viewProduct" namespace="/admin" var="addLink"/>
                            <a href="add_product.jsp">发布商品</a></li>
                        <li class="active">
                            <s:url action="pricedList" namespace="/admin" var="listLink"/>
                            <a href="${listLink}">商品列表</a></li>
                    </ul>
                </li>
                <li>
                    <a>
                        <i class="fa fa-files-o"></i>
                        <span class="nav-label">订单管理</span>
                        <span class="fa arrow"></span>
                    </a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="send_goods.html">发货</a></li>
                        <li>
                            <a href="order_list.html">订单列表</a></li>
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

        <%--页面标题和面包导航--%>
        <div class="row wrapper border-bottom white-bg page-heading">
            <div class="col-lg-10">
                <h2>商品列表</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="index.html">首页</a>
                    </li>
                    <li>
                        <a>商品管理</a>
                    </li>
                    <li class="active">
                        <strong>商品列表</strong>
                    </li>
                </ol>
            </div>
            <div class="col-lg-2">
            </div>
        </div>
        <%--/页面标题和面包导航--%>


        <div class="row">
            <div class="col-lg-12">
                <div class="wrapper wrapper-content">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="ibox float-e-margins">
                                <div class="ibox-title">
                                    <h5>商品列表</h5>
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


                                    <%--正文列表--%>
                                    <table class="table table-striped table-bordered table-hover dataTables-example">
                                        <thead>
                                        <tr>
                                            <th>id</th>
                                            <th>商品名称</th>
                                            <th>商品原价</th>
                                            <th>商品优惠价</th>
                                            <th>操作</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <s:iterator value="priceds">
                                            <tr>
                                                    <%--url definitions   --%>
                                                <s:url var="productDetail" action="viewProduct"
                                                       namespace="/admin">
                                                    <s:param name="pricedId"><s:property value="pricedId"/> </s:param>
                                                </s:url>

                                                    <%--id--%>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="pricedId"/>
                                                </td>
                                                    <%--商品名称--%>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <a href="${productDetail}"><s:property value="title"/></a></td>
                                                    <%--原价--%>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="unitPrice"/>
                                                </td>
                                                    <%--优惠价--%>
                                                <td class="center" style="padding-bottom: 16px;padding-top: 16px;">
                                                    <s:property value="salePrice"/>
                                                </td>
                                                    <%--更新--%>
                                                <td class="center">
                                                    <a href="${productDetail}">
                                                        <button type="button"
                                                                class="btn btn-info"
                                                                style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;">
                                                            更新
                                                        </button>
                                                    </a>

                                                    <s:if test="isExisted==1">
                                                        <%-- 下架 --%>
                                                        <s:url var="soldOutPriced" action="soldOutPriced"
                                                               namespace="/admin">
                                                            <s:param name="pricedId"><s:property value="pricedId"/>
                                                            </s:param>
                                                        </s:url>
                                                        <a href="${soldOutPriced}">
                                                            <button type="button" class="btn btn-warning"
                                                                    style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;">
                                                                下架
                                                            </button>
                                                        </a>
                                                        <%-- /下架 --%>
                                                    </s:if>

                                                    <s:else>
                                                        <%-- 上架 --%>
                                                        <s:url var="putOnPriced" action="putOnPriced"
                                                               namespace="/admin">
                                                            <s:param name="pricedId"><s:property value="pricedId"/>
                                                            </s:param>
                                                        </s:url>
                                                        <a href="${putOnPriced}">
                                                            <button type="button" class="btn btn-primary"
                                                                    style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;">
                                                                上架
                                                            </button>
                                                        </a>

                                                        <%-- /删除 --%>
                                                    </s:else>

                                                    <s:url var="deletePriced" action="deletePriced"
                                                           namespace="/admin">
                                                        <s:param name="pricedId"><s:property value="pricedId"/>
                                                        </s:param>
                                                    </s:url>
                                                    <a  onclick="notify('删除成功')">
                                                        <button type="button" class="btn btn-danger"
                                                                style="margin-bottom: 0px;margin-right: 5px;margin-left: 5px;">
                                                            删除
                                                        </button>
                                                    </a>
                                                </td>
                                            </tr>
                                        </s:iterator>


                                        </tbody>

                                    </table>
                                    <%--/正文列表--%>
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
<script src="js/plugins/jeditable/jquery.jeditable.js"></script>
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
<!-- Data Tables -->
<script src="js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="js/plugins/dataTables/dataTables.bootstrap.js"></script>
<script src="js/plugins/dataTables/dataTables.responsive.js"></script>
<script src="js/plugins/dataTables/dataTables.tableTools.min.js"></script>
<script src="../js/notify.js"></script>

<script type="text/javascript">
    $(document).ready(function () {

        function getQueryString(name) {
            var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
            var r = window.location.search.substr(1).match(reg);
            console.log(getQueryString(r));
            if (r != null) return unescape(r[2]);
            return null;
        }

        $('.dataTables-example').dataTable({
            responsive: true,
            "dom": 'T<"clear">lfrtip',
            "tableTools": {
                "sSwfPath": "js/plugins/dataTables/swf/copy_csv_xls_pdf.swf"
            }
        });
        $('.DTTT_container').remove();

        setTimeout(function () {
                    toastr.options = {
                        closeButton: true,
                        progressBar: true,
                        showMethod: 'slideDown',
                        timeOut: 4000
                    };
                    var m=getQueryString("message");
                    toastr.success('后台管理系统',m);

                },
                1300);
    });
</script>

<style scoped>
    body.DTTT_Print {
        background: #fff;
    }

    .DTTT_Print #page-wrapper {
        margin: 0;
        background: #fff;
    }

    button.DTTT_button,
    div.DTTT_button,
    a.DTTT_button {
        border: 1px solid #e7eaec;
        background: #fff;
        color: #676a6c;
        box-shadow: none;
        padding: 6px 8px;
    }

    button.DTTT_button:hover,
    div.DTTT_button:hover,
    a.DTTT_button:hover {
        border: 1px solid #d2d2d2;
        background: #fff;
        color: #676a6c;
        box-shadow: none;
        padding: 6px 8px;
    }

    .dataTables_filter label {
        margin-right: 5px;
    }
</style>
</body>

</html>