<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP6/logout.jsp</h1>
	
	<%
	
	// 로그아웃
	// 세션 객체의 정보를 초기화	
	session.invalidate();
	//session.removeAttribute("id");
	
	// 페이지 이동
	
	%>
	
	<script type ="text/javascript">
		alert("로그아웃");
		location.href = "main.jsp"; // 로그아웃이 정상적으로 작동하는지 확인하기 위해서 main으로~
									// 로그아웃하면 세션정보가 없기 때문에 main에서 설정을 해줘서 다시 로그인 페이지로 이동했당.
	
	</script>

</body>
</html>