<%@ taglib prefix="s" uri="/struts-tags" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<nav class="navbar-default navbar-static-side" role="navigation">
    <div class="sidebar-collapse">
        <ul class="nav" id="side-menu">
            <li class="nav-header">
                <div class="dropdown profile-element">
                    <a href="/admin/index.jsp">
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
                    <li class="active">
                        <a href="/admin/add_product.jsp">发布商品</a></li>
                    <li>
                        <s:url action="pricedList" namespace="/admin" var="Link"/>
                        <a href="${Link}">商品列表</a>
                    </li>
                </ul>
            </li>
            <li>
                <a>
                    <i class="fa fa-files-o"></i>
                    <span class="nav-label">订单管理</span>
                    <span class="fa arrow"></span>
                </a>

                <ul class="nav nav-second-level">
                    <li class="active">
                        <s:url action="queryOrder" namespace="/admin-order" var="adminQueryOrder1">
                        </s:url>
                        <a href="${adminQueryOrder1}">发货 </a>
                    </li>
                    <li>
                        <s:url action="queryOrder2" namespace="/admin-order" var="adminQueryOrder2">
                        </s:url>
                        <a href="${adminQueryOrder2}">订单列表</a>
                    </li>
                </ul>
            </li>
        </ul>
    </div>
</nav>