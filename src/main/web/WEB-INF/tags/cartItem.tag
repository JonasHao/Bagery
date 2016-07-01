<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="color" fragment="true" %>
<%@attribute name="salePrice" fragment="true" %>
<%@attribute name="unitPrice" fragment="true" %>
<%@attribute name="number" fragment="true" %>
<%@attribute name="totalPrice" fragment="true" %>
<%@attribute name="itemId" fragment="true" %>
<div class="card">
    <div class="row">
        <div class="col-md-2">
            <!--Card image-->
            <div class="view overlay hm-white-slight">
                <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="">
                <a href="#">
                    <div class="mask"></div>
                </a>
            </div>
            <!--/.Card image-->
        </div>
        <div class="col-md-10 cart-item-block">
            <div class="row">
                <div class="col-md-3">
                    <div>
                        <!--Title-->
                        <h5 class="card-title product-title">
                            <jsp:invoke fragment="title"/>
                        </h5>
                        <br/><br/>
                        <!--Text-->
                        <%--<i class="fa fa-circle color-icon" aria-hidden="true"></i>--%>
                        <p class="bag-color">颜色分类：
                            <jsp:invoke fragment="color"/>
                        </p>
                    </div>
                </div>

                <div class="col-md-3">
                    <div class="unit-price"><i class="fa fa-rmb" aria-hidden="true"></i>
                        <jsp:invoke fragment="unitPrice"/>
                    </div>
                    <i class="fa fa-rmb" aria-hidden="true"></i>
                    <jsp:invoke fragment="salePrice"/>
                </div>

                <div class="col-md-2">
                    <jsp:invoke fragment="number"/>
                </div>

                <div class="col-md-2">
                    <i class="fa fa-rmb" aria-hidden="true"></i>
                    <jsp:invoke fragment="totalPrice"/>
                </div>
                <s:url var="deleteCartUrl" action="deleteCart">
                    <s:param name="itemId">
                        <jsp:invoke fragment="itemId"/>
                    </s:param>
                </s:url>
                <div class="col-md-2">
                    <a data-toggle="modal" data-target="#myModal">
                        <i class="fa fa-trash" aria-hidden="true"></i>删除
                    </a>
                    <%--onclick="deleteCart()"--%>
                    <!-- Button trigger modal -->
                    <%--<button type="button" class="btn btn-primary btn-lg" >--%>
                    <%--Launch demo modal--%>
                    <%--</button>--%>

                    <!-- Modal -->
                    <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
                         aria-hidden="true">
                        <div class="modal-dialog" role="document" style="width: 400px;">
                            <!--Content-->
                            <div class="modal-content">
                                <!--Header-->
                                <div class="modal-header">
                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                        <span aria-hidden="true">&times;</span>
                                    </button>
                                    <h5 class="modal-title" id="myModalLabel">删除包包</h5>
                                </div>
                                <!--Body-->
                                <div class="modal-body">
                                    <p>确认要删除该宝贝吗？</p>
                                </div>
                                <!--Footer-->
                                <div class="modal-footer" style="border-top: 0px">
                                    <button type="button" onclick="deleteCart()" class="btn blue btn-primary">确认</button>
                                    <button type="button" class="btn grey" data-dismiss="modal">取消</button>
                                </div>
                            </div>
                            <!--/.Content-->
                        </div>
                    </div>
                    <!-- /.Live preview-->
                </div>
            </div>
        </div>
    </div>
    <script>
        var todelete;
        function deleteCart() {
            todelete = event.target.parentNode.parentNode.parentNode.parentNode;
            console.log(todelete);
            $.ajax(
                    {
                        url: "/cart/deleteCart",
                        dataType: "json",   //返回格式为json
                        type: 'post',
                        data: {itemId:<jsp:invoke fragment="itemId"/>},
                        success: function (data) {
                            if (data.result == "success") {
                                todelete.remove();
                                alert("删除成功！");
                            } else {
                                alert("删除失败！");
                            }
                        }
                    })
        }
        function changeNumber() {

        }
    </script>
</div>
