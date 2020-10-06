<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP5/updateForm.jsp</h1>
	
	<!--  
		수정할 사람의 정보를 입력 받아서 (나이, 성별)
		정보 수정
		 * 수정하는 사람의 이름, 주민번호를 입력받아서 동일한 사람인 경우만 수정
		      동일한 사람이 아닌 경우, 수정처리 X
	 -->
	  <fieldset>
	 	<legend>정보수정</legend>
	 		<form action="updatePro.jsp" method="post">
	 		<h4>본인 확인 정보</h4>
	 		이름 : <input type="text" name="name"><br>
	 		주민번호 : <input type="text" name="ju1">-<input type="text" name="ju2"><br><br>	
	 		<hr>
	 		<h4>수정할 정보</h4>
	 		나이 : <input type="text" name="age"><br>
	 		성별 : <input type ="radio" name="gender" value="남">남
	 			 <input type="radio" name ="gender" value="여">여<br>
	 		
	 		
	 		<input type="submit" value="정보수정하기"> 
	 		</form>
	 </fieldset>

</body>
</html>