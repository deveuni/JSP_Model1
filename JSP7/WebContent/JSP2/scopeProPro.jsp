<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
   <h1>WebContent/JSP2/scopeProPro.jsp</h1>

	<%
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
	%>
	
	아이디 : <%= id %><br>
	비밀번호 : <%= pw %><br>
	<!-- 비밀번호 : 1234 --> 
	
	
	<h4> pageContext 내장객체의 값 : <%=pageContext.getAttribute("p") %></h4>
 	<h4> request 내장객체의 값 : <%=request.getAttribute("req") %> </h4>
 	<h4> session 내장객체의 값 : <%=session.getAttribute("ses") %> </h4>
 	<h4> application 내장객체의 값 : <%=application.getAttribute("app") %> </h4>

</body>
</html>