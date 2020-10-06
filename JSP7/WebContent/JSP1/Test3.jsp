<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/Test3.jsp</h1>
	
	<h2> JSP 내장 객체(p177~) </h2>
	서블릿(JSP -> JAVA)실행할 때 필요한 정보를 저장하고 있는 객체<br>
	따로 객체를 생성하거나, import를 사용해서 추가할 필요가 없음<br>
	
	<h4>javax.servlet 패키지 - 8가지</h4>
		- request : 클라이언트의 Http 요청 정보를 저장하는 객체<br> 
		- response :  Http 요청을 처리하는 응답 정보를 저장하는 객체 <br> 
		- session : 클라이언트의 세션 정보를 저장하는 객체 <br>
		- pageContext : 페이지가 실행할 때 필요한 컨텍스트 정보 저장 객체<br>
		- out : 응답페이지에 전송하기 위한 출력 스트림 객체<br>
		- application : 해당 애플리케이션(응용프로그램)의 정보를 저장한 객체<br>
		- config : 페이지의 서블릿 설정(초기화 정보) 정보를 저장한 객체<br>
		- page : 페이지의 서블릿 객체<br>
	
	
	<h4>java.lang 패키지 - 1가지</h4>
		- exception : 예외처리 객체<br>
	
	<hr>	
		
		
	<h2> request 객체 </h2>
	<h4> HttpServeltRequest 클래스를 객체로 구현함.
		 'request' 이름(참조변수)으로 사용함.
	</h4>
	<!--  
		var 참조변수 = new 객체();
	 -->	
	<hr>
	서버 도메인명 : <%= request.getServerName() %><br>
	서버 포트번호 : <%= request.getServerPort() %><br>
	URL : <%= request.getRequestURL() %> <br>
	URI : <%= request.getRequestURI() %><br>
	
	클라이언트 호스트명 : <%= request.getRemoteHost() %><br>
	클라이언트 IP주소 : <%= request.getRemoteAddr() %><br>
	
	프로토콜 정보 : <%= request.getProtocol() %><br>
	요청정보 방식(전송방식) : <%= request.getMethod() %><br>
	
	컨텍스트 경로(프로젝트 경로) : <%= request.getContextPath() %><br>
	물리적 경로 : <%= request.getRealPath("/") %><br>
	
	http 헤더(user-agent) : <%= request.getHeader("user-agent") %><br>
	http 헤더 (accept-language) : <%=request.getHeader("accept-language") %><br>
	http 헤더 (host) : <%=request.getHeader("host") %><br>
	http 헤더 (connection) : <%=request.getHeader("connection") %><br>
	
	<h2> response 객체 (응답처리) </h2>
	<%
		// response.setHeader("해더이름", 값);
		// response.addCookie("쿠키값");
		// response.setContentType("타입");
		// response.sendRedirect("주소");
		
		// 페이지 이동
		// response.sendRedirect("http://www.naver.com");
	%>
	
	<h2> session 객체 </h2>
	세션 ID : <%= session.getId() %><br>
	세션 생성 시간 : <%= session.getCreationTime() %><br>
	세션 최종 접속시간 : <%= session.getLastAccessedTime() %><br>
	세션 유지 시간(1800초, 30분) : <%= session.getMaxInactiveInterval() %><br>
	<%
	// 세션 유지시간 변경 : 30분 -> 60분
	session.setMaxInactiveInterval(3600);
	%> 
	세션 유지 시간(3600초, 60분) : <%= session.getMaxInactiveInterval() %><br>
	
	<h2> application 객체 </h2>
	
	서버정보 : <%= application.getServerInfo() %><br>
	물리적경로: <%= application.getRealPath("/") %> <br>
	
	<h2> out 객체 </h2>
	<%
		out.print("out객체 사용<br>");
	%>
	
	<%
		out.close(); // 자원해제
	%>
	
	<%-- 버퍼 사이즈 : <%= out.getBufferSize() %>BYTE<br>
	사용 후 남은 버퍼사이즈 : <%= out.getRemaining() %>BYTE<br>--%>
	
	
	
	
	
	
	

</body>
</html>