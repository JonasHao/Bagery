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
<%@attribute name="stock" fragment="true" %>
<div class="card" id="order-<jsp:invoke fragment="itemId"/>">
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
                        <h5 class="card-title cart-item-title">
                            <jsp:invoke fragment="title"/>
                        </h5>
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
                    <span><jsp:invoke fragment="salePrice"/></span>
                </div>

                <div class="col-md-2 quantity-control">
                    <button type="button" onclick="minus(<jsp:invoke fragment="stock"/>)">-</button>
                    <input type="text" min="1" max="<jsp:invoke fragment="stock"/>"
                           onkeyup="this.value=minmax(this.value,1,<jsp:invoke fragment="stock"/>,
                           <jsp:invoke fragment="salePrice"/> )"
                           onblur="updateCart( <jsp:invoke fragment="itemId"/>,this.value)"
                           value="<jsp:invoke fragment="number"/>">
                    <button type="button" onclick="add(<jsp:invoke fragment="stock"/>)">+</button>
                    <br/>
                    <span style="color:red"></span>
                </div>

                <div class="col-md-2">
                    <i class="fa fa-rmb" aria-hidden="true"></i>
                    <span id="total-<jsp:invoke fragment="itemId"/>"><jsp:invoke fragment="totalPrice"/></span>
                </div>

                <div class="col-md-2">
                    <a onclick="bootbox.confirm({
                            title:'删除包包',
                            message:'确认要删除该宝贝吗？',
                            callback: function(result){
                            if(result){
                            deleteCart(<jsp:invoke fragment="itemId"/>);
                            } }
                            })">
                        <i class="fa fa-trash" aria-hidden="true"></i>删除
                    </a>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript">

    function deleteCart(id) {
        var to_delete = $("#order-" + id);
        console.log(to_delete);
        $.ajax(
                {
                    url: "/cart/deleteCart",
                    dataType: "json",   //返回格式为json
                    type: 'post',
                    data: {itemId: id},
                    success: function (data) {
                        if (data.result == "success") {
                            to_delete.remove();
                            notify("成功移除购物车");
                        } else {
                            warning("删除失败！");
                        }
                    }
                })
    }

    function add(stock) {
        console.log(event.target.parentNode.childNodes);
        var myself = event.target;
        var inputtext = myself.previousSibling.previousSibling;
        if (inputtext.value >= stock) {
            myself.isDisabled = true;
            myself.parentNode.childNodes[9].innerHTML = "最多只能购买" + stock + "件";
        }
        else {
            if (inputtext.value == 1)
                inputtext.previousSibling.previousSibling.isDisabled = "false";
            inputtext.value++;
            console.log("input text:" + inputtext.value);
            minmax(inputtext.value, 1, stock, <jsp:invoke fragment="salePrice"/>);
        }

    }
    function minus(stock) {
        var myself = event.target;
        var inputtext = myself.nextSibling.nextSibling;
        if (inputtext.value <= 1)
            myself.isDisabled = true;
        else {
            if (inputtext.value >= stock) {
                inputtext.nextSibling.nextSibling.isDisabled = "false";
                myself.parentNode.childNodes[9].innerHTML = "";
            }
            inputtext.value--;
            console.log("input text:" + inputtext.value);
            minmax(inputtext.value, 1, stock, <jsp:invoke fragment="salePrice"/>);
        }
    }
    function minmax(value, min, max, price) {
        console.log("value=" + value + " min=" + min + " max=" + max + " price=" + price);
        var myself = event.target;
        var total = $("#total-<jsp:invoke fragment="itemId"/>");

        value = parseInt(value);
        min = parseInt(min);
        max = parseInt(max);

        if (value > max) {
            myself.parentNode.childNodes[9].innerHTML = "最多只能购买" + max + "件";
            total.text(max * price);
            return max;
        }

        myself.parentNode.childNodes[9].innerHTML = "";

        if (min <= value && value <= max) {
            total.text(value * price);
            console.log("total price = " + value * price);
            return value;
        }

        total.value.text(min * price);
        return min;
    }

    function updateCart(itemId, number) {
        console.log("itemId=" + itemId + " number=" + number);
        $.ajax(
                {
                    url: "/cart/updateCart.action",
                    dataType: "json",   //返回格式为json
                    type: 'post',
                    data: {itemId: itemId, num: number}
                })
    }
</script>
