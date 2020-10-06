<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>WebContent/JSP1/TestForm3.jsp</h1>
 
 <!-- 
 	사용자 이름, 
 	성별(radio), 
 	학년(select)-1,2,3학년, 
 	취미(checkbox)- 게임, 영화, 운동 
 	
 	위 정보를 입력받아서 TestPro3.jsp 페이지에서 정보 처리
 	-->
	<fieldset>
		<legend>정보전달하기</legend>
		 <form action="TestPro3.jsp" method="get" name="fr">
		 
		 이름: <input type="text" name="name"><br>
		 성별: <input type="radio" name="gender" value="남">남 
		      <input type="radio" name="gender" value="여">여<br>
		 학년: <select name="sel">
		 		<option value="">선택하세요.</option>
		 		<option value="1">1학년</option>
		 		<option value="2">2학년</option>
		 		<option value="3">3학년</option>
		     </select> <br>     
		 취미: <input type="checkbox" name ="hobby" value="게임">게임  
		 	  <input type="checkbox" name ="hobby" value="영화">영화
		 	  <input type="checkbox" name ="hobby" value="운동">운동 <br> 
		      
		      <input type="submit" value="정보전달">
		      <input type="reset" value="초기화">
		 
		 
		 
		 
		 </form>
	
	
	
	
	</fieldset>



</body>
</html>