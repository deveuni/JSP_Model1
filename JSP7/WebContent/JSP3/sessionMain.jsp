<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP3/sessionMain.jsp</h1>
	
	<!-- session 객체 안에 ID정보(로그인정보)가 있을 경우
		"ㅇㅇㅇ님 환영합니다" 메세지 출력
	  -->
	  
	  
	 <%
	  String id =(String)session.getAttribute("ID");
	 
	 if( id == null){ //로그아웃했다
		 response.sendRedirect("sessionLoginForm.jsp"); 
	 }

	 %> 
	 
	 <h3><%=id %>님 환영합니다!</h3>
	 
	 <!--  로그아웃 버튼 생성 후 로그아웃 기능 처리  -->
	 
	 <input type = "button" value ="로그아웃" onclick ="location.href='sessionLogout.jsp'">
	 

	 

</body>
</html>