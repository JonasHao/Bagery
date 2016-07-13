<%@ tag import="constant.Config" %>
<%@tag description="Product template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>
<%@attribute name="img" fragment="true" %>
<%@attribute name="title" type="java.lang.String" %>
<%@attribute name="price" fragment="true" %>
<%@attribute name="pricedId" fragment="true" %>
<%@attribute name="itemId" fragment="true" %>
<div class="card card-favorite">

    <!--Card image-->
    <div class="view overlay hm-white-slight ">
        <img src="<jsp:invoke fragment="img"/>" class="img-fluid" alt="" style="padding: .75rem;">
        <div class="mask waves-effect waves-light" onclick="selectAction(<jsp:invoke fragment="pricedId"/>);">
            <div class="mask">
                <a class="label-delete">
                    <i class="fa fa-trash-o fa-lg" aria-hidden="true"></i>
                </a>
            </div>


        </div>
        <!--/.Card image-->
        <!--Card content-->
        <div class="card-block product-text">

            <div class="price">
                <!--Title-->
                <h6 class="card-title product-title">
                    <%
                        if (title.length() < Config.MAX_TITLE_LENGTH) {
                            out.println(title);
                        } else {
                            out.println(title.substring(0, Config.MAX_TITLE_LENGTH)+"...");
                        }
                    %>
                </h6>
                <!--Text-->
                <div class="center" style="width: 6rem">
                    <i class="fa fa-rmb" aria-hidden="true"></i>
                    <jsp:invoke fragment="price"/>
                </div>
            </div>


        </div>
        <!--/.Card content-->
    </div>
    <script>
        var todelete;
        function selectAction(pricedId) {
            if (event.target.nodeName == "I") {
                todelete = event.target.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode;
                bootbox.confirm({
                    title:'删除包包',
                    message:'确认要删除该宝贝吗？',
                    callback: function(result){
                        if(result){
                            $.ajax(
                                    {
                                        url: "/favorite/unfavor",
                                        dataType: "json",   //返回格式为json
                                        type: 'post',
                                        data: {priceId: pricedId},
                                        success: function (data) {
                                            if (data.result == "success") {
                                                todelete.remove();
                                                notify("成功删除该宝贝");
                                            } else {
                                                warning("删除失败！");
                                            }
                                        }
                                    })
                        } }
                })

            } else {
                window.open("/product/viewProduct.action?pricedId=" + pricedId);
            }
        }
    </script>
</div>