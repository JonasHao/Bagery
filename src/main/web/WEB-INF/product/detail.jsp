<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>

    <jsp:attribute name="title">商品详情</jsp:attribute>
    <jsp:attribute name="scripts">
        <script type="text/javascript">
            function changeFavorState() {
                var url;
                var classname;
                if (document.getElementById("favor-icon").className == "fa fa-star fa-lg amber-text") {
                    url = "/favorite/unfavor";
                    classname = "fa fa-star-o fa-lg amber-text";
                } else {
                    url = "/favorite/favor";
                    classname = "fa fa-star fa-lg amber-text";
                }
                $.ajax(
                        {
                            url: url,
                            dataType: "json",   //返回格式为json
                            type: 'post',
                            data: {priceId: <s:property value="pricedId"/>},
                            success: function (data) {
                                if (data.result == "success") {
//                                    var tmp = document.getElementById("favor-icon");
//                                    console.log(tmp);
                                    document.getElementById("favor-icon").className = classname;
                                    if (classname == "fa fa-star fa-lg amber-text") {
//                                        $(".alert #alert-block").text("收藏成功！");
//                                        $(".alert").alert()
                                         notify("收藏成功！");
                                    }
                                    else {
                                        notify("取消收藏！");
                                    }
                                } else {
                                     notify("收藏失败！");
                                }
                            }
                        })
            }
            function addCart() {
                $.ajax(
                        {
                            url: "/cart/addCart",
                            dataType: "json",   //返回格式为json
                            type: 'post',
                            data: {productId: <s:property value="product_id"/>},
                            success: function (data) {
//                                console.log(data);
                                if (data.result == "success") {
                                    notify("加入购物车成功！");
                                }
                            }
                        })
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
                <%--<s:url id="favor" var="favorUrl" action="favor" namespace="/favorite">--%>
                <%--<s:param name="priceId">--%>
                <%--&lt;%&ndash;<s:property value="priceId" />&ndash;%&gt;1--%>
                <%--</s:param>--%>
                <%--</s:url>--%>

            <%--<div class="alert alert-warning">--%>
                <%--<a href="#" class="close" data-dismiss="alert">--%>
                    <%--&times;--%>
                <%--</a>--%>
                <%--<div id="alert-block">--%>
                    <%--<strong>警告！</strong>您的网络连接有问题。--%>
                <%--</div>--%>
            <%--</div>--%>

            <div class="card">
                <!--First row-->
                <div class="row product-card-wrapper">

                    <div class="col-md-5">
                        <div class="view overlay hm-white-slight product-detail-img">
                            <img src="<s:property value="priced.img"/>" class="img-fluid" alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <a onclick="changeFavorState()">
                            <s:set name="isFavor" value="isFavor"/>
                            <s:if test="#isFavor==1">
                                <i class="fa fa-star fa-lg amber-text" aria-hidden="true" id="favor-icon"></i>
                            </s:if>
                            <s:else>
                                <i class="fa fa-star-o fa-lg amber-text" aria-hidden="true" id="favor-icon"></i>
                            </s:else>
                        </a>

                    </div>


                    <div class="col-md-7">
                        <div class="product-wrapper">
                            <!--Product data-->
                            <h2 class="h2-responsive"><s:property value="priced.title"/></h2>
                            <hr>
                            <h3 class="price"><i class="fa fa-rmb" aria-hidden="true"></i><s:property
                                    value="priced.unitPrice"/></h3>
                            <p><s:property value="priced.description"/></p>


                            <div class="row reviews">
                                <s:if test="products.size()==0">
                                <p>暂无商品！
                                    </s:if>
                                    <s:else>
                                    <label class="col-sm-2 control-label">颜色</label>
                                <div class="col-sm-4">
                                    <s:select list="products" listValue="color"
                                              name="color" cssClass="form-control m-b"/>
                                </div>
                                </s:else>
                            </div>

                            <s:if test="products.size()!=0">
                                <a onclick="addCart()" class="btn btn-lg blue-grey"><i class="fa fa-shopping-cart"></i>
                                    加入购物车</a>
                                <a href="#" class="btn btn-lg blue-grey"><i class="fa fa-check"></i> 立即购买</a>
                            </s:if>
                        </div>
                    </div>
                </div>
                <!--/.First row-->
            </div>


            <!--Second row-->
            <div class="row">
                <!--Heading-->
                <div class="reviews">
                    <h2 class="h2-responsive">评论</h2>
                </div>

                <s:if test="comments.size>0">
                    <s:iterator value="comments">
                        <t:comment>
                            <jsp:attribute name="img">
                                <s:property value="user.img"/>
                            </jsp:attribute>

                            <jsp:attribute name="star"><s:property value="star"/></jsp:attribute>

                            <jsp:attribute name="text">
                                <s:property value="content1"/>
                            </jsp:attribute>

                             <jsp:attribute name="append">
                                <s:property value="content2"/>
                             </jsp:attribute>

                             <jsp:attribute name="reply">
                                <s:property value="adminContent"/>
                             </jsp:attribute>

                        </t:comment>
                    </s:iterator>
                </s:if>
                <s:else>
                <p>暂无评论
                    </s:else>

            </div>

            <!--/.Second row-->
        </div>
        <!--/.Main layout-->

    </jsp:body>

</t:base>