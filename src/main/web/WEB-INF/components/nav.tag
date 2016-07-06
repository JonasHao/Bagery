<%@ tag import="constant.Config" %>
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
                        <s:url var="womanUrl" namespace="/product" action="productListByPro">
                        </s:url>

                        <li class="nav-item">
                            <a class="nav-link" href="${womanUrl}">女人</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${womanUrl}">男人</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" href="${womanUrl}">运动</a>
                        </li>

                    </ul>
                    <!--Search form-->
                    <s:form class="form-inline" action="productListByWord" namespace="/product">
                        <input class="form-control" type="text" placeholder="Search" name="word">
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
                                if(Config.DEBUG){
                                    session.setAttribute("user","Bagery");
                                }
                            %>
                            <s:if test="#session.user!=null">
                                <s:a class="dropdown-item" action="home" namespace="/user">个人中心</s:a>
                                <a class="dropdown-item" href="#">我的订单</a>
                                <s:a class="dropdown-item" action="queryFavorite" namespace="/favorite">收藏夹</s:a>
                                <s:a class="dropdown-item"  action="logout" namespace="/user">退出</s:a>
                            </s:if>
                            <s:else>
                                <a class="dropdown-item" href="#">登录</a>
                                <a class="dropdown-item" href="#">注册</a>
                            </s:else>

                        </div>
                    </div>
                </div>
                <s:a action="queryCart" namespace="/cart">
                <button class="btn-sm btn-link nav-btn-cart" type="button">
                    <i class="fa fa-shopping-cart fa-lg" aria-hidden="true"></i>
                </button>
                </s:a>
            </div>

        </div>


    </div>


</div>
<!--/.Collapse content-->