<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP4/cookieTest.jsp</h1>

	<!-- 세션(session) : 서버쪽에서 저장되어 관리되는 정보 -->
	<!-- 쿠키(cookie) : 클라이언트쪽에서 저장되어 관리되는 정보 (p279~) -->
	<!-- 브라우저가 종료되어도 상관없이 사용 가능(하드디스크에 저장)
		  보안에 취약, 로그인(아이디 저장)
		  
		  * 이름, 값, 유효기간, 도메인(주소), 경로 ... 포함하고 있음
		  * 쿠키의 이름은 알파벳, 숫자의 조합으로 생성됨(공백, 괄호, 등호, 콤마, 세미콜론, ... => 인코딩필요) 
	 -->
	 
	 <!-- 
	 	[페이지 요청시]
	 	클라이언트   <->  서버
	 	
	 	[페이지 요청후]
	 	클라이언트              서버
	  -->

	 <!-- 
	 	[쿠키 사용]
	 	[페이지 요청시]
	 	클라이언트   ->  서버
	 	클라이언트   <-[쿠키] 서버
	 
	 	[페이지 요청후]
	 	클라이언트              서버
	 	[쿠키]
	 	
	 	[다시 페이지 요청시]
	 	클라이언트	[쿠키] -> 서버
	 	 [쿠키]
	 	 
	 	 
	 	 * 쿠키 사용(서버)
	 	 1) 쿠키 객체를 생성
	 	 2) 쿠키에 필요한 설정을 지정(유효시간, 설명, 도메인, ...)
	 	 3) 웹브라우저에 (클라이언트 요청) 생성된 쿠키를 전달
	 	 
	 	 * 쿠키 사용(브라우저)
	 	 1) 웹 브라우저에서 요청시 쿠키 정보를 가져옴
	 	 2) 쿠키값 (이름, 값) 쌍으로 만들어진 배열
	 	 3) 쿠키값의 이름을 사용해서 쿠키 객체를 사용 
	  -->
	  
	  <%
	  	// 쿠키정보 가져오기 
	  	Cookie[] cookies = request.getCookies();
	  
	  String name = "";
	  String value = "";
	  
	  
	  	// 쿠키 값 사용
	  	if(cookies != null){
	  		// 쿠키 배열의 모든 요소에 접근
	  		for(int i=0; i<cookies.length; i++){
	  			if(cookies[i].getName().equals("name")){
	  				// 쿠키의 이름이 "name"인 값
	  				name = cookies[i].getName();
	  				value = cookies[i].getValue();
	  			}
	  		}
	  		
	  	}
	  
	  
	  
	  %>



	<h1>쿠키값 테스트(클라이언트)</h1>
	
	<h3>쿠키값(이름) : <%=name %></h3>
	<h3>쿠키값(값) : <%=value %></h3>
	
	
	
	
	<!-- 페이지 요청(쿠키정보를 요청) -->
	<input type = "button" value = "쿠키값 저장"
		onclick ="location.href='cookieSet.jsp'"
	>
	
	<!-- 쿠키정보 삭제 -->
	<input type = "button" value = "쿠키값 삭제"
		onclick ="location.href='cookieDel.jsp'"
	>





</body>
</html>