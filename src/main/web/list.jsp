<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:base>

    <jsp:attribute name="title">商品列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb" >
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
                        <h4>分类:</h4>
                        <br>
                        <div class="list-group">
                            <a href="#" class="list-group-item active">Woman</a>
                            <a href="#" class="list-group-item">Man</a>
                            <a href="#" class="list-group-item">Shoes</a>
                            <a href="#" class="list-group-item">T-shirt</a>
                            <a href="#" class="list-group-item">Jewellery</a>
                        </div>
                    </div>


                </div>
                <!--/.Sidebar-->

                <!--Main column-->
                <div class="col-md-9">

                    <!--First row-->
                    <div class="row">
                        <div class="col-md-4">
                            <t:product>
                                <jsp:attribute name="img">img/bags/bag1.png</jsp:attribute>
                                <jsp:attribute name="title">包包标题</jsp:attribute>
                                <jsp:attribute name="price">99999.00</jsp:attribute>
                            </t:product>
                        </div>
                    </div>
                    <!--/.First row-->

                </div>
                <!--/.Main column-->

            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>