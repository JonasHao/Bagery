<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="receiver" fragment="true" %>
<%@attribute name="province" fragment="true" %>
<%@attribute name="city" fragment="true" %>
<%@attribute name="district" fragment="true" %>
<%@attribute name="detail" fragment="true" %>
<%@attribute name="phone" fragment="true" %>
<%@attribute name="addressId" fragment="true" %>
<%@attribute name="status" type="java.lang.Integer" %>
<%@attribute name="defaultAddressId" type="java.lang.Integer" %>
<div class="card">
    <div class="row card-block">
        <div class="col-md-10 address-info">
            <div class="row">
                <div class="col-md-10 address-line">
                    <jsp:invoke fragment="receiver"/>
                </div>
                <div class="col-md-10 address-line">
                    <jsp:invoke fragment="province"/>
                    省
                    <jsp:invoke fragment="city"/>
                    市
                    <jsp:invoke fragment="district"/>
                    区
                    <jsp:invoke fragment="detail"/>
                </div>
                <div class="col-md-10 address-line">
                    <jsp:invoke fragment="phone"/>
                </div>
            </div>
        </div>
        <div class="col-md-2 col-sm-2">
            <a data-target="#${status}" data-toggle="modal">编辑</a>
            <br>
            <s:url var="deleteAdd" action="deleteAddress" namespace="/address">
                <s:param name="addressId">
                    <jsp:invoke fragment="addressId"/>
                </s:param>
            </s:url>
            <a href="${deleteAdd}">删除</a>
            <br>
            <% if (status == defaultAddressId) { %>
            默认地址
            <% } else {%>
            <a id="btn-default-<jsp:invoke fragment="addressId"/>"
               onclick="setDefault(<jsp:invoke fragment="addressId"/>)">设为默认</a>
            <br>
            <% }%>
        </div>

    </div>
</div>

<!-- Modal -->
<div class="modal fade" id="${status}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel"
     aria-hidden="true">
    <div class="modal-dialog" role="document" style="width: 400px;">
        <!--Content-->
        <div class="modal-content card">
            <!--Header-->
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h5 class="modal-title" id="myModalLabel" data-toggle="modal" data-target="#myModal">编辑地址</h5>
            </div>
            <form class="form-address" action="updateAddress" namespace="/address" method="post">
                <div style="display: none">
                    <s:textfield name="addressId"/>
                </div>
                <!--Body-->
                <div class="modal-body">
                    <div id="address-form-edit">
                        <div class="row">
                            <div class="col-md-4">
                                <div class="md-form">
                                    <s:textfield label="收件人" name="receiver" required="true" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-8">
                                <div class="md-form">
                                    <s:textfield label="电话" name="mobile" required="true" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <s:textfield label="省" name="addressProvince" required="true" class="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <s:textfield label="市" name="addressCity" required="true" class="form-control"
                                                 cssClass="form-control"/>
                                </div>
                            </div>
                            <div class="col-md-4">
                                <div class="md-form">
                                    <s:textfield label="区" name="addressDistrict" required="true" class="form-control"/>
                                </div>
                            </div>

                            <div class="col-md-12">
                                <div class="md-form">
                                    <s:textfield label="详细地址" name="addressDetail" required="true"
                                                 class="form-control"/>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <!--Footer-->
                <div class="modal-footer" style="border-top: 0px">
                    <s:submit type="button" class="btn blue btn-primary">确认</s:submit>
                    <s:div type="button" class="btn grey" data-dismiss="modal">取消</s:div>
                </div>
            </form>
        </div>
        <!--/.Content-->
    </div>
</div>
<!-- /.Live preview-->


<script type="text/javascript">
    function setDefault(addressId) {
        var btn = $("#btn-default-addressId");
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