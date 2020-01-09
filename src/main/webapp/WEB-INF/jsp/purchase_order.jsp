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
                    <h1>PurchaseOrder</h1>
                    <h2>訂單資料</h2>
                </div>
                <table>
                    <td valign="top">
                        <div class="content">
                            <form:form modelAttribute="purchaseOrder" id="myform" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/purchase_order/">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">PurchaseOrder - 資料維護</h2>
                                    </legend>
                                    <table>
                                        <tr>
                                            <td valign="top" style="padding: 5px"> 
                                                <form:input path="orderNum" placeholder="請輸入訂單編號" readonly="${readonly}" /> <form:errors path="orderNum" style="color: red"/><p/>
                                                <form:select path="customerId" 
                                                             items="${cusList}" 
                                                             itemLabel="name" 
                                                             itemValue="customerId"/><p/>
                                                <form:select path="productId" 
                                                             items="${proList}" 
                                                             itemLabel="label" 
                                                             itemValue="productId"/><p/>
                                                <form:input path="quantity" placeholder="請輸入數量" /> <form:errors path="quantity" style="color: red"/>
                                            </td>
                                            <td valign="top" style="padding: 5px">
                                                <form:input path="shippingCost" placeholder="運輸費用" /> <form:errors path="shippingCost" style="color: red"/><p/>
                                                <form:input path="salesDate" placeholder="salesDate" type="date" value="2020-01-09"/><p/>
                                                <form:input path="shippingDate" placeholder="shippingDate" type="date" value="2020-01-09"/><p/>
                                                <form:input path="freightCompany" placeholder="請輸入快遞公司" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3">
                                                <input type="hidden" id="_method" name="_method" value="${_method}">
                                                <button type="submit" class="pure-button pure-button-primary">${_method}</button>
                                            </td>
                                        </tr>
                                    </table>
                                </fieldset>
                            </form:form>

                            <form class="pure-form">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">PurchaseOrder - 資料查詢</h2>
                                    </legend>
                                    <table class="pure-table pure-table-bordered">
                                        <thead>
                                            <tr>
                                                <th>OrderNum</th>
                                                <th>CustomerID</th>
                                                <th>ProductID</th>
                                                <th>Quantity</th>
                                                <th>ShippingCost</th>
                                                <th>Sales_Date</th>
                                                <th>ShippingDate</th>
                                                <th>FreightCompany</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="poList" items="${purchaseOrderList}">
                                                <tr>                                                    
                                                    <td title="點此修改"><a href="${pageContext.request.contextPath}/mvc/purchase_order/${poList.orderNum}">${poList.orderNum}</a></td>
                                                    <td title="點此查詢顧客資料"><a href="${pageContext.request.contextPath}/mvc/customer/${poList.customerId}">${poList.customerId}</a></td>
                                                    <td title="點此查詢產品資料"><a href="${pageContext.request.contextPath}/mvc/product/${poList.productId}">${poList.productId}</a></td>
                                                    <td>${poList.quantity}</td>
                                                    <td>${poList.shippingCost}</td>
                                                    <td>${poList.salesDate}</td>
                                                    <td>${poList.shippingDate}</td>
                                                    <td>${poList.freightCompany}</td>
                                                    <td title="點此刪除"><a href="${pageContext.request.contextPath}/mvc/purchase_order/${poList.orderNum}" class="delete">刪除</a></td>
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