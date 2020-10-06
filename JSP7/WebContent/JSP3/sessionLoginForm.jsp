<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/JSP3/sessionLoginForm.jsp</h1>
	
	<!-- 
		아이디, 비밀번호 입력 처리
		sessionLoginPro.jsp 페이지에서 정보를 전달 받아서 처리
		 DBID = "admin", DBPW = 1234 값을 기준으로 로그인 처리
		   -->
	<fieldset>
		<legend>회원가입</legend>
			<form action ="sessionLoginPro.jsp" method ="post" >
			아이디 : <input type="text" name = "id" ><br>
			비밀번호 : <input type = "text" name="pw" ><br>
			
			<input type ="submit" value="로그인">
			
			</form>
	</fieldset>		   
		   

</body>
</html>