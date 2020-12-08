<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>title</title>
<%
String section = request.getParameter("section") != null ? request.getParameter("section") : ""; 
%>
</head>
<body>
    <%@include file="static/header.jsp" %>
    <%@include file="static/nav.jsp" %>
    
    <%
    switch(section) {
    case "insert":
        %><%@include file="page/insert.jsp" %><%
        break;
    case "total_select":
        %><%@include file="page/total_select.jsp" %><%
        break;
    case "product_select":
        %><%@include file="page/product_select.jsp" %><%
        break;
    case "category_select":
        %><%@include file="page/category_select.jsp" %><%
        break;
    default:
        %><%@include file="static/index.jsp" %><%
    }
    %>
    
    <%@include file="static/footer.jsp" %>
</body>
</html>