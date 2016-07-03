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
<<<<<<< HEAD


=======
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
            })
        </script>
     </jsp:attribute>
>>>>>>> origin/master
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
                    <a class="nav-link " data-toggle="tab" href="#unshiped" role="tab">待发货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" data-toggle="tab" href="#shiped" role="tab">待收货</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link " data-toggle="tab" href="#uncomment" role="tab">待评价</a>
                </li>

            </ul>

            <div class="tab-content">

                <!--Panel 1-->
                <div class="tab-pane active" id="all" role="tabpanel">
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
                        <div class="card-block">
                            <s:iterator begin="1" end="3">
                                <t:orderItem>
                                    <jsp:attribute name="img">"../../img/bags/bag1.png"</jsp:attribute>
                                    <jsp:attribute name="title">商品标题</jsp:attribute>
                                    <jsp:attribute name="price">99999.99</jsp:attribute>
                                    <jsp:attribute name="number">1</jsp:attribute>
                                    <jsp:attribute name="color">红色</jsp:attribute>
                                </t:orderItem>
                            </s:iterator>

                        </div>
                    </div>

                </div>
                <!--/.Panel 1-->

                <!--Panel 2-->
                <div class="tab-pane" id="unpaid" role="tabpanel">
                    <br>

                    <p>Content for Panel 2</p>

                </div>
                <!--/.Panel 2-->

                <!--Panel 3-->
                <div class="tab-pane" id="unshiped" role="tabpanel">
                    <br>

                    <p>Content for Panel 3</p>

                </div>
                <!--/.Panel 3-->

                <!--Panel 4-->
                <div class="tab-pane" id="shiped" role="tabpanel">
                    <br>

                    <p>Content for Panel 4</p>

                </div>
                <!--/.Panel 4-->

                <!--Panel 5-->
                <div class="tab-pane" id="uncomment" role="tabpanel">
                    <br>

                    <p>Content for Panel 5</p>

                </div>
                <!--/.Panel 5-->

            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
