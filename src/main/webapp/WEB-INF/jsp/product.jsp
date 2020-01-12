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

            <%@include file="fragment/menu.jspf" %>

            <div id="main">
                <div class="header">
                    <h1>Product</h1>
                    <h2>商品資料維護</h2>
                </div>

                <table>
                    <td valign="top">
                        <div class="content">
                            <form:form modelAttribute="po" id="myform" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/product/">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">商品資料維護</h2>
                                    </legend>
                                    <form:input path="productId" placeholder="商品ID" readonly="${readonly}"/><p/>
                                    
                                    <form:select path="manufacturerId" 
                                                 items="${mfList}" 
                                                 itemLabel="name" 
                                                 itemValue="manufacturerId"/><p/>
                                    
                                    <form:select path="productCode" 
                                                 items="${pcList}" 
                                                 itemLabel="prodCode" 
                                                 itemValue="prodCode"/><p/>
                                    
                                    <form:input path="purchaseCost" placeholder="請輸入單價" /><p/>
                                    <form:input path="quantityOnHand" placeholder="請輸入庫存" /><p/>
                                    <form:input path="markup" placeholder="請輸入調漲" /><p/>
                                    <form:input path="available" placeholder="商品能否出貨"/><p/>
                                    <form:input path="description" placeholder="請輸入商品描述" /><p/>
                                    <input type="hidden" id="_method" name="_method" value="${_method}">
                                    <button type="submit" class="pure-button pure-button-primary">${_method}</button>
                                </fieldset>
                            </form:form>
                        </div>
                    </td>
                    <td valign="top">
                        <div class="content">
                            <form class="pure-form">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">商品資料列表</h2>
                                    </legend>
                                    <table class="pure-table pure-table-bordered">
                                        <thead>
                                            <tr>                                                
                                                <th valign="top" style="padding: 5px">商品ID</th>
                                                <th valign="top" style="padding: 5px">製造商ID</th>
                                                <th valign="top" style="padding: 5px">代碼</th>
                                                <th valign="top" style="padding: 5px">單價</th>
                                                <th valign="top" style="padding: 5px">庫存</th>
                                                <th valign="top" style="padding: 5px">調漲</th>
                                                <th valign="top" style="padding: 5px">可用</th>
                                                <th valign="top" style="padding: 5px">商品描述</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rs" items="${queryResult}">
                                                <tr>                                                    
                                                    <td title="點此修改"><a href="${pageContext.request.contextPath}/mvc/product/${rs.productId}">${rs.productId}</a></td>
                                                    <td title="點此連結製造商頁面"><a href="${pageContext.request.contextPath}/mvc/manufacturer/${rs.manufacturerId}">${rs.manufacturerId}</a></td>
                                                    <td title="點此連結商品代碼頁面"><a href="${pageContext.request.contextPath}/mvc/product_code/${rs.productCode}">${rs.productCode}</a></td>
                                                    <td>${rs.purchaseCost}</td>
                                                    <td>${rs.quantityOnHand}</td>
                                                    <td>${rs.markup}</td>
                                                    <td>${rs.available}</td>
                                                    <td>${rs.description}</td>
                                                    <td title="點此刪除"><a href="${pageContext.request.contextPath}/mvc/product/${rs.productId}" class="delete">刪除</a></td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </fieldset>
                            </form>
                        </div>
                    </td>
                </table>
            </div>
        </div>
    </body>
</html>