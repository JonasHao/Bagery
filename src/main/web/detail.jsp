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
                            data: {priceId: 1},
                            success: function (data) {
                                if (data.result == "success") {
//                                    var tmp = document.getElementById("favor-icon");
//                                    console.log(tmp);
                                    document.getElementById("favor-icon").className = classname;
                                    if (classname == "fa fa-star fa-lg amber-text") {
                                        alert("收藏成功！");
                                    }
                                    else {
                                        alert("取消收藏！");
                                    }
                                } else {
                                    alert("收藏失败！");
                                }
                            }
                        })
            }
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">
            <s:url id="favor" var="favorUrl" action="favor" namespace="/favorite">
                <s:param name="priceId">
                    <%--<s:property value="priceId" />--%>1
                </s:param>
            </s:url>

            <div class="card">
                <!--First row-->
                <div class="row  product-card-wrapper">

                    <div class="col-md-5">
                        <div class="view overlay hm-white-slight product-detail-img">
                            <img src="../img/bags/bag1.png" class="img-fluid" alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <a onclick="changeFavorState()">
                            <s:if test="true">
                                <i class="fa fa-star-o fa-lg amber-text" aria-hidden="true" id="favor-icon"></i>
                            </s:if>
                            <s:else>
                                <i class="fa fa-star fa-lg amber-text" aria-hidden="true" id="favor-icon"></i>
                            </s:else>
                        </a>

                    </div>


                    <div class="col-md-7">
                        <div class="product-wrapper">
                            <!--Product data-->
                            <h2 class="h2-responsive">Product title</h2>
                            <hr>
                            <h3 class="price"><i class="fa fa-rmb" aria-hidden="true"></i> 9999.00</h3>
                            <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius totam, officiis
                                doloremque
                                velit nobis dolor nulla unde architecto alias praesentium, soluta error omnis sint,
                                impedit, delectus ipsam eveniet debitis nemo.</p>

                            <ul class="rating inline-ul">
                                <li><i class="fa fa-star amber-text"></i></li>
                                <li><i class="fa fa-star amber-text"></i></li>
                                <li><i class="fa fa-star amber-text"></i></li>
                                <li><i class="fa fa-star amber-text"></i></li>
                                <li><i class="fa fa-star"></i></li>
                            </ul>

                            <a href="#" class="btn btn-lg blue-grey"><i class="fa fa-shopping-cart"></i> 加入购物车</a>
                            <a href="#" class="btn btn-lg blue-grey"><i class="fa fa-check"></i> 立即购买</a>

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

                <t:comment>
                    <jsp:attribute name="img">
                        http://mdbootstrap.com/wp-content/uploads/2015/10/team-avatar-1.jpg
                    </jsp:attribute>

                    <jsp:attribute name="star">4</jsp:attribute>

                    <jsp:attribute name="text">
                        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius totam, officiis doloremque
                        velit nobis dolor nulla unde architecto alias praesentium, soluta error omnis sint,
                        impedit, delectus ipsam eveniet debitis nemo.
                    </jsp:attribute>
                </t:comment>
            </div>
            <!--/.Second row-->


        </div>
        <!--/.Main layout-->

    </jsp:body>

</t:base>