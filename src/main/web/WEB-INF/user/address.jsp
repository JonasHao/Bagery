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

    <jsp:attribute name="head">
            <link href="../../css/home.css" rel="stylesheet">
    </jsp:attribute>
    <jsp:attribute name="title">管理地址簿</jsp:attribute>
    <jsp:attribute name="breadcrumb">
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li><s:a action="home" namespace="/user">个人中心</s:a></li>
           <li class="active">管理地址簿</li>
       </ol>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script type="text/javascript">
            function getQueryString(name) {
                var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
                var r = location.search.substr(1).match(reg);
                if (r != null) return unescape(decodeURI(r[2])); return null;
            }
            var m=getQueryString("message");
            if(m!=null){
                if(m=="删除失败！"){
                    warning("删除失败！");
                }else{
                notify(m);
                }
            }

            var addressForm = $('#address-form');
            addressForm.on('hidden.bs.collapse', function () {
                $('#btn-add-address').text("添加新地址");
            });
            addressForm.on('show.bs.collapse', function () {
                $('#btn-add-address').text("取消添加");
            });

            $(function () {
                var add = <s:property value="add"/>;
                if (add > 0) {
                    $("#add").click();
                    window.location = "#add";
                }
            });

            $(document).ready(function () {
                console.log(getQueryString("returnAddress"));
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <h1 class="address-title">地址簿</h1>

            <s:iterator value="addressList">
                <t:addressItem>
                    <jsp:attribute name="receiver"><s:property value="receiver"/></jsp:attribute>
                    <jsp:attribute name="phone"><s:property value="mobile"/></jsp:attribute>
                    <jsp:attribute name="province"><s:property value="addressProvince"/></jsp:attribute>
                    <jsp:attribute name="city"><s:property value="addressCity"/></jsp:attribute>
                    <jsp:attribute name="district"> <s:property value="addressDistrict"/></jsp:attribute>
                    <jsp:attribute name="detail">  <s:property value="addressDetail"/></jsp:attribute>
                    <jsp:attribute name="addressId"><s:property value="addressId"/></jsp:attribute>
                    <jsp:attribute name="defaultAddressId"><s:property value="defaultAddressId"/></jsp:attribute>
                    <jsp:attribute name="status"><s:property value="addressId"/></jsp:attribute>
                </t:addressItem>
            </s:iterator>

            <button id="add" class="btn btn-primary btn-lg" data-toggle="collapse"
                    data-target="#address-form">添加新地址
            </button>


            <form class="form-address" action="addAddress" namespace="/address" method="POST">
                <div id="address-form" class="collapse">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="md-form">
                                <s:textfield label="收件人" id="receiver"  name="receiver" required="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-8">
                            <div class="md-form">
                                <s:textfield label="电话" name="mobile" maxLength="11" minLength="11"  required="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="md-form">
                                <s:textfield label="省" name="addressProvince" required="true" class="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="md-form">
                                <s:textfield label="市" name="addressCity" class="form-control" required="true" cssClass="form-control"/>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="md-form">
                                <s:textfield label="区" name="addressDistrict" required="true" class="form-control"/>
                            </div>
                        </div>

                        <div class="col-md-12">
                            <div class="md-form">
                                <s:textfield label="详细地址" name="addressDetail" required="true" class="form-control"/>
                            </div>
                        </div>
                    </div>
                    <s:submit cssClass="grey btn btn-primary" value="保存"/>
                </div>
            </form>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>


