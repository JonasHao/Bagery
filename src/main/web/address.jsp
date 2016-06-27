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
           <li><a href="index.jsp">首页</a></li>
           <li><a href="home.jsp">个人中心</a></li>
           <li class="active">管理地址簿</li>
       </ol>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script type="text/javascript">
            var addressForm = $('#address-form');
            addressForm.on('hidden.bs.collapse', function () {
                $('#btn-add-address').text("添加新地址");
            });
            addressForm.on('show.bs.collapse', function () {
                $('#btn-add-address').text("取消添加");
            });

            $(function(){
                var hash = document.location.hash;
                if (hash) {
                    $(hash).click();
                }
            });
        </script>
    </jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <h1 class="address-title">地址簿</h1>
            <t:addressItem>
                <jsp:attribute name="receiver">Bagery</jsp:attribute>
                <jsp:attribute name="phone">18819999999</jsp:attribute>
                <jsp:attribute name="address">广东省广州市番禺区华南理工大学</jsp:attribute>
                <jsp:attribute name="addressId">5</jsp:attribute>
            </t:addressItem>

            <button id="add-address" class="btn btn-primary btn-lg" data-toggle="collapse"
                    data-target="#address-form">添加新地址
            </button>

            <div id="address-form" class="collapse">

                <div class="row">
                    <div class="col-md-4">
                        <div class="md-form">
                            <s:textfield label="收件人" id="receiver" name="receiver" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-8">
                        <div class="md-form">
                            <s:textfield label="电话" name="phone" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="md-form">
                            <s:textfield label="省" name="province" class="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="md-form">
                            <s:textfield label="市" name="city" class="form-control" cssClass="form-control"/>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="md-form">
                            <s:textfield label="区" name="district" class="form-control"/>
                        </div>
                    </div>

                    <div class="col-md-12">
                        <div class="md-form">
                            <s:textfield label="详细地址" name="detail" class="form-control"/>
                        </div>
                    </div>
                </div>


                <s:submit cssClass="grey btn btn-primary" value="保存"/>

            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>


