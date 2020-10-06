<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>cookieSet.jsp</h1>

<%
	// 쿠키 객체 생성
	Cookie cook = new Cookie("name","CookieValue");

	cook.setMaxAge(600);
	
	response.addCookie(cook);

%>
<script type="text/javascript">
alert("쿠키생성");
location.href = "cookieTest.jsp";

</script>


</body>
</html>