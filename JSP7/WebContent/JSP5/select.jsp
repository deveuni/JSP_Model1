<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSp5/select.jsp</h1>
	
	<%
		// 저장되어있는 모든 회원의 정보를 출력
		
		// 1. 드라이버 로드
		// 2. 디비연결
		// 3. sql 구문 작성 & pstmt 객체 생성
		
		final String DRIVER="com.mysql.jdbc.Driver";
  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
  	final String DBID = "root";
  	final String DBPW = "1234";
  	
 	// 1. 드라이버 로드
  	Class.forName(DRIVER);
	System.out.println("로드성공!");
	
    // 2. DB 연결
	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	
	System.out.println("연결!");
	
	// 3. sql 구문 작성 & pstmt 객체 생성
	String sql = "select * from itwill_member";
	
	PreparedStatement pstmt = con.prepareStatement(sql);
	
	//4. 실행
	// select 구문의 결과 => 레코드셋 데이터를 ResultSet 타입으로 저장 
	ResultSet rs = pstmt.executeQuery();
	
	while(rs.next()){ // 데이터가 존재할 때 실행
		
		// 테이블에서 값을 가져올 때 사용 
		// rs.getXXXX("필드명") / rs.getXXXX(인덱스번호)
		// => 디비 테이블의 값에 따라서 이름이 변경
		// * 인덱스번호를 가지고 데이터를 가져오는 방법이 처리 속도가 빠름
		
		//이름
		System.out.println("이름 : "+rs.getString("name"));
		System.out.println("이름2 : "+rs.getString(2)); // name값
		//나이
		System.out.println("나이 : "+rs.getInt("age"));
		//성별
		System.out.println("성별 : "+rs.getString("gender"));
		//주민번호
		System.out.println("주민번호 : "+rs.getString("jumin")); 
		// 테이블 생성해서 출력
		System.out.println("----------------------------------");
		
	}
	
	
	%>




</body>
</html>