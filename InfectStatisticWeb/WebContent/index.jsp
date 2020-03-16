<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
<%
    RequestDispatcher requestDispatcher = request.getRequestDispatcher("dateServlet");//先处理首页的数据例如日期还有人数
    requestDispatcher.include(request, response);
%>
</body>
</html>
