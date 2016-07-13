<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>


<t:base>
    <jsp:attribute name="scripts">
        <script type="text/javascript">
            function getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = location.search.substr(1).match(reg);
                if (r != null) return unescape(decodeURI(r[2])); return null;
            }
            var m=getQueryString("message");
            if(m!=null){
                if(m=="网络异常！"){
                    warning(m);
                }
                else {
                    notify(m);
                }
            }
        </script>
    </jsp:attribute>

    <jsp:attribute name="title">首页 </jsp:attribute>
    <jsp:body>

        <!--Main layout-->
        <div class="container">
            <!--First row-->
            <div class="row">
                <div class="col-md-12">
                    <!--Carousel Wrapper-->
                    <div id="carousel-example-2" class="carousel slide carousel-fade z-depth-1-half"
                         data-ride="carousel">
                        <!--Indicators-->
                        <ol class="carousel-indicators">
                            <li data-target="#carousel-example-2" data-slide-to="0" class="active"></li>
                            <li data-target="#carousel-example-2" data-slide-to="1"></li>
                            <li data-target="#carousel-example-2" data-slide-to="2"></li>
                        </ol>
                        <!--/.Indicators-->

                        <!--Slides-->
                        <div class="carousel-inner" role="listbox">
                            <div class="carousel-item active">
                                <img src="/img/ads/banner1.jpg"
                                     alt="First slide" width="1200" height="400">
                                <div class="carousel-caption">

                                    <br>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="/img/ads/banner2.jpg"  width="1200" height="400"
                                     alt="Second slide">
                                <div class="carousel-caption">
                                    <br>
                                </div>
                            </div>

                        </div>
                        <!--/.Slides-->

                        <!--Controls-->
                        <a class="left carousel-control" href="#carousel-example-2" role="button" data-slide="prev">
                            <span class="icon-prev" aria-hidden="true"></span>
                            <span class="sr-only">Previous</span>
                        </a>
                        <a class="right carousel-control" href="#carousel-example-2" role="button" data-slide="next">
                            <span class="icon-next" aria-hidden="true"></span>
                            <span class="sr-only">Next</span>
                        </a>
                        <!--/.Controls-->
                    </div>
                    <!--/.Carousel Wrapper-->
                </div>
            </div>
            <!--/.First row-->
            <br>
            <hr class="extra-margins">

            <div class="reviews">
                当季热销
            </div>
            <div class="row">

                <div class="col-md-4 col-lg-3">







                    <div class="card" style="margin-bottom: .5rem">
                        <!--Card image-->



                        <div class="view overlay hm-white-slight">
                            <img src="http://cdn-images.farfetch.com/11/27/79/76/11277976_6530203_1000.jpg" width="200" height="200" class="img-fluid img-product" alt="格纹单肩包">
                            <%--<a href="/product/viewProduct.action?pricedId=6">--%>
                            <a href="/">
                                <div class="mask waves-effect waves-light"></div>
                            </a>
                        </div>
                        <!--/.Card image-->


                        <div class="view overlay hm-black-strong">
                            <div class="price">
                                <!--Title-->
                                <h6 class="card-title product-title">
                                    格纹单肩包
                                </h6>
                                <!--Text-->
                                <div class="product-title">
                                    <i class="fa fa-rmb" aria-hidden="true"></i>
                                    1100.0
                                </div>

                            </div>
                            <div class="mask flex-center waves-effect waves-light">
                                <a href="/product/viewProduct.action?pricedId=6"><i class="fa fa-shopping-cart fa-2x"></i></a>
                            </div>
                        </div>

                        <!--/.Card content-->

                    </div>

                </div>

                <div class="col-md-4 col-lg-3">







                    <div class="card" style="margin-bottom: .5rem">
                        <!--Card image-->



                        <div class="view overlay hm-white-slight">
                            <img src="http://cdn-images.farfetch.com/11/40/64/79/11406479_7120753_480.jpg" width="200" height="200" class="img-fluid img-product" alt="格纹背包">
                            <a href="/product/viewProduct.action?pricedId=7">
                                <div class="mask waves-effect waves-light"></div>
                            </a>
                        </div>
                        <!--/.Card image-->


                        <div class="view overlay hm-black-strong">
                            <div class="price">
                                <!--Title-->
                                <h6 class="card-title product-title">
                                    格纹背包
                                </h6>
                                <!--Text-->
                                <div class="product-title">
                                    <i class="fa fa-rmb" aria-hidden="true"></i>
                                    920.0
                                </div>

                            </div>
                            <div class="mask flex-center waves-effect waves-light">
                                <a href="/product/viewProduct.action?pricedId=7"><i class="fa fa-shopping-cart fa-2x"></i></a>
                            </div>
                        </div>

                        <!--/.Card content-->

                    </div>

                </div>

                <div class="col-md-4 col-lg-3">







                    <div class="card" style="margin-bottom: .5rem">
                        <!--Card image-->



                        <div class="view overlay hm-white-slight">
                            <img src="http://cdn-images.farfetch.com/11/24/97/30/11249730_6056108_480.jpg" width="200" height="200" class="img-fluid img-product" alt="'House check'斜挎包">
                            <a href="/product/viewProduct.action?pricedId=8">
                                <div class="mask waves-effect waves-light"></div>
                            </a>
                        </div>
                        <!--/.Card image-->


                        <div class="view overlay hm-black-strong">
                            <div class="price">
                                <!--Title-->
                                <h6 class="card-title product-title">
                                    'House check'斜挎包
                                </h6>
                                <!--Text-->
                                <div class="product-title">
                                    <i class="fa fa-rmb" aria-hidden="true"></i>
                                    615.0
                                </div>

                            </div>
                            <div class="mask flex-center waves-effect waves-light">
                                <a href="/product/viewProduct.action?pricedId=8"><i class="fa fa-shopping-cart fa-2x"></i></a>
                            </div>
                        </div>

                        <!--/.Card content-->

                    </div>

                </div>

                <div class="col-md-4 col-lg-3">
                    <div class="card" style="margin-bottom: .5rem">
                        <!--Card image-->

                        <div class="view overlay hm-white-slight">
                            <img src="http://cdn-images.farfetch.com/11/50/10/07/11501007_7138932_480.jpg" width="200" height="200" class="img-fluid img-product" alt="'Bow Cut'迷你斜挎包">
                            <a href="/product/viewProduct.action?pricedId=9">
                                <div class="mask waves-effect waves-light"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <div class="view overlay hm-black-strong">
                            <div class="price">
                                <!--Title-->
                                <h6 class="card-title product-title">
                                    'Bow Cut'迷你斜挎包
                                </h6>
                                <!--Text-->
                                <div class="product-title">
                                    <i class="fa fa-rmb" aria-hidden="true"></i>
                                    2554.0
                                </div>

                            </div>
                            <div class="mask flex-center waves-effect waves-light">
                                <a href="/product/viewProduct.action?pricedId=9"><i class="fa fa-shopping-cart fa-2x"></i></a>
                            </div>
                        </div>
                        <!--/.Card content-->
                    </div>
                </div>


            </div>

        </div>
        <!--/.Main column-->


        <!--/.Main layout-->

    </jsp:body>
</t:base>