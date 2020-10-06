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
	<h1>WebContent/JSP6/updatePro.jsp</h1>
	
	
	<%
		// 로그인 여부 체크
		// -> 로그인 x -> 로그인 페이지 이동
		
		String id = (String) session.getAttribute("id");
		
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		
		// 한글처리
		
		request.setCharacterEncoding("UTF-8");
		
		// 전달된 정보를 저장
		// 아이디, 비밀번호, 이름, 나이, 성별, 이메일 
		
		 id = request.getParameter("id");
		String pw =	request.getParameter("pw");
		String name = request.getParameter("name");
		int age = Integer.parseInt(request.getParameter("age"));
		String gender = request.getParameter("gender");
		String email = request.getParameter("email");
		
		
		// DB 연결 -> 수정
		final String DRIVER="com.mysql.jdbc.Driver";
	  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
	  	final String DBID = "root";
	  	final String DBPW = "1234";
		
		
		// 1. 드라이버 로드
		
		Class.forName(DRIVER);
		
		// 2. 디비연결
		
		Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
		
		// 3. 구문작성, 객체 생성 (수정하고자 하는 사람의 정보가 있는 지 판단)
		
		String sql = "select pw from itwill_member where id=?";
				
		PreparedStatement pstmt = con.prepareStatement(sql);
		
		pstmt.setString(1,id);
		
		
		// 4. 실행 -> rs
		
		ResultSet rs = pstmt.executeQuery();
		// 5. 데이터 처리 
		
		//    -> 본인일 때 (아이디 비밀번호 동일) 정보 수정 (이름, 나이, 성별, 이메일)
		//    -> 비밀번호 오류, 아이디가 없는 회원 => 에러메세지 처리 
		
		// 수정완료 후 main페이지로 이동
		
		
		if(rs.next()){ // 아이디 있음
			if(pw.equals(rs.getString("pw"))){//비밀번호같음
				sql = "update itwill_member set name=?, age=?, gender=?, email=? "
						+"where id=?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1,name);
				pstmt.setInt(2,age);
				pstmt.setString(3,gender);
				pstmt.setString(4,email);
				pstmt.setString(5,id);
				
				// 실행
				pstmt.executeUpdate();
				System.out.println("수정완료!");
				
				response.sendRedirect("main.jsp");
				
			}else{//비밀번호 다름 %>
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