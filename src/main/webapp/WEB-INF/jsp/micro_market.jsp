<%-- 
    Document   : micro_market
    Created on : 2019/12/26, 下午 08:43:17
    Author     : study
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                    <h1>Micro Market</h1>
                    <h2>A subtitle for your page goes here</h2>
                </div>

                <div class="content">
                    <h2 class="content-subhead">${queryResult}</h2>
                </div>
            </div>
        </div>
    </body>
</html>