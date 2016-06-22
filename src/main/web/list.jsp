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
                        <div class="col-md-12">
                            <!--Product-->
                            <div class="product-wrapper">

                                <!--Featured image-->
                                <div class="view overlay hm-white-light z-depth-1-half">
                                    <img src="http://mdbootstrap.com/images/ecommerce/slides/slide%20(3).jpg"
                                         class="img-fluid " alt="">
                                    <div class="mask">
                                    </div>
                                    <h3 class="price"><span class="label rgba-green-strong">10 $</span></h3>
                                </div>
                                <!--/.Featured image-->

                                <br>

                                <!--Product data-->
                                <h2 class="h2-responsive">Product title</h2>
                                <hr>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Eius totam, officiis
                                    doloremque
                                    velit nobis dolor nulla unde architecto alias praesentium, soluta error omnis sint,
                                    impedit, delectus ipsam eveniet debitis nemo.</p>
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

                            </div>
                            <!--Product-->

                        </div>
                    </div>
                    <!--/.First row-->

                    <!--Second row-->
                    <div class="row">

                        <!--Heading-->
                        <div class="reviews">
                            <h2 class="h2-responsive">Reviews</h2>
                        </div>

                        <!--First review-->
                        <div class="media">
                            <a class="media-left" href="#">
                                <img class="img-circle"
                                     src="http://mdbootstrap.com/wp-content/uploads/2015/10/team-avatar-1.jpg"
                                     alt="Generic placeholder image">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">John Doe</h4>
                                <ul class="rating inline-ul">
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi cupiditate temporibus
                                    iure
                                    soluta. Quasi mollitia maxime nemo quam accusamus possimus, voluptatum expedita
                                    assumenda. Earum sit id ullam eum vel delectus!</p>
                            </div>
                        </div>

                        <!--Second review-->
                        <div class="media">
                            <a class="media-left" href="#">
                                <img class="img-circle"
                                     src="http://mdbootstrap.com/wp-content/uploads/2015/10/team-avatar-2.jpg"
                                     alt="Generic placeholder image">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Nathan Casie</h4>
                                <ul class="rating inline-ul">
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi cupiditate temporibus
                                    iure
                                    soluta. Quasi mollitia maxime nemo quam accusamus possimus, voluptatum expedita
                                    assumenda. Earum sit id ullam eum vel delectus!</p>
                            </div>
                        </div>

                        <!--Second review-->
                        <div class="media">
                            <a class="media-left" href="#">
                                <img class="img-circle"
                                     src="http://mdbootstrap.com/wp-content/uploads/2015/10/team-avatar-3.jpg"
                                     alt="Generic placeholder image">
                            </a>
                            <div class="media-body">
                                <h4 class="media-heading">Dave Snow</h4>
                                <ul class="rating inline-ul">
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star amber-text"></i></li>
                                    <li><i class="fa fa-star"></i></li>
                                </ul>
                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Nisi cupiditate temporibus
                                    iure
                                    soluta. Quasi mollitia maxime nemo quam accusamus possimus, voluptatum expedita
                                    assumenda. Earum sit id ullam eum vel delectus!</p>
                            </div>
                        </div>

                    </div>
                    <!--/.Second row-->

                </div>
                <!--/.Main column-->

            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:list>