<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
    response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
    response.setHeader("Expires", "0"); // Proxies.
%>
<html>
<head>
    <link rel="stylesheet" type="text/css" href="src/main/web/admin/css/product.css"/>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="css/bootstrap.min.css" rel="stylesheet">
    <link href="font-awesome/css/font-awesome.css" rel="stylesheet">
    <!-- Toastr style -->
    <link href="css/plugins/toastr/toastr.min.css" rel="stylesheet">
    <!-- Gritter -->
    <link href="js/plugins/gritter/jquery.gritter.css" rel="stylesheet">
    <link href="css/animate.css" rel="stylesheet">
    <link href="css/style.css" rel="stylesheet">
    <link href="css/product.css" rel="stylesheet">
    <title>Bagery | 后台管理系统</title>
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
                                <a href="#">
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
                <h2>更新商品信息</h2>
                <ol class="breadcrumb">
                    <li>
                        <a href="html/index.html">首页</a>
                    </li>
                    <li>
                        <a>商品管理</a>
                    </li>
                    <li class="active">
                        <strong>更新商品信息</strong>
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
                                    <h5>填写商品信息 </h5>
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

                                    <form action="updatePriced" namespace="/admin" class="form-horizontal">
                                        <div class="form-group">

                                            <input hidden="true" type="text" name="pricedId"
                                                   value="<s:property value="pricedId"/>">

                                        </div>

                                        <div class="form-group">
                                            <label class="col-sm-2 control-label">商品名称</label>
                                            <div class="col-sm-10"><s:textfield name="priced.title"
                                                                                cssClass="form-control">
                                            </s:textfield>
                                            </div>
                                        </div>

                                        <div class="form-group">

                                            <label class="col-sm-2 control-label">商品图片</label>
                                            <div class="col-sm-10"><s:textfield name="priced.img"
                                                                                cssClass="form-control">
                                            </s:textfield></div>
                                        </div>

                                        <div class="form-group"><label class="col-sm-2 control-label">商品描述</label>
                                            <div class="col-sm-10">
                                                <s:textarea name="priced.description"
                                                            cssClass="form-control"
                                                            cssStyle="resize: vertical;height:120px;">
                                                    <s:property value="description"/>
                                                </s:textarea>
                                                <span class="help-block m-b-none">*拖动文本框右下角可改变文本框高度</span>
                                            </div>
                                        </div>

                                        <div class="form-group"><label class="col-sm-2 control-label">商品原价</label>
                                            <div class="col-sm-10"><s:textfield name="priced.unitPrice"
                                                                                cssClass="form-control"/></div>
                                        </div>

                                        <div class="form-group"><label class="col-sm-2 control-label">商品优惠价</label>

                                            <div class="col-sm-10"><s:textfield name="priced.salePrice"
                                                                                cssClass="form-control"/></div>
                                        </div>

                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group"><label class="col-sm-2 control-label">商品属性</label>
                                            <div class="col-sm-10">
                                                <div class="row">
                                                    <label class="col-sm-4 control-label"
                                                           style="font-weight:normal;">品牌</label>
                                                    <div class="col-sm-4">
                                                        <%--todo: s:select的list属性设置成action中的List--%>
                                                        <s:select
                                                                list="#{'1':'芬迪', '2':'古琦','3':'巴宝莉','4':'安娜苏','5':'宝格丽','6':'香奈儿',
                                                                           '7':'卡尔文•克莱恩','8':'川久保玲','9':'迪奥','10':'登喜路',
                                                                           '11':'纪梵希','12':'戈雅','13':'爱马仕'}"
                                                                name="proIDs[0]" cssClass="form-control m-b" />
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 control-label"
                                                           style="font-weight:normal;">材质</label>
                                                    <div class="col-sm-4">
                                                        <s:select list="#{'14':'鳄鱼皮','15':'帆布','16':'公牛皮','17':'浣熊皮草','18':'棉',
                                                        '19':'尼龙','20':'蛇皮','21':'羊毛','22':'漆皮','23':'其他纤维'}"
                                                                  name="proIDs[1]" cssClass="form-control m-b"/>
                                                    </div>
                                                </div>
                                                <div class="row">
                                                    <label class="col-sm-4 control-label"
                                                           style="font-weight:normal;">款式</label>
                                                    <div class="col-sm-4">
                                                        <s:select list="#{'24':'单肩包', '25':'双肩包', '26':'手拿包','27':'手提包',
                                                        '28':'斜挎包','29':'电脑包','30':'箱包','31':'腰包'}"
                                                                  name="proIDs[2]" cssClass="form-control m-b"/>
                                                    </div>
                                                </div>
                                            </div>


                                        </div>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group"><label class="col-sm-2 control-label">商品颜色</label>

                                            <div class="col-sm-10" id="color_stock">
                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[0].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[0].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[1].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[1].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[2].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[2].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[3].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[3].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>

                                                <div class="row">
                                                    <div class="col-sm-6">
                                                        <s:textfield name="products[4].color" placeholder="请输入颜色"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                    <div class="col-sm-4">
                                                        <s:textfield name="products[4].stock" placeholder="请输入库存"
                                                                     cssClass="form-control m-b"/>
                                                    </div>
                                                </div>
                                            </div>

                                        </div>
                                        <%--<div class="form-group">--%>
                                        <%--<span class="col-sm-2"></span>--%>
                                        <%--<small class="col-sm-10 text-navy" onclick="addColor()">再添加一种颜色</small>--%>
                                        <%--</div>--%>
                                        <div class="hr-line-dashed"></div>
                                        <div class="form-group">
                                            <div class="col-sm-4 col-sm-offset-2">
                                                <s:submit cssClass="btn btn-primary" value="提交"/>
                                            </div>
                                        </div>
                                    </form>
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
<script>
    $(document).ready(function () {
        $('.i-checks').iCheck({
            checkboxClass: 'icheckbox_square-green',
            radioClass: 'iradio_square-green',
        });
    });

    function addColor() {
        // document.getElementById('color_stock').appendChild("<strong>test</strong>");
        var div = document.createElement("div");
        div.className = "row";
        div.innerHTML = "<div class=\"col-sm-6\"><input type=\"text\" placeholder=\"请输入颜色\" class=\"form-control m-b\"></div><div class=\"col-sm-4\"><input type=\"text\" placeholder=\"请输入库存\" class=\"form-control m-b\"></div><button class=\"col-sm-2 btn btn-warning btn-circle\" type=\"button\" onclick=\"deleteColor()\"><i class=\"fa fa-times\"></i></button>";

        document.getElementById('color_stock').appendChild(div);
    }
    function deleteColor() {
        var clicked = event.target;
        var todelete;
        if (clicked.nodeName == "I") {
            todelete = clicked.parentNode.parentNode;
        } else {
            todelete = clicked.parentNode;
        }
        todelete.parentNode.removeChild(todelete);
    }
</script>
</body>
</html>
