<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP2/Test1.jsp</h1>

	<%
	
		/*  
		영역 객체(Scope), 속성(Attribute) p209~
		
		내장객체(8+1) 중에서 해당 유효한 범위 안에서 데이터를 서로 공유할 수 있는 객체
		이때, 그 공유되는 범위를 '영역(Scope)'라고 한다. 그때의 공유되는 값을 '속성(Attribute)'라고 한다.
		
			[영역]			[영역처리 객체]
			page			pageContext	
			request			request
			session			session
			application		application
			
			- page영역 : 해당 페이지가 클라이언트에 정보를 제공하는 동안 
				=> pageContext 객체 : JSP페이지 정보를 저장하는 객체
				   (다른 내장객체를 호출, 페이지 흐름제어, 에러데이터 처리...)
			
			- request영역 : 클라이언트 요청이 처리되는 동안 (여러개의 페이지를 이동할 때 정보를 저장해서 사용)
				=> request 객체 : 페이지 요청시 정보를 처리하는 객체 (페이지 이동시 처리)
				
			- session영역 : 세션이 유지되는 동안 (브라우저당 세션 1개씩 생성(30분짜리))
				=> session 객체 : 하나의 웹브라우저가 정보를 유지하기 위한 시간동안 사용되는 객체
					(사용자 인증처리)
					
			- application영역 : 웹 애플리케이션이 실행되고 있는 동안 (서버가 실행될 때)
				=> application 객체 : 웹 애플리케이션의 Context 정보를 처리하는 객체
				    (서버의 설정정보, 자원에 대한 정보, 애플리케이션실행 될 때 발생하는 이벤트 정보)
				    (홈페이지 방문자수 카운트, ...)
				    
			* 속성(Attribute)를 저장해서 사용
			 [해당 영역 객체].setAttribute("이름, 값");
					
			 [해당 영역 객체].getAttribute("이름");		
			
		*/
		
  %>



</body>
</html>