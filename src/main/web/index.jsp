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
                                    <h4>包</h4>
                                    <br>
                                </div>
                            </div>
                            <div class="carousel-item">
                                <img src="/img/ads/banner2.jpg"  width="1200" height="400"
                                     alt="Second slide">
                                <div class="carousel-caption">
                                    <h4>打折了！</h4>
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

            <!--Second row-->
            <div class="row">
                <!--First columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/ecommerce/reg/reg%20(19).jpg" class="img-fluid"
                                 alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Product title</h4>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                            <a href="#" class="btn btn-primary">Buy now for 10$</a>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--First columnn-->

                <!--Second columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/ecommerce/reg/reg%20(15).jpg" class="img-fluid"
                                 alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Product title</h4>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                            <a href="#" class="btn btn-primary">Buy now for 20$</a>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Second columnn-->

                <!--Third columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/ecommerce/reg/reg%20(24).jpg" class="img-fluid"
                                 alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Product title</h4>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                            <a href="#" class="btn btn-primary">Buy now for 30$</a>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--Third columnn-->

                <!--First columnn-->
                <div class="col-md-3">
                    <!--Card-->
                    <div class="card">

                        <!--Card image-->
                        <div class="view overlay hm-white-slight">
                            <img src="http://mdbootstrap.com/images/ecommerce/reg/reg%20(19).jpg" class="img-fluid"
                                 alt="">
                            <a href="#">
                                <div class="mask"></div>
                            </a>
                        </div>
                        <!--/.Card image-->

                        <!--Card content-->
                        <div class="card-block">
                            <!--Title-->
                            <h4 class="card-title">Product title</h4>
                            <!--Text-->
                            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. </p>
                            <a href="#" class="btn btn-primary">Buy now for 10$</a>
                        </div>
                        <!--/.Card content-->

                    </div>
                    <!--/.Card-->
                </div>
                <!--First columnn-->
            </div>
            <!--/.Second row-->

        </div>
        <!--/.Main column-->


        <!--/.Main layout-->

    </jsp:body>
</t:base>