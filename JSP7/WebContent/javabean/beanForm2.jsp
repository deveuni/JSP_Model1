<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/javabean/beanForm2.jsp</h1>
	
	<!-- 아이디, 비밀번호, 좋아하는 숫자를 입력받아서 beanPro2.jsp 데이터 전달 
		
		0. com.itwillbs.bean.Javabean2 객체 생성		
		1. 파라미터값 직접 받아서 출력
		2. 자바빈 객체를 생성 -> 저장 -> 출력
		3. 액션태그를 사용해서 자바빈 객체 생성 -> 저장 -> 출력 
	
	-->
	
	<fieldset>
		<legend> 자바빈 테스트 2 </legend>
			<form action = "beanPro2.jsp" method = "post">
			아이디 : <input type="text" name ="id"><br>
			비밀번호 : <input type="password" name="pw"><br>
			좋아하는 숫자 :<input type="text" name ="num"><br>
			
			<input type="submit" value="전송">
			</form>
	
	
	
	</fieldset>

</body>
</html>