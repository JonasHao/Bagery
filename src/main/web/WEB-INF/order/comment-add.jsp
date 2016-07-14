<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="t" tagdir="/WEB-INF/tags" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<t:base>
    <jsp:attribute name="title">添加评论</jsp:attribute>

    <jsp:attribute name="head">
       <link href="../../css/login.css" rel="stylesheet">
        <link rel="stylesheet" href="../../css/star-rating.css" media="all" type="text/css"/>
        <link href="../../css/themes/krajee-fa/theme.css" media="all" rel="stylesheet" type="text/css"/>
    </jsp:attribute>

    <jsp:attribute name="scripts">
        <script src="../../js/star-rating.js" type="text/javascript"></script>
        <script src="../../js/themes/krajee-fa/theme.min.js" type="text/javascript"></script>
        <script src="../../js/locales/zh.js"></script>
        <script type="text/javascript">
            $(document).on('ready', function () {
                $(".kv-fa").rating(
                        {
                            theme: 'krajee-fa',
                            filledStar: '<i class="fa fa-star"></i>',
                            emptyStar: '<i class="fa fa-star-o"></i>',
                            step: '1',
                            language: 'zh'
                        }
                );
            });
        </script>

    </jsp:attribute>

    <jsp:body>
        <!--Main layout-->
        <div class="container" style="margin: 2rem">
            <form action="/order/addComment.action">
                <s:iterator value="commentList" status="row">
                    <div class="row order-item">
                        <div class="col-md-2">
                            <!--Card image-->
                            <div class="view overlay hm-white-slight">
                                <img src="<s:property value="priced.img"/>" class="img-fluid" alt="">
                                <a href="#">
                                    <div class="mask"></div>
                                </a>
                            </div>
                            <!--/.Card image-->
                        </div>
                        <div class="col-md-3 order-item-block">
                            <div>
                                <!--Title-->
                                <h5 class="card-title">
                                    <s:property value="priced.title"/>
                                </h5>
                                <div><i class="fa fa-rmb" aria-hidden="true"></i>
                                    <s:property value="priced.salePrice"/>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-7">
                            <s:textfield type="text" class="kv-fa rating-loading"
                                         value="0" data-size="s" title="" name="commentList[%{#row.index}].star"
                                         showClear="false"/>

                            <div class="md-form comment-form-item" style="margin-top: 1rem">
                                <s:textfield maxLength="200" minLength="10" name="commentList[%{#row.index}].content1"/>
                            </div>

                            <s:hidden name="commentList[%{#row.index}].orderId"
                                      value="%{orderId}"/>

                            <s:hidden name="commentList[%{#row.index}].pricedId"
                                      value="%{pricedId}"/>

                            <s:hidden name="commentList[%{#row.index}].priced"
                                      value="%{priced}"/>
                            <s:hidden name="commentList[%{#row.index}].order"
                                      value="%{order}"/>
                        </div>
                    </div>


                </s:iterator>

                <s:if test="commentList.size()>0">
                    <s:hidden name="orderId" value="%{commentList[0].orderId}"/>
                </s:if>
                <s:submit cssclass="grey btn btn-primary btn-input" value="提交评论"/>
            </form>
        </div>
        <!--/.Main layout-->
    </jsp:body>

</t:base>
