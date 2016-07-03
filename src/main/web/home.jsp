<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="head">
            <link href="../../css/home.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="title">个人中心</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="index.jsp">首页</a></li>
           <li class="active">个人中心</li>
       </ol>
    </jsp:attribute>
    <jsp:body>

        <!--Content-->
        <div class="container">

            <div class="card card-home">
                <h4 class="card-header">查看订单</h4>
                <div class="card-block order-block">
                    <div class="row">
                        <div class="col-sm-2">
                            <s:url action="queryOrder.action" namespace="order" var="unpaid">
                                <s:param name="status">unpaid</s:param>
                            </s:url>
                            <s:a href="${unpaid}">
                                <i class="fa fa-credit-card fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待付款</span>
                            </s:a>
                        </div>

                        <div class="col-sm-2">
                            <s:url action="queryOrder.action" namespace="order" var="unshiped">
                                <s:param name="status">unshiped</s:param>
                            </s:url>
                            <s:a href="${unshiped}">
                                <i class="fa fa-truck fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待发货</span>
                            </s:a>
                        </div>

                        <div class="col-sm-2">
                            <s:url action="queryOrder.action" namespace="order" var="shiped">
                                <s:param name="status">shiped</s:param>
                            </s:url>
                            <s:a href="${unpaid}">
                                <i class="fa fa-truck fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待收货</span>
                            </s:a>
                        </div>

                        <div class="col-sm-2">
                            <s:url action="queryOrder.action" namespace="order" var="uncomment">
                                <s:param name="status">uncomment</s:param>
                            </s:url>
                            <s:a href="${uncomment}">
                                <i class="fa fa-edit fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待评价</span>
                            </s:a>
                        </div>

                        <div class="col-sm-2">
                            <s:url action="queryOrder.action" namespace="order" var="all">  </s:url>
                            <s:a href="${unpaid}">
                                <i class="fa fa-th-list  fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>全部订单</span>
                            </s:a>
                        </div>

                        <div class="col-sm-4">
                            <s:form class="form-inline">
                                <input class="form-control" type="text" placeholder="搜索订单">
                            </s:form>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card card-home">
                <h4 class="card-header">设置</h4>
                <div class="card-block order-block">
                    <div class="row">
                        <div class="col-sm-6">
                            <h5 class="h5-responsive font-weight-bold">账户设置</h5>
                            <ul>
                                <li><a href="#">更改密码</a></li>
                                <li><a href="#">修改个人资料</a></li>
                            </ul>
                            <br/>
                            <h5 class="h5-responsive font-weight-bold">查询积分</h5>
                            <ul>
                                <li><s:property value="#session.User.addresses.score"/></li>
                            </ul>
                        </div>

                        <div class="col-sm-6">
                            <h5 class="h5-responsive font-weight-bold">地址簿</h5>
                            <ul>
                                <li><s:a action="viewAddress" namespace="/address">管理地址簿</s:a></li>
                                <s:url var="addAdd" action="viewAddress" namespace="/address">
                                    <s:param name="add">1</s:param>
                                </s:url>
                                <li><a href="${addAdd}" >添加地址</a></li>
                            </ul>
                        </div>
                    </div>
                </div>

            </div>

            <div class="card card-home">
                <h4 class="card-header">个性化</h4>
                <div class="card-block order-block">
                    <div class="row">
                        <div class="col-sm-6">
                            <h5 class="h5-responsive font-weight-bold">收藏夹</h5>
                            <ul>
                                <li><a href="#">查看收藏夹</a></li>
                            </ul>
                        </div>

                        <div class="col-sm-6">
                            <h5 class="h5-responsive font-weight-bold">个性化推荐</h5>
                            <ul>
                                <li><a href="history.jsp">浏览记录</a></li>
                                <li><a href="#">猜你喜欢</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!--/.Content-->


    </jsp:body>
</t:base>