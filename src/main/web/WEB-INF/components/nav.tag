<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<!-- Collapse button-->
<button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx">
    <i class="fa fa-bars"></i>
</button>
<!--Collapse content-->
<div class="container">

    <div class="collapse navbar-toggleable-xs" id="collapseEx">
        <div class="row">
            <div class="col-sm-12 col-md-10">
                <div class="container">
                    <!--Navbar Brand-->
                    <a class="navbar-brand" href="../../index.jsp"
                       target="_blank">BAGERY</a>
                    <!--Links-->

                    <ul class="nav navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link" href="../../list.jsp">女人</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../list.jsp">男人</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="../../list.jsp">运动</a>
                        </li>

                    </ul>
                    <!--Search form-->
                    <s:form class="form-inline">
                        <input class="form-control" type="text" placeholder="Search">
                    </s:form>

                </div>
            </div>

            <div class="col-sm-3 col-md-2">
                <div class="nav navbar-nav">
                    <div class="nav-item dropdown">
                        <a class="nav-link dropdown-toggle" type="button" id="dropdownMenu1" data-toggle="dropdown"
                           aria-haspopup="true" aria-expanded="false">
                            <button class="btn-sm btn-link nav-btn-user">
                                <i class="fa fa-user fa-lg" aria-hidden="true"></i>
                            </button>
                        </a>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenu1">
                            <%
                                Object user = session.getAttribute("user");
                                boolean logged = (user != null);
                            %>
                            <s:if test="logged">
                                <a class="dropdown-item" href="#">个人中心</a>
                                <a class="dropdown-item" href="#">我的订单</a>
                                <a class="dropdown-item" href="#">收藏夹</a>
                                <a class="dropdown-item" href="#">退出</a>
                            </s:if>
                            <s:else>
                                <a class="dropdown-item" href="#">登录</a>
                                <a class="dropdown-item" href="#">注册</a>
                            </s:else>

                        </div>
                    </div>
                </div>
                <button class="btn-sm btn-link nav-btn-cart" type="button">
                    <i class="fa fa-shopping-cart fa-lg" aria-hidden="true"></i>
                </button>
            </div>

        </div>


    </div>


</div>
<!--/.Collapse content-->