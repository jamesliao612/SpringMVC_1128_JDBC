<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
    <head>
        <%@include file="fragment/head.jspf" %>
    </head>
    <body>
        <div id="layout">
            <!-- Menu -->
            <%@include file="fragment/menu.jspf" %>
            <!-- Body -->
            <div id="main">
                <div class="header">
                    <h1>Discount Code</h1>
                    <h2>A subtitle for your page goes here</h2>
                </div>

                <div class="content">
                    <h2 class="content-subhead">折扣碼維護</h2>
                    <form:form modelAttribute="po" id="myform" method="post" action="${pageContext.request.contextPath}/mvc/discount_code/" class="pure-form">
                        <fieldset>
                            <form:input path="discountCode" placeholder="請輸入折扣碼" readonly="${readonly}"/>
                            <form:input path="rate" placeholder="請輸入折扣" />
                            <input type="hidden" id="_method" name="_method" value="${_method}"/>
                            <button type="submit" class="pure-button pure-button-primary">${_method}</button>
                            <button type="reset" class="pure-button pure-button-primary">Reset</button>
                        </fieldset>
                    </form:form>
                    <h2 class="content-subhead">折扣碼清單</h2>
                    <table class="pure-table pure-table-bordered">
                        <thead>
                            <tr>
                                <th>CodeID</th>
                                <th>Rate</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="rs" items="${queryResult}">
                                <tr>
                                    <td><a href="${pageContext.request.contextPath}/mvc/discount_code/${rs.discountCode}">${rs.discountCode}</a></td>
                                    <td>${rs.rate}</td>
                                    <td><button type="button" class="pure-button pure-button-primary">刪除</button></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>