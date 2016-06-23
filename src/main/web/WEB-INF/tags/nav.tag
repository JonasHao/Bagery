<%@tag description="Overall Page template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>


<!-- Collapse button-->
<button class="navbar-toggler hidden-sm-up" type="button" data-toggle="collapse" data-target="#collapseEx">
    <i class="fa fa-bars"></i>
</button>

<div class="container">
    <!--Collapse content-->
    <div class="collapse navbar-toggleable-xs" id="collapseEx">
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
            <a href="../../home.jsp" class="btn btn-sm btn-link" type="button">
                <i class="fa fa-user" aria-hidden="true"></i>
            </a>
            <button class="btn btn-sm btn-link" type="button">
                <i class="fa fa-shopping-cart" aria-hidden="true"></i>
            </button>
        </s:form>
    </div>
    <!--/.Collapse content-->
</div>