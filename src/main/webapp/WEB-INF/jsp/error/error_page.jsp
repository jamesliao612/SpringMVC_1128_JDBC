<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!doctype html>
<html>
    <head>
        <%@include file="../fragment/head.jspf" %>
    </head>
    <body>
        <div id="layout">
            <!-- Menu -->
            <%@include file="../fragment/menu.jspf" %>
            <!-- Body -->
            <div id="main">
                <div class="header">
                    <h1>發生錯誤</h1>
                </div>

                <div class="content">
                    <h2 class="content-subhead">${errorMessage}</h2><p/>
                    <h2 class="content-subhead">請聯絡我們:0912123123</h2>
                </div>
            </div>
        </div>
    </body>
</html>