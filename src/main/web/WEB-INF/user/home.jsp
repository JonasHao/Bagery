<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="scripts">
        <script type="text/javascript">
            var reg = new RegExp("(^|&)" + "message" + "=([^&]*)(&|$)", "i");
            var r = location.search.substr(1).match(reg);
            var m;
            if (r != null)
                m = unescape(decodeURI(r[2]));
            else m = null;

            if (m != null) {
                if(m=="网络异常！"){
                    warning(m);
                }
                else {
                    notify(m);
                }
            }
        </script>
    </jsp:attribute>

    <jsp:attribute name="head">
            <link href="../../css/home.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="title">个人中心</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li class="active">个人中心</li>
       </ol>
    </jsp:attribute>
    <jsp:body>

        <!--Content-->
        <div class="container">

            <div class="card card-home">

                <div class="card-block order-block">
                    <div class="media">
                        <a class="media-left home-avatar" href="/user/viewInfo.action">
                            <img class="img-circle" width="128" height="128" src="<s:property value="img"/>"/>
                        </a>

                        <s:set name="group" value="group"/>
                        <div class="media-body home-profile-body">
                            <h4 class="media-heading heading-username"><s:property value="user.username"/></h4>
                            <p>积分：<s:property value="score"/> &nbsp;&nbsp;
                                <s:if test="#group==1">等级：普通用户</s:if>
                                <s:elseif test="#group==2">等级：中级用户</s:elseif>
                                <s:elseif test="#group==3">等级：高级用户</s:elseif>
                                <s:elseif test="#group==4">等级：超级管理员</s:elseif>
                                <s:elseif test="#group==5">等级：商品管理员</s:elseif>
                                <s:elseif test="#group==6">等级：订单管理员</s:elseif>
                            </p>
                        </div>
                    </div>
                </div>

            </div>

            <div class="card card-home">
                <div class="card-header">
                    <div class="container">
                        <div class="row">
                            <div class="col-md-4 no-edge">
                                <h4>查看订单</h4></div>
                            <div class="pull-right">
                                <s:form class="form-inline">
                                    <input class="form-control no-edge" type="text" placeholder="搜索订单">
                                </s:form>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card-block order-block">
                    <div class="row">
                        <div class="col-sm-2">
                            <a href="/order/queryOrder?status=unpaid">
                                <i class="fa fa-credit-card fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待付款</span>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="/order/queryOrder?status=unshipped">
                                <i class="fa fa-cubes fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待发货</span>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="/order/queryOrder?status=shipped">
                                <i class="fa fa-truck fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待收货</span>
                            </a>
                        </div>

                        <div class="col-sm-2">
                            <a href="/order/queryOrder?status=uncomment">
                                <i class="fa fa-edit fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>待评价</span>
                            </a>
                        </div>

                        <div class="col-sm-2">

                            <a href="/order/queryOrder?status=all">
                                <i class="fa fa-th-list  fa-3x" aria-hidden="true"></i>
                                <br/>
                                <span>全部订单</span>
                            </a>
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
                                <li><s:a action="openReset" namespace="/user">更改密码</s:a></li>
                                <li><s:a action="viewInfo" namespace="/user">修改个人资料</s:a></li>
                            </ul>

                        </div>

                        <div class="col-sm-6">
                            <h5 class="h5-responsive font-weight-bold">地址簿</h5>
                            <ul>
                                <li><s:a action="viewAddress" namespace="/address">管理地址簿</s:a></li>
                                <s:url var="addAdd" action="viewAddress" namespace="/address">
                                    <s:param name="add">1</s:param>
                                </s:url>
                                <li><a href="${addAdd}">添加地址</a></li>
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
                                <li><s:a namespace="/favorite" action="queryFavorite">查看收藏夹</s:a></li>
                            </ul>
                        </div>

                        <div class="col-sm-6">
                            <h5 class="h5-responsive font-weight-bold">个性化推荐</h5>
                            <ul>
                                <li><s:a namespace="/product" action="historyRecord">浏览记录</s:a></li>
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