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
                    <h1>Manufacturer</h1>
                    <h2>製造商資料維護</h2>
                </div>
                <table>
                    <td valign="top">
                        <div class="content">
                            <form:form modelAttribute="po" id="myform" class="pure-form" method="post" action="${pageContext.request.contextPath}/mvc/manufacturer/">
                                <fieldset>
                                    <legend>
                                        <h2 class="content-subhead">製造商資料維護</h2>
                                    </legend>
                                    <table>
                                        <tr>
                                            <td valign="top" style="padding: 5px"> 
                                                <form:input path="manufacturerId" placeholder="請輸入製造商ID" type="number" readonly="${readonly}"/><p/>
                                                <form:input path="name" placeholder="請輸入製造商名稱" /><p/>
                                                <form:input path="addressline1" placeholder="請輸入地址之一" /><p/>
                                                <form:input path="addressline2" placeholder="請輸入地址之二" />
                                            </td>
                                            <td valign="top" style="padding: 5px">
                                                <form:input path="city" placeholder="請輸入城市" /><p/>
                                                <form:input path="state" placeholder="請輸入洲" /><p/>
                                                <form:input path="zip" placeholder="請輸入郵政碼" /><p/>
                                            </td>
                                            <td valign="top" style="padding: 5px">
                                                <form:input path="phone" placeholder="請輸入電話" /><p/>
                                                <form:input path="fax" placeholder="請輸入傳真" /><p/>
                                                <form:input path="email" placeholder="請輸入信箱" /><p/>
                                                <form:input path="rep" placeholder="請輸入代理人" />
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
                                        <h2 class="content-subhead">製造商資料列表</h2>
                                    </legend>
                                    <table class="pure-table pure-table-bordered">
                                        <thead>
                                            <tr>                                                
                                                <th>製造商ID</th>
                                                <th>製造商</th>
                                                <th>地址之一</th>
                                                <th>地址之二</th>
                                                <th>城市</th>
                                                <th>洲</th>
                                                <th>郵政碼</th>
                                                <th>電話</th>
                                                <th>傳真</th>
                                                <th>信箱</th>
                                                <th>代理人</th>
                                                <th></th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="rs" items="${queryResult}">
                                                <tr>                                                    
                                                    <td title="點此修改"><a href="${pageContext.request.contextPath}/mvc/manufacturer/${rs.manufacturerId}">${rs.manufacturerId}</a></td>
                                                    <td>${rs.name}</td>
                                                    <td>${rs.addressline1}</td>
                                                    <td>${rs.addressline2}</td>
                                                    <td>${rs.city}</td>
                                                    <td>${rs.state}</td>
                                                    <td>${rs.zip}</td>
                                                    <td>${rs.phone}</td>
                                                    <td>${rs.fax}</td>
                                                    <td>${rs.email}</td>
                                                    <td>${rs.rep}</td>
                                                    <td title="點此刪除"><a href="${pageContext.request.contextPath}/mvc/manufacturer/${rs.manufacturerId}" class="delete">刪除</a></td>
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