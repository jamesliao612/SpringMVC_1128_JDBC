<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
    <head>
        <%@include file="fragment/head.jspf" %>
        <script>
            $(document).ready(function () {
                $(".delete").click(function () {
                    var href = $(this).attr("href");
                    $("#_method").val("DELETE");
                    $("#myform").attr("action", href).submit();
                    return  false;
                });
            });
        </script>
    </head>
    <body>
        <div id="layout">
            <!-- Menu -->
            <%@include file="fragment/menu.jspf" %>
            <!-- Body -->
            <div id="main">
                <div class="header">
                    <h1>Micro Market</h1>
                    <h2>市場區塊資料</h2>
                </div>

                <div class="content">
                    <h2 class="content-subhead">市場區塊維護</h2>
                    <form:form modelAttribute="po" id="myform" method="post" action="${pageContext.request.contextPath}/mvc/micro_market/" class="pure-form">
                        <fieldset>
                            <form:input path="zipCode" placeholder="請輸入郵政碼" readonly="${readonly}"/><p/>
                            <form:input path="radius" placeholder="請輸入Radius" />
                            <form:input path="areaLength" placeholder="請輸入AreaLength" />
                            <form:input path="areaWidth" placeholder="請輸入AreaWidth" /><p/>
                            <input type="hidden" id="_method" name="_method" value="${_method}"/>
                            <button type="submit" class="pure-button pure-button-primary">${_method}</button>
                            <button type="reset" class="pure-button pure-button-primary">Reset</button>
                        </fieldset>
                    </form:form>
                    <h2 class="content-subhead">市場區塊清單</h2>
                    <table class="pure-table pure-table-bordered">
                        <thead>
                            <tr>
                                <th>郵政碼</th>
                                <th>範圍</th>
                                <th>長度</th>
                                <th>寬度</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="rs" items="${queryResult}">
                                <tr>
                                    <td><a href="${pageContext.request.contextPath}/mvc/micro_market/${rs.zipCode}">${rs.zipCode}</a></td>
                                    <td>${rs.radius}</td>
                                    <td>${rs.areaLength}</td>
                                    <td>${rs.areaWidth}</td>
                                    <td><a href="${pageContext.request.contextPath}/mvc/micro_market/${rs.zipCode}" class="delete">刪除</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>