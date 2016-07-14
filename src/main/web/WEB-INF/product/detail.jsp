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
                                    document.getElementById("favor-icon").className = classname;
                                    if (classname == "fa fa-star fa-lg amber-text") {
                                        notify("收藏成功！");
                                    }
                                    else {
                                        notify("成功取消收藏！");
                                    }
                                }
                                else if (data.result == "login") {
                                    bootbox.confirm({
                                        title: '登录',
                                        message: '登录之后才可以使用收藏夹，现在去登录？',
                                        callback: function (result) {
                                            if (result) {
                                                window.location.href = '/login.jsp?src=/product/viewProduct?pricedId=<s:property value="pricedId"/>';
                                            }
                                        }
                                    })
                                } else {
                                    warning("收藏失败");
                                }
                            }
                        })
            }
            function addCart() {
                var productId = $("#productId").find('option:selected').val();
                $.ajax(
                        {
                            url: "/cart/addCart",
                            dataType: "json",   //返回格式为json
                            type: 'post',
                            data: {productId: productId},
                            success: function (data) {
                                if (data.result == "success") {
                                    notify("加入购物车成功！");
                                }

                                if (data.result == "login") {
                                    bootbox.confirm({
                                        title: '登录',
                                        message: '登录之后才可以使用购物车，现在去登录？',
                                        callback: function (result) {
                                            if (result) {
                                                window.location.href = '/login.jsp?src=/product/viewProduct?pricedId=<s:property value="pricedId"/>';
                                            }
                                        }
                                    })
                                }
                            }
                        })
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <div class="card">
                <!--First row-->
                <div class="row product-card-wrapper">

                    <div class="col-md-5">
                        <div class="view overlay hm-white-slight center">
                            <img src="<s:property value="priced.img"/>" class="img-fluid center" alt=""
                                 style="max-width: 18rem">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <div class="row">
                            <div class="center" style="width: 5rem;">
                                <a onclick="changeFavorState()">
                                    <s:set name="isFavor" value="isFavor"/>
                                    <s:if test="#isFavor==1">
                                        <i class="fa fa-star fa-lg amber-text" aria-hidden="true" id="favor-icon"></i>已收藏
                                    </s:if>
                                    <s:else>
                                        <i class="fa fa-star-o fa-lg amber-text" aria-hidden="true" id="favor-icon"></i>收藏
                                    </s:else>
                                </a>
                            </div>
                        </div>
                    </div>


                    <div class="col-md-7">
                        <div class="product-wrapper">
                            <!--Product data-->
                            <h2 class="h2-responsive"><s:property value="priced.title"/></h2>
                            <hr>
                            <h3 class="price"><i class="fa fa-rmb" aria-hidden="true"></i><s:property
                                    value="priced.unitPrice"/></h3>
                            <p><s:property value="priced.description"/></p>

                            <form action="/order/instanceBuy.action">
                                <div class="row reviews">
                                    <s:if test="products.size()==0">
                                    <p>暂无商品！
                                        </s:if>
                                        <s:else>
                                        <label class="col-sm-3 control-label">颜色</label>
                                    <div class="col-sm-4">

                                        <s:select list="products" listValue="color" listkey="productId"
                                                  name="productId" cssClass="form-control m-b"/>

                                    </div>
                                    </s:else>
                                </div>

                                <s:if test="products.size()>0">
                                    <div class="row">
                                        <div class="col-sm-5">
                                            <a onclick="addCart( )" class="btn btn-lg blue-grey"><i
                                                    class="fa fa-shopping-cart"></i>
                                                加入购物车</a></div>
                                        <div class="col-sm-4">
                                            <s:submit id="btn-instance-buy" align="none"
                                                      cssClass="btn btn-lg blue-grey btn-input fa fa-check"
                                                      value="立即购买"/>
                                        </div>
                                    </div>
                                </s:if>
                                <s:else>
                                    <h5>正在补货中...</h5>
                                </s:else>
                            </form>

                        </div>
                    </div>
                </div>
                <!--/.First row-->
            </div>


            <!--Second row-->
            <div class="row">
                <!--Heading-->
                <s:if test="comments.size>0">
                    <div class="reviews">
                        <h2 class="h2-responsive">评论</h2>
                    </div>
                    <s:iterator value="comments">
                        <t:comment>
                            <jsp:attribute name="img">
                                <s:property value="user.img"/>
                            </jsp:attribute>

                            <jsp:attribute name="star">
                                <s:property value="star"/>
                            </jsp:attribute>

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
                    <div class="reviews">
                        <h2 class="h2-responsive">暂无评论</h2>
                    </div>
                </s:else>

            </div>

            <!--/.Second row-->
        </div>
        <!--/.Main layout-->

    </jsp:body>

</t:base>