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
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <h1 class="address-title">地址簿</h1>
            <div class="card">
                <div class="row card-block">
                    <div class="col-md-10 address-info">
                        <div class="row">
                            <div class="col-md-10 address-line">
                                郝俊楠
                            </div>
                            <div class="col-md-10 address-line">
                                广东省广州市番禺区华南理工大学
                            </div>
                            <div class="col-md-10 address-line">
                                18819999999
                            </div>
                        </div>
                    </div>
                    <div class="col-md-2 col-sm-2">
                        <a >编辑</a>
                        <br>
                        <a >删除</a>
                    </div>
                </div>
            </div>

            <a class="btn btn-primary btn-lg">添加新地址</a>
            <div class="address-form">
                <div class="md-form">
                    <s:textfield label="收件人" id="receiver"  name="receiver" class="form-control"/>
                </div>

                <div class="md-form">
                    <s:textfield label="电话" name="phone" class="form-control"/>
                </div>

                <div class="row">
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
                </div>



                <div class="md-form">
                    <s:textfield label="详细地址" name="detail" class="form-control"/>
                </div>
                <s:submit cssClass="grey btn btn-primary" value="保存"/>
                <a class="grey btn btn-primary">取消</a>

            </div>

        </div>
        <!--/.Main layout-->


    </jsp:body>
</t:base>
