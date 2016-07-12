<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">查看物流信息</jsp:attribute>
    <jsp:body>
        <!--Main layout-->
        <div class="container">

            <div class="card white-text green" style="margin: 2rem; padding: 2rem;">
                <div class="card-block" style="text-align: center">
                    <h3><strong><i class="fa fa-truck" aria-hidden="true"></i></strong></h3>
                    <br/>
                    <h5>
                        <p>
                            <strong>物流信息：</strong><s:property value="logistics"/>
                        </p>

                        <tr>
                            <td>2016年5月28日
                                下午6:26:33
                            </td>
                            <td>
                                已签收,签收人是:【本人签收】
                            </td>

                        </tr>
                        <tr>
                            <td>2016年5月28日
                                上午11:22:15
                            </td>
                            <td>
                                【江苏扬州公司】的派件员【吴双】正在派件
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月28日
                                上午11:16:15
                            </td>
                            <td>
                                快件已到达【江苏扬州公司】
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月28日
                                上午8:27:57
                            </td>
                            <td>
                                由【江苏泰州中转部】发往【江苏扬州公司】
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月28日
                                上午2:33:50
                            </td>
                            <td>
                                由【浙江杭州中转部】发往【江苏泰州中转部】
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月27日
                                下午11:04:22
                            </td>
                            <td>
                                由【浙江湖州公司】发往【浙江杭州中转部】
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月27日
                                下午10:38:26
                            </td>
                            <td>
                                【浙江湖州公司】正在进行【装袋】扫描
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月27日
                                下午10:38:26
                            </td>
                            <td>
                                由【浙江湖州公司】发往【江苏无锡中转部】
                            </td>
                        </tr>
                        <tr>
                            <td>2016年5月27日
                                下午5:59:37
                            </td>
                            <td>
                                【浙江湖州双林公司】的收件员【双林片】已收件
                            </td>
                        </tr>
                    </h5>
                    <s:url namespace="/order" action="queryOrder" var="listUrl">
                        <s:param name="status">"unshipped"</s:param>
                    </s:url>
                    <h6><a style="color: #2a4011;" href="/index.jsp">回到首页</a> &nbsp; &nbsp;
                        <a style="color: #2a4011;" href="${listUrl}">查看订单列表</a>
                    </h6>
                </div>
            </div>

        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>