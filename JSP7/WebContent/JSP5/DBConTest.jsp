<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
	// 기본적으로 사용가능한 클래스 
	// -> 직접 구현해서 접근가능한 범위에서 만들어 놓은 클래스 
	// -> Java 활용도가 높은 클래스를 패키지 추가 없이 사용가능하도록 만들어 놓은 클래스 
	//    => String => java.lang.*; 자바에서 제공하는 기본 패키지
	//    => 패키지 추가없이 사용 가능(import)
	
	// * 기본제공되는 클래스가 아닌 경우, 클래스가 있는 패키지를 추가해야함(import)
	
	
	
	
	// import java.lang.String; 
	String s;
	




%>    
    
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP5/DBConTest.jsp</h1>
	
	<%
		// 라이브러리를 사용해서 DB(mysql)접근
		
		// JDBC(자바데이터베이스커넥션) 드라이버를 설치
		// 해당 파일을 다운로드 받아서 
		// /WEB-INF/lib/mysql-connector-java-5.1.49-bin
		
		// 1단계. 드라이버를 로드
		Class.forName("com.mysql.jdbc.Driver");
	
		System.out.println("드라이버 로드 성공!!");
	
		// 2단계. DB연결 - connection +java 연결
	    Connection con = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/jspdb",
				"root",
				"1234");
		
		System.out.println("디비연결 성공!!");
		
		
	%>
	
	<h2>연결성공! <%=con %></h2>
	

</body>
</html>