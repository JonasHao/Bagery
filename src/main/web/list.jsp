<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>

<t:list>

    <jsp:attribute name="title">商品列表</jsp:attribute>
    <jsp:attribute name="head">

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

                    <div class="widget-wrapper">
                        <h4>Subscription form:</h4>
                        <br>
                        <div class="card">
                            <div class="card-block">
                                <p><strong>Subscribe to our newsletter</strong></p>
                                <p>Once a week we will send you a summary of the most useful news</p>
                                <div class="md-form">
                                    <i class="fa fa-user prefix"></i>
                                    <input type="text" id="form1" class="form-control">
                                    <label for="form1">Your name</label>
                                </div>
                                <div class="md-form">
                                    <i class="fa fa-envelope prefix"></i>
                                    <input type="text" id="form2" class="form-control">
                                    <label for="form2">Your email</label>
                                </div>
                                <button class="btn btn-primary">Submit</button>

                            </div>
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
</t:list>