<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/TestForm1.jsp</h1>

	<!-- 페이지 이동시 데이터 가지고 이동  -->
	
	<fieldset>
	 <legend> 정보 전달</legend>
	   
	   <form action="TestPro1.jsp" method ="get" name = "fr">
		숫자 : <input type="text" name="num"><br>
		
		<input type="submit" value="전송">
	
	
	</form>
	</fieldset>

</body>
</html>