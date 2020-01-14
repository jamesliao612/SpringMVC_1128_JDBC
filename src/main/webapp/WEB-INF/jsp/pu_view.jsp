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
                            <form id="myform" class="pure-form">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">Query - 快速查詢</h2>
                                    </legend>
                                    <div class="content">
                                        <form class="pure-form">
                                            <select onChange="location = this.options[this.selectedIndex].value;">
                                                <option value="#">請選擇查詢欄位</option>
                                                <option value="${pageContext.request.contextPath}/mvc/pu_view/">Google 台灣</option>
                                                <option value="${pageContext.request.contextPath}/mvc/pu_view/">Yahoo! 奇摩</option>
                                                <option value="${pageContext.request.contextPath}/mvc/pu_view/">PHP.net</option>
                                            </select>
                                            <button type="button" class="pure-button pure-button-primary" 
                                                    onclick="location.href = '${pageContext.request.contextPath}/mvc/pu_view/all'">
                                                Query All
                                            </button>
                                        </form>
                                    </div>
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
                                                <th valign="top" style="padding: 4px">訂單編號</th>
                                                <th valign="top" style="padding: 4px">客戶ID</th>
                                                <th valign="top" style="padding: 4px">客戶名稱</th>
                                                <th valign="top" style="padding: 4px">產品ID</th>
                                                <th valign="top" style="padding: 4px">產品名稱</th>
                                                <th valign="top" style="padding: 4px">產品代碼</th>
                                                <th valign="top" style="padding: 4px">數量</th>
                                                <th valign="top" style="padding: 4px">單價</th>
                                                <th valign="top" style="padding: 4px">折扣</th>
                                                <th valign="top" style="padding: 4px">總計</th>
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