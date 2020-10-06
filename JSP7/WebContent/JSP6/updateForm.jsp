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
	<h1>WebContent/JSP6/updateForm.jsp</h1>
	
	<%
		// 로그인 여부를 체크 (로그인X -> 로그인 페이지로 이동)
		
		String id = (String)session.getAttribute("id");
	
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
		
		// DB연결 -> 로그인한 사용자의 정보를 가져오기
		
		final String DRIVER="com.mysql.jdbc.Driver";
	  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	  	final String DBID = "root";
	  	final String DBPW = "1234";
	  	
	  	//드라이버로드
	  	Class.forName(DRIVER);
	  	
	  	// 디비연결
	  	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
	  	
	  	// 구문작성 & 객체생성
	  	String sql = "select * from itwill_member where id=?";
	  	
	  	PreparedStatement pstmt = con.prepareStatement(sql);
	  	
	  	pstmt.setString(1,id);
	  	
	  	//실행
	  	ResultSet rs = pstmt.executeQuery();
		
	  	// 정보 가져오기
	  	//String pw = "";
	  	String name = "";
	  	int age = 0;
	  	String gender ="";
	  	String email ="";
	  	Timestamp reg_date = null; 
	  	
	  	
	  	
		if(rs.next()){
			
			rs.getString("id");
			//pw = rs.getString("pw");
			name = rs.getString("name");
			age =rs.getInt("age");
			gender = rs.getString("gender");
			email = rs.getString("email");
			reg_date = rs.getTimestamp("reg_date");
			
		}
		
		// 성별 입력이 안되면 기본적으로 남자선택하게 함.
		if(gender == null){
			gender ="남";
		}
		
		
		
	  	
		// => 화면에 출력(각각의 요소에 담아주기)
			
	%>
	
	
	
	<h1> 회원 정보 수정 </h1>
 	<fieldset>
	 	<legend>정보수정</legend>
	 		<form action="updatePro.jsp" method="post" name="fr">
	 		아이디 : <input type="text" name="id" value = "<%=id%>" readonly><br> 
	 		비밀번호 : <input type="text" name ="pw" ><br>
	 		이름 : <input type="text" name="name" value = "<%=name%>"><br>
	 		나이 : <input type="text" name="age"value = "<%=age%>"><br>
	 		성별 : <input type ="radio" name="gender" value="남"
	 				<% if(gender.equals("남")){ %>
	 				checked
	 				<% } %>
	 				>남
	 			 <input type="radio" name ="gender" value="여"
	 			 	<% if(gender.equals("여")){ %>
	 				checked
	 				<% } %>
	 			 >여<br>
	 		이메일 : <input type="text" name="email" value = "<%=email%>"><br>	
	 		
	 		<input type="submit" value="정보수정하기"> 
	 		</form>
	 </fieldset>


<!--  
  disabled 는 태그 자체를 못쓰게 만들어서 아이디 정보를 가져가지 못함. 따라서  정보 가져가려면 readonly 쓰기~
 -->




</body>
</html>