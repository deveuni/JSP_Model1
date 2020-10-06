<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor="orange">
	<h1>WebContent/JSP2/top.jsp</h1>
	<h2>안녕하세요</h2>
	
	<%
		String name = request.getParameter("name");
	%>
	
	<%= name %>님 환영합니다.

</body>
</html>