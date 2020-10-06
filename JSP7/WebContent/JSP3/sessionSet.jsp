<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>WebContent/JSP3/sessionSet.jsp</h1>
 <h2>세션값을 생성하는 페이지</h2>
 
 <%
 	// 세션값 생성
 	session.setAttribute("val","세션값 있음");
 
 	session.setAttribute("name","홍길동");
 	
 %>

	<script type ="text/javascript">
		alert("세션값 생성 완료!");
		location.href="sessionTest.jsp";
	</script>


</body>
</html>