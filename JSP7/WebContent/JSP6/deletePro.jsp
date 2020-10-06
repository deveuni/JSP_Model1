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
	<h1>WebContent/JSP6/deletePro.jsp</h1>
	
	<%
	
	   //https://docs.oracle.com/javase/8/docs/api/
	
		// 세션값(로그인 체크)
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		// id, pw 정보 전달 받아서 저장
		//id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 디비연결 -> id, pw에 해당하는 정보가 있을 때만 삭제
		
			final String DRIVER="com.mysql.jdbc.Driver";
		  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		  	final String DBID = "root";
		  	final String DBPW = "1234";
		
		  	Class.forName(DRIVER);
		  	
		  	Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		  	
		  	String sql = "select pw from itwill_member where id=? ";
		  	
		  	PreparedStatement pstmt = con.prepareStatement(sql);
		  	
		  	pstmt.setString(1,id);
		  	
		
		  	ResultSet rs = pstmt.executeQuery();
		  	System.out.println("삭제완료");
		  	
		  	// 삭제 완료시 main.jsp 페이지로 이동
		  	if(rs.next()){
		  		if(pw.equals(rs.getString("pw"))){
		  	
		  	sql = "delete from itwill_member where id=?";
		  	pstmt = con.prepareStatement(sql);
		  	pstmt.setString(1,id);
		  	pstmt.executeUpdate();
		  	
		  	// 삭제시 세션의 정보도 삭제(로그인정보)
		  	session.invalidate();
		  	
		  	response.sendRedirect("main.jsp");
		  		}else{
		  		//비밀번호 다름 %>
					<script type ="text/javascript">
						alert("비밀번호 오류! 수정불가!");
						history.back();
					</script>
				<% 	}
				}else{ // 아이디 없음-- 아이디 세션이 없으면 무조건 로그인으로 가기 때문 그닥 불필요%>
				
				<script type ="text/javascript">
						alert("비회원입니다.");
						history.back();
					</script>
				<%} %>
		  	
			
		
		
	
	
			
	
	
	
	

</body>
</html>