<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>

    <jsp:attribute name="title">商品列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="index.jsp">首页</a></li>
           <li class="active">商品列表</li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="row">
                <!--Sidebar-->
                <div class="col-md-3">

                    <div class="widget-wrapper">
                        <h6>性别:</h6>
                        <div class="list-group">
                            <a href="#" class="list-group-item filter-list-group-item  active">Woman</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Man</a>
                        </div>
                    </div>

                    <div class="widget-wrapper">
                        <h6>品牌:</h6>
                        <div class="list-group">
                            <a href="#" class="list-group-item filter-list-group-item  active">Woman</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Man</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Shoes</a>
                            <a href="#" class="list-group-item filter-list-group-item ">T-shirt</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Jewellery</a>
                        </div>
                    </div>

                    <div class="widget-wrapper">
                        <h6>功能:</h6>
                        <div class="list-group">
                            <a href="#" class="list-group-item filter-list-group-item  active">Woman</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Man</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Shoes</a>
                            <a href="#" class="list-group-item filter-list-group-item ">T-shirt</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Jewellery</a>
                        </div>
                    </div>

                    <div class="widget-wrapper">
                        <h6>材质:</h6>
                        <div class="list-group">
                            <a href="#" class="list-group-item filter-list-group-item  active">Woman</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Man</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Shoes</a>
                            <a href="#" class="list-group-item filter-list-group-item ">T-shirt</a>
                            <a href="#" class="list-group-item filter-list-group-item ">Jewellery</a>
                        </div>
                    </div>
                </div>
                <!--/.Sidebar-->
                <!--Main column-->
                <div class="col-md-9">

                    <div class="tab-content">

                        <div class="page tab-pane active" id="products-page-1" role="tabpanel">
                            <div class="row">
                                <div class="col-md-4">
                                    <t:product>
                                        <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                                        <jsp:attribute name="title">包包标题</jsp:attribute>
                                        <jsp:attribute name="price">99999.00</jsp:attribute>
                                        <jsp:attribute name="productID">1</jsp:attribute>
                                    </t:product>
                                </div>
                            </div>
                        </div>
                        <div class="page tab-pane" id="products-page-2" role="tabpanel">
                            <div class="row">
                                <div class="col-md-4">
                                    <t:product>
                                        <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                                        <jsp:attribute name="title">包包标题2</jsp:attribute>
                                        <jsp:attribute name="price">99999.00</jsp:attribute>
                                    </t:product>
                                </div>
                            </div>
                        </div>
                        <div class="page tab-pane" id="products-page-3" role="tabpanel">
                            <div class="row">
                                <div class="col-md-4">
                                    <t:product>
                                        <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                                        <jsp:attribute name="title">包包标题3</jsp:attribute>
                                        <jsp:attribute name="price">99999.00</jsp:attribute>
                                    </t:product>
                                </div>
                            </div>
                        </div>
                        <div class="page tab-pane" id="products-page-4" role="tabpanel">
                            <div class="row">
                                <div class="col-md-4">
                                    <t:product>
                                        <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                                        <jsp:attribute name="title">包包标题4</jsp:attribute>
                                        <jsp:attribute name="price">99999.00</jsp:attribute>
                                    </t:product>
                                </div>
                            </div>
                        </div>
                        <div class="page tab-pane" id="products-page-5" role="tabpanel">
                            <div class="row">
                                <div class="col-md-4">
                                    <t:product>
                                        <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                                        <jsp:attribute name="title">包包标题5</jsp:attribute>
                                        <jsp:attribute name="price">99999.00</jsp:attribute>
                                    </t:product>
                                </div>
                            </div>
                        </div>
                    </div>

                    <ul class="nav nav-tabs tabs-5 pagination" role="tablist">
                        <li class="nav-item page-item">
                            <a class="nav-link active page-link" data-toggle="tab" href="#products-page-1"
                               role="tab">1</a>
                        </li>
                        <li class="nav-item page-item">
                            <a class="nav-link page-link" data-toggle="tab" href="#products-page-2" role="tab">2</a>
                        </li>
                        <li class="nav-item page-item">
                            <a class="nav-link  page-link" data-toggle="tab" href="#products-page-3" role="tab">3</a>
                        </li>
                        <li class="nav-item page-item">
                            <a class="nav-link page-link" data-toggle="tab" href="#products-page-4" role="tab">4</a>
                        </li>
                        <li class="nav-item page-item">
                            <a class="nav-link page-link" data-toggle="tab" href="#products-page-5" role="tab">5</a>
                        </li>
                        <li class="nav-item page-item">
                            <a class="nav-link page-link" data-toggle="tab" href="#products-page-5" role="tab">..</a>
                        </li>
                    </ul>
                </div>
                <!--/.Main column-->
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>