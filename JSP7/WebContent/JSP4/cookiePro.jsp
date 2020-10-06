<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP4/cookiePro.jsp</h1>
	<!-- 
		cookieForm.jsp 페이지에서 선택된
		라디오 버튼의 값을 콘솔창에 출력
	 -->
	 
	 <%
	  System.out.println("라디오 버튼값 : "+request.getParameter("language"));
	 // 쿠키값 생성(객체생성)
	 Cookie cook = new Cookie("lang",request.getParameter("language"));
	 // 쿠키 사용시간 설정
	 cook.setMaxAge(3600); // 3600s = 1h
	 // 쿠키를 저장해서 클라이언트로 전달
	 response.addCookie(cook);
	 
	 // 페이지이동
	 %>
	 
	 <script type="text/javascript">
	 alert("쿠키값 생성");
	 location.href = "cookieForm.jsp";
	 
	 </script>

</body>
</html>