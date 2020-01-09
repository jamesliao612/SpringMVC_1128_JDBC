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
                    <h1>Customer</h1>
                    <h2>顧客資料</h2>
                </div>
                <table>
                    <td valign="top">
                        <div class="content">
                            <form:form modelAttribute="po" id="myform" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/customer/">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">Customer - 資料維護</h2>
                                    </legend>
                                    <table>
                                        <tr>
                                            <td valign="top" style="padding: 5px"> 
                                                <form:input path="customerId" placeholder="請輸入客戶ID" readonly="${readonly}" /><p/>
                                                <form:select path="discountCode" 
                                                             items="${dcList}" 
                                                             itemLabel="label" 
                                                             itemValue="discountCode"/><p/>
                                                <form:select path="zip" 
                                                             items="${mmList}" 
                                                             itemLabel="zipCode" 
                                                             itemValue="zipCode"/><p/>
                                                <form:input path="name" placeholder="請輸入客戶名稱" />
                                            </td>
                                            <td valign="top" style="padding: 5px">
                                                <form:input path="addressLine1" placeholder="請輸入地址之一" /><p/>
                                                <form:input path="addressLine2" placeholder="請輸入地址之二" /><p/>
                                                <form:input path="city" placeholder="請輸入城市名" /><p/>
                                                <form:input path="state" placeholder="請輸入洲名" />
                                            </td>
                                            <td valign="top" style="padding: 5px">
                                                <form:input path="phone" placeholder="請輸入電話" /><p/>
                                                <form:input path="fax" placeholder="請輸入傳真" /><p/>
                                                <form:input path="email" placeholder="請輸入信箱" /><p/>
                                                <form:input path="creditLimit" placeholder="請輸入信用額度" type="number" />
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
                                        <h2 class="content-subhead">Customer - 資料查詢</h2>
                                    </legend>
                                    <table class="pure-table pure-table-bordered">
                                        <thead>
                                            <tr>
                                                <th>客戶ID</th>
                                                <th>折扣碼</th>
                                                <th>郵政碼</th>
                                                <th>客戶名稱</th>
                                                <th>地址之一</th>
                                                <th>地址之二</th>
                                                <th>城市</th>
                                                <th>洲</th>
                                                <th>電話</th>
                                                <th>傳真</th>
                                                <th>信箱</th>
                                                <th>信用額度</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rs" items="${queryResult}">
                                                <tr>                                                    
                                                    <td title="點此修改"><a href="${pageContext.request.contextPath}/mvc/customer/${rs.customerId}">${rs.customerId}</a></td>
                                                    <td title="點此查詢折扣碼"><a href="${pageContext.request.contextPath}/mvc/discount_code/${rs.discountCode}">${rs.discountCode}</a></td>
                                                    <td title="點此查詢市場區域"><a href="${pageContext.request.contextPath}/mvc/micro_market/${rs.zip}">${rs.zip}</a></td>
                                                    <td>${rs.name}</td>
                                                    <td>${rs.addressLine1}</td>
                                                    <td>${rs.addressLine2}</td>
                                                    <td>${rs.city}</td>
                                                    <td>${rs.state}</td>
                                                    <td>${rs.phone}</td>
                                                    <td>${rs.fax}</td>
                                                    <td>${rs.email}</td>
                                                    <td>${rs.creditLimit}</td>
                                                    <td title="點此刪除"><a href="${pageContext.request.contextPath}/mvc/customer/${rs.customerId}" class="delete">刪除</a></td>
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