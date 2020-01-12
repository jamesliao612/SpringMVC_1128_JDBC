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
                    <h1>Product Code</h1>
                    <h2>商品代碼資料檢閱維護</h2>
                </div>

                <div class="content">
                    <h2 class="content-subhead">商品代碼維護</h2>
                    <form:form modelAttribute="po" id="myform" method="post" action="${pageContext.request.contextPath}/mvc/product_code/" class="pure-form">
                        <fieldset>
                            <form:input path="prodCode" placeholder="請輸入商品代碼" readonly="${readonly}"/>
                            <form:input path="discountCode" placeholder="請輸入折扣" />
                            <form:input path="description" placeholder="請輸入商品描述" /><p/>
                            <input type="hidden" id="_method" name="_method" value="${_method}"/>
                            <button type="submit" class="pure-button pure-button-primary">${_method}</button>
                            <button type="reset" class="pure-button pure-button-primary">Reset</button>
                        </fieldset>
                    </form:form>
                    <h2 class="content-subhead">商品代碼清單</h2>
                    <table class="pure-table pure-table-bordered">
                        <thead>
                            <tr>
                                <th valign="top" style="padding: 5px">商品代碼</th>
                                <th valign="top" style="padding: 5px">折扣碼</th>
                                <th valign="top" style="padding: 5px">商品描述</th>
                                <th></th>
                            </tr>
                        </thead>

                        <tbody>
                            <c:forEach var="rs" items="${queryResult}">
                                <tr>
                                    <td><a href="${pageContext.request.contextPath}/mvc/product_code/${rs.prodCode}">${rs.prodCode}</a></td>
                                    <td>${rs.discountCode}</td>
                                    <td>${rs.description}</td>
                                    <td><a href="${pageContext.request.contextPath}/mvc/product_code/${rs.prodCode}" class="delete">刪除</a></td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>    
    </body>
</html>