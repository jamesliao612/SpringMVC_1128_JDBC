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
                    <h1>快速查詢</h1>
                </div>
                <table>
                    <td valign="top">
                        <div class="content">
                            <form id="myform" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/pu_view/">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">Query - 快速查詢</h2>
                                    </legend>
                                    
                                </fieldset>
                            </form>

                            <form class="pure-form">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">Query - 查詢結果</h2>
                                    </legend>
                                    <table class="pure-table pure-table-bordered">
                                        <thead>
                                            <tr>
                                                <th>訂單編號</th>
                                                <th>客戶ID</th>
                                                <th>客戶名稱</th>
                                                <th>產品ID</th>
                                                <th>產品名稱</th>
                                                <th>產品代碼</th>
                                                <th>數量</th>
                                                <th>單價</th>
                                                <th>折扣</th>
                                                <th>總計</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rs" items="${queryResult}">
                                                <tr>                                                                                                        
                                                    <td>${rs.orderNum}</td>
                                                    <td>${rs.customerId}</td>
                                                    <td>${rs.customerName}</td>
                                                    <td>${rs.productId}</td>
                                                    <td>${rs.productName}</td>
                                                    <td>${rs.productCodeName}</td>
                                                    <td>${rs.quantity}</td>
                                                    <td>${rs.purchaseCost}</td>
                                                    <td>${rs.rate}</td>
                                                    <td>${rs.subtotal}</td>
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