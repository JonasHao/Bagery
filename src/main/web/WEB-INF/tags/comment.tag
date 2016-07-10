<%@tag description="Comment template" pageEncoding="UTF-8" %>
<%@ taglib prefix="s" uri="/struts-tags" %>

<%@attribute name="img" fragment="true" %>
<%@attribute name="alt" fragment="true" %>
<%@attribute name="text" fragment="true" %>
<%@attribute name="append" type="java.lang.String" %>
<%@attribute name="reply" type="java.lang.String" %>
<%@attribute name="star" type="java.lang.Integer" %>

<div class="container">

    <div class="media">
        <a class="media-left" href="#">
            <img class="img-circle"
                 src="<jsp:invoke fragment="img"/>"
                 alt="<jsp:invoke fragment="alt"/>">
        </a>

        <div class="media-body comment-body">
            <h4 class="media-heading">John Doe</h4>
            <ul class="rating inline-ul">
                <%for (int i = 0; i < star; i++) { %>
                <li><i class="fa fa-star amber-text"></i></li>
                <% }
                    for (int i = star; i < 5; i++) { %>
                <li><i class="fa fa-star"></i></li>
                <% } %>
            </ul>
            <p>评价：
                <jsp:invoke fragment="text"/>
            </p>

            <% if (append != null && append.length() > 0) {
            %>
            <p class="comment-append">追评：
                <% out.println(append);%>
            </p>
            <% }%>

            <% if (reply != null && reply.length() > 0) {
            %>
            <p class="comment-reply">回复：
                <% out.println(reply);%>
            </p>
            <% }%>


        </div>
    </div>
</div>