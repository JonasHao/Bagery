<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>

    <jsp:attribute name="title">商品列表</jsp:attribute>
    <jsp:attribute name="breadcrumb">
            <s:url var="pricedList" action="productList" namespace="/product"/>
       <ol class="breadcrumb">
           <li><a href="/index.jsp">首页</a></li>
           <li class="active"><a href="${pricedList}">商品列表</a></li>
       </ol>
    </jsp:attribute>
    <jsp:body>
        <s:set name="page_max_size" value="8"/>
        <!--Main layout-->
        <div class="container">
            <div class="row">
                <!--Sidebar-->
                <div class="col-lg-2 col-md-3">

                    <div class="widget-wrapper">
                        <h6>品牌:</h6>
                        <div class="list-group">
                            <s:iterator value="pross[0]">
                                <s:url var="property_select1" action="productListByPro" namespace="/product">
                                    <s:param name="pro_id"><s:property value="proId"/></s:param>
                                </s:url>

                                <a href="${property_select1}" class="list-group-item filter-list-group-item
                                   <s:if test="selected == 1">active</s:if>">
                                    <s:property value="description"/></a>
                            </s:iterator>
                        </div>
                    </div>

                    <div class="widget-wrapper">
                        <h6>材质:</h6>
                        <div class="list-group">
                            <s:iterator value="pross[1]">
                                <s:url var="property_select2" action="productListByPro" namespace="/product">
                                    <s:param name="pro_id"><s:property value="proId"/></s:param>
                                </s:url>


                                <a href="${property_select2}"
                                   class="list-group-item filter-list-group-item <s:if test="selected == 1">active</s:if>">
                                    <s:property value="description"/></a>
                            </s:iterator>
                        </div>
                    </div>

                    <div class="widget-wrapper">
                        <h6>款式:</h6>
                        <div class="list-group">
                            <s:iterator value="pross[2]">
                                <s:url var="property_select3" action="productListByPro" namespace="/product">
                                    <s:param name="pro_id"><s:property value="proId"/></s:param>
                                </s:url>

                                <a href="${property_select3}" class="list-group-item filter-list-group-item
                                   <s:if test="selected == 1">active</s:if>">
                                    <s:property value="description"/></a>
                            </s:iterator>
                        </div>
                    </div>
                </div>

                <!--/.Sidebar-->

                <!--Main column-->
                <div class="col-lg-10 col-md-9">
                    <div class="tab-content">
                        <s:set name="priceds" value="priceds"/>
                        <s:set name="pricedsSize" value="#priceds!= null ? #priceds.size() : 0"/>
                        <s:set name="pages" value="#pricedsSize/#page_max_size + 1"/>

                        <%--  page_max_size=3  每页最多放3个 --%>
                        <s:iterator begin="1" end="#pages" status="st_page">
                            <%--  实际每页放的商品数量 --%>
                            <s:set name="page_count">
                                <s:property
                                        value="%{#st_page.index+1<#pages? #page_max_size : #pricedsSize%#page_max_size}"/>
                            </s:set>

                            <s:set name="p">
                                <s:property value="%{#st_page.index +1}"/>
                            </s:set>

                            <div class="page tab-pane <s:if test="#p == 1">active</s:if>"
                                 id="products-page-<s:property value="#p"/>" role="tabpanel">
                                <div class="row">
                                    <s:iterator begin="1" end="#page_count" status="st">
                                        <div class="col-md-4 col-lg-3">
                                            <s:set name="i" value="%{(#p-1)*#page_max_size+ #st.index}"/>
                                            <t:product>
                                                <jsp:attribute name="img"><s:property
                                                        value="%{priceds[#i].img}"/></jsp:attribute>
                                                <jsp:attribute name="title"><s:property
                                                        value="%{priceds[#i].title}"/></jsp:attribute>
                                                <jsp:attribute name="price"><s:property
                                                        value="%{priceds[#i].unitPrice}"/></jsp:attribute>
                                                <jsp:attribute name="pricedId"><s:property
                                                        value="%{priceds[#i].pricedId}"/></jsp:attribute>
                                            </t:product>
                                        </div>
                                    </s:iterator>
                                </div>
                            </div>
                        </s:iterator>
                    </div>

                        <%--         选页         --%>
                    <ul class="nav nav-tabs tabs-5 pagination" role="tablist">

                        <s:iterator begin="1" end="#pages" status="st_page">

                            <s:set name="p">
                                <s:property value="%{#st_page.index +1}"/>
                            </s:set>

                            <li class="nav-item page-item">
                                <a class="nav-link <s:if test="#p == 1">active</s:if> page-link" data-toggle="tab"
                                   href="#products-page-<s:property value="#p"/>"
                                   role="tab"><s:property value="#p"/></a>
                            </li>

                        </s:iterator>
                        <li class="nav-item page-item">
                            <a class="nav-link page-link" data-toggle="tab" href="#products-page-5"
                               role="tab">..</a>
                        </li>
                    </ul>
                </div>
                <!--/.Main column-->
            </div>
        </div>
        <!--/.Main layout-->
    </jsp:body>
</t:base>