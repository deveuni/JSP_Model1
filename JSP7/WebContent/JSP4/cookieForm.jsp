<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!--  
		폼태그 안에 있는 라디오 버튼의 값에 따라서 
		출력되는 메세지 변경
		한국어(kor) : "안녕하세요 쿠키연습!"(화면)
		영어(eng) : "Hello Cookie Test!"(화면)	
		
		* pro페이지에서 라디오버튼의 값(value)를 쿠키값으로 지정
		  form페이지에서 쿠키 값에 따라 출력 메세지 변경
		
	 -->
 <%
	 String lang = ""; // 기본값을 한국어로 하고싶으면 "kor";로 설정
	 	
		// 쿠키정보 가져오기(배열)
	  Cookie[] cookies = request.getCookies();
	 
	 	
	 	if(cookies != null){
	 		for(int i=0; i<cookies.length; i++){
	 			// 쿠키값이 "lang" 대상의 값
	 			if(cookies[i].getName().equals("lang")){
	 				lang = cookies[i].getValue();
	 			}
	 		}
	 	}
	 
	 	// 라디오 버튼의 값(쿠키값)을 기준으로 메세지 출력
	 	if(lang.equals("kor")){
	 		out.print("안녕하세요 쿠키연습!");
	 	}else{
	 		out.print("Hello Cookie Test!");
	 	}
	 	
	 %>
	

	<h1>WebContent/JSP4/cookieForm.jsp</h1>
	
	<form action= "cookiePro.jsp" method="post">
		<input type="radio" name ="language" value="kor" 
			   <% if(lang.equals("kor")){ %>
			   checked 
			   <%} %>
			   > 한국어
		<input type="radio" name ="language" value="eng"
			   <% if(lang.equals("eng")){ %>
			   checked 
			   <%} %>
	     	   > 영어
		<input type="submit" value="언어설정">
	</form>
	
</body>
</html>