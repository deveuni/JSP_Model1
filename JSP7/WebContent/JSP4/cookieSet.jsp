<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>Webcontent/JSP4/cookieSet.jsp</h1>
	
	<h2> 쿠키테스트 (서버) </h2>
	
	
	<%
		// 쿠키객체 생성 (HDD 저장X -> 전달 X)
		Cookie cook = new Cookie("name","CookieValue!!");
	
		// 쿠키에 필요한 설정
		// 시간설정(사용할 수 있는 시간을 지정)
		cook.setMaxAge(600); // 10분(600s) = 60 * 10	
		
		// 쿠키 정보를 저장해서 응답 : 클라이언트   <-[쿠키] 서버
		response.addCookie(cook);
	
	
	%>
	
	<script type="text/javascript">
		alert("쿠키값 생성");
		
		location.href = "cookieTest.jsp";
	</script>
	
	
	

</body>
</html>