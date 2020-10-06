<%@page import="java.sql.Timestamp"%>
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

 <%
	 	// 회원의 로그인 여부를 판단(로그인페이지로 이동)
	 	String id =(String)session.getAttribute("id");
	 	
	 	final String DRIVER="com.mysql.jdbc.Driver";
	  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	  	final String DBID = "root";
	  	final String DBPW = "1234";
	 	
	 	// DB로 이동해서 정보를 가져오기 
	 	// 1. 드라이버 로드
	 	
	 		Class.forName(DRIVER);
	 	System.out.println("드라이버 로드");
	 	// 2. 디비연결
	 	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	 	System.out.println("디비연결");
	 	// 3. 쿼리 작성(select) & 객체 생성
	 	
	 	String sql = "select * from itwill_member where id=? ";
	 	
	 	PreparedStatement pstmt = con.prepareStatement(sql);
	 	
	 	pstmt.setString(1,id);
	 	
	 	// 4. 실행 -> 결과를 저장 (rs) 
	 	
	 	ResultSet rs = pstmt.executeQuery();
	 	// 5. 검색결과 사용하기 -> 테이블 생성후 추가 
	 	// 메인 페이지로 이동 버튼/링크
	 	
	 	//String id = ""; 위에 세션 가져올 때 이미 만들어 놓음.
	 	String name = "";
	 	int age = 0;
	 	String gender = "";
	 	String email = "";
	 	Timestamp reg_date = null;
	 	
	 	if(rs.next()){
	 		// 디비정보 가져오기 -> 화면에 출력 
	 		rs.getString("id");
	 		name = rs.getString("name");
	 		age = rs.getInt("age");
	 		gender = rs.getString("gender");
	 		email = rs.getString("email");
	 		reg_date = rs.getTimestamp("reg_date");
	 		
	 	}
	 	
	 	%>
	 	
	 	<table border="1">
	 		<tr>
	 		 <td colspan ="2">회원정보</td>
	 		 
	  		</tr>
	  		<tr>
	 		 <td>아이디</td>
	 		 <td><%=id %></td>
	  		</tr>
	  		<tr>
	 		 <td>이름</td>
	 		 <td><%=name %></td>
	  		</tr>
	  		<tr>
	 		 <td>나이</td>
	 		 <td><%=age %></td>
	  		</tr>
	  		<tr>
	 		 <td>성별</td>
	 		 <td><%=gender %></td>
	  		</tr>
	  		<tr>
	 		 <td>이메일</td>
	 		 <td><%=email %></td>
	  		</tr>
	  		<tr>
	 		 <td>시간</td>
	 		 <td><%=reg_date %></td>
	  		</tr>
	 	</table>
	 	
	 	<input type="button" value ="main페이지로 이동" onclick="location.href ='main.jsp'">
	 
</body>
</html>