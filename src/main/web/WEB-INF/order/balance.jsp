<%--
  Created by IntelliJ IDEA.
  User: jinzil
  Date: 2016/6/23
  Time: 20:23
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>

    <jsp:attribute name="title">结算</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li><a href="/cart/queryCart.action">购物车</a></li>
           <li class="active">结算</li>
       </ol>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script type="text/javascript">
            function addAddress() {
                var navigateAddress = "${addAdd}&returnAddress=" + location.pathname + location.search;
                console.log(navigateAddress);
                window.navigate(navigateAddress);
            }

            function setDefault(addressId) {
                var btn = $("#btn-default-addressId");
                console.log("id:" + addressId);
                $.ajax(
                        {
                            url: "/address/setDefaultAddress.action",
                            dataType: "json",   //返回格式为json
                            type: 'post',
                            data: {defaultAddressId: addressId},
                            success: function (data) {
                                console.log(data);
                                if (data.result == "success") {
                                    location.reload();
                                }
                            }
                        });
            }
        </script>
    </jsp:attribute>
    <jsp:body>

        <!-- Modal -->
        <div class="modal fade" id="changeAddress" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
             aria-hidden="true">
            <div class="modal-dialog" role="document" style="width: 400px;">
                <!--Content-->
                <div class="modal-content card">
                    <!--Header-->
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                            <span aria-hidden="true">&times;</span>
                        </button>
                        <h5 class="modal-title" id="myModalLabel" data-toggle="modal" data-target="#myModal">选择收货人</h5>
                    </div>

                    <form class="form-address" id="selectAddress" action="/address/setDefaultAddress.action"
                          method="get">

                        <!--Body-->
                        <div class="modal-body">
                            <s:radio list="addressList" name="defaultAddressId" listKey="addressId"
                                     listvaluekey="addressId" cssClass="address-item"/>
                        </div>
                        <!--Footer-->
                        <div class="modal-footer" style="border-top: 0px">
                            <a onclick="setDefault($('input[name=defaultAddressId]:checked', '#selectAddress').val())"
                               type="button" class="btn blue btn-primary">确认</a>
                            <s:div type="button" class="btn grey" data-dismiss="modal">取消</s:div>
                        </div>
                    </form>
                </div>
                <!--/.Content-->
            </div>
        </div>
        <!-- /.Live preview-->


        <!--Main layout-->
        <div class="container">

            <div class="row">
                <div class="col-md-9">
                    <h4>收件人</h4>
                    <br>
                    <s:if test="defaultAddress != null">
                        <div class="card">
                            <div class="row card-block">
                                <div class="col-md-10 address-info">
                                    <div class="row">
                                        <div class="col-md-10 address-line">
                                            <s:property value="defaultAddress.receiver"/>
                                        </div>
                                        <div class="col-md-10 address-line">
                                            <s:property value="defaultAddress.addressProvince"/>省
                                            <s:property value="defaultAddress.addressCity"/>市
                                            <s:property value="defaultAddress.addressDistrict"/>区
                                        </div>
                                        <div class="col-md-10 address-line">
                                            <s:property value="defaultAddress.addressDetail"/>
                                        </div>
                                        <div class="col-md-10 address-line">
                                            电话：<s:property value="defaultAddress.mobile"/>
                                        </div>
                                    </div>
                                </div>
                                <div class="col-md-2 col-sm-2">
                                    <a data-target="#changeAddress" data-toggle="modal">更改</a>
                                </div>


                            </div>
                        </div>
                    </s:if>
                    <s:else>
                        <s:url var="addAdd" action="viewAddress" namespace="/address">
                            <s:param name="add">1</s:param>
                        </s:url>
                        <span><strong>地址簿为空</strong></span> （<a onclick="addAddress()">添加</a>）
                    </s:else>


                    <br/>
                    <br/>
                    <h4>商品列表</h4>
                    <br>

                    <div class="card">
                        <div class="card-block">
                            <s:iterator value="cartItemList">
                                <div class="row">
                                    <div class="col-md-2">
                                        <!--Card image-->
                                        <div class="view overlay hm-white-slight">
                                            <img src="<s:property value="product.priced.img"/>" class="img-fluid"
                                                 alt="">
                                            <a href="#">
                                                <div class="mask"></div>
                                            </a>
                                        </div>
                                        <!--/.Card image-->
                                    </div>
                                    <div class="col-md-10 order-item-block">
                                        <div class="row">
                                            <div class="col-md-8">
                                                <div>
                                                    <!--Title-->
                                                    <h5 class="card-title product-order-title">
                                                        <p><s:property value="product.priced.title"/></p>
                                                    </h5>

                                                    <div><i class="fa fa-rmb" aria-hidden="true"></i><s:property
                                                            value="subtotal"/></div>
                                                    <div>数量：<s:property value="num"/></div>
                                                    <p class="bag-color">颜色分类:<s:property value="product.color"/></p>
                                                </div>
                                            </div>

                                        </div>
                                    </div>
                                </div>
                            </s:iterator>
                        </div>
                    </div>

                </div>

                <form action="/order/addOrder.action">
                    <s:iterator value="cartItemList" status="row">
                        <s:hidden name="cartItemIdList[%{#row.index}]" value="%{itemId}"/>
                    </s:iterator>
                    <div class="col-md-3 order-submit-block">
                        <div class="card">
                            <div class="card-block">
                                <h4><s:submit cssClass="btn btn-primary btn-lg grey btn-submit-order btn-input"
                                              value="提交订单"/></h4>
                                <br>

                                <div class="font-weight-bold">订单汇总</div>
                                运费：包邮<br/>
                                商品小计： <i class="fa fa-rmb" aria-hidden="true"></i><s:property value="totalPrice"/>
                                <br/> <br/>

                                <div class="font-weight-bold">总价:
                                    <i class="fa fa-rmb" aria-hidden="true"></i><s:property value="totalPrice"/>
                                </div>
                            </div>
                        </div>

                        <div class="widget-wrapper">
                            <h4>附言</h4>
                            <br>

                            <div class="card">
                                <div class="card-block">
                                    <div class="md-form">
                                        <i class="fa fa-comments prefix"></i>
                                        <s:textfield id="form1" name="instruction" class="form-control"/>
                                        <label for="form1">备注</label>
                                    </div>
                                </div>
                            </div>
                        </div>

                    </div>
                </form>
            </div>


        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>
