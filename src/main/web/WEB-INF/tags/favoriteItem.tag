<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" fragment="true" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="pricedId" fragment="true" %>
<%@attribute name="itemId" fragment="true" %>
<div class="card card-favorite">

    <%--&lt;%&ndash;todo 更新商品详情action&ndash;%&gt;--%>
    <%--<s:url var="productUrl" namespace="/product" action="viewProduct">--%>
        <%--<s:param name="priced_id">--%>
            <%--<jsp:invoke fragment="pricedId"/>--%>
        <%--</s:param>--%>
    <%--</s:url>--%>

    <%--<s:url var="unfavorUrl" namespace="/favorite" action="unfavor">--%>
    <%--<s:param name="itemId">--%>
    <%--<jsp:invoke fragment="itemId"/>--%>
    <%--</s:param>--%>
    <%--</s:url>--%>

    <!--Card image-->
    <div class="view overlay hm-white-slight ">
        <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="">
        <div class="mask waves-effect waves-light" onclick="selectAction(<jsp:invoke fragment="pricedId"/>);">
            <div class="mask">
                <a class="label-delete">
                    <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i>
                </a>
            </div>
            <%--</s:a>--%>


        </div>
        <!--/.Card image-->
        <!--Card content-->
        <div class="card-block product-text">

            <div class="price">
                <!--Title-->
                <h5 class="card-title product-title">
                    <jsp:invoke fragment="title"/>
                </h5>
                <!--Text-->
                <i class="fa fa-rmb" aria-hidden="true"></i>
                <jsp:invoke fragment="price"/>
            </div>


        </div>
        <!--/.Card content-->
    </div>
    <script>
        var todelete;
        function selectAction(pricedId) {
            if (event.target.nodeName == "I") {
                todelete = event.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
                $.ajax(
                        {
                            url: "/favorite/unfavor",
                            dataType: "json",   //返回格式为json
                            type: 'post',
                            data: {priceId: pricedId},
                            success: function (data) {
                                if (data.result == "success") {
                                    todelete.remove();
                                } else {
                                    alert("收藏失败！");
                                }
                            }
                        })
            } else {
                window.open("/product/viewProduct?priceId="+pricedId);
            }
        }
    </script>
</div>