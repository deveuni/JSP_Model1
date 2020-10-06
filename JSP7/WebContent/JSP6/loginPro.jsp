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
	<h1>WebContent/JSP6/loginPro.jsp</h1>
	
	
	<%
	
	 	request.setCharacterEncoding("UTF-8");
		
		// 정보저장
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");

		System.out.println("id: "+id);
		System.out.println("pw: "+pw);
		
		// DB로 이동해서 해당 정보의 회워이 있는지 판단 
			final String DRIVER="com.mysql.jdbc.Driver";
		  	final String DBURL = "jdbc:mysql://localhost:3306/jspdb";
		  	final String DBID = "root";
		  	final String DBPW = "1234";
		  	//드라이버 로드 
		  	Class.forName(DRIVER);
			System.out.println("로드성공공");
			//디비연결
			Connection con = DriverManager.getConnection(DBURL, DBID, DBPW);
			System.out.println("디비연결성공공");
			// SQL 구문 작성(select) & pstmt 객체 생성
			// 회원정보가 있는지 없는지 판단
			// 회원 고유 정보가 있으면 -> 회원
			// 회원 고유 정보가 없으면 -> 비회원
			String SQL = "select pw from itwill_member where id=?" ; // 고유한 값을 where조건으로! 
			
			PreparedStatement pstmt = con.prepareStatement(SQL);
			
			pstmt.setString(1,id);
			
			
			// 실행 -> rs 저장
			 ResultSet rs = pstmt.executeQuery();
			
			// 데이터 처리
			// 회원인가
			// -> 비밀번호 체트 O => 로그인 + main 페이지로 이동, id값으로 세션 객체 생성 
			//              X => 에러("비밀번호오류") + 뒤로가기
			// 회원 아닌가 => 에러("비회원입니다.") + 뒤로가기
			
			
			if(rs.next()){
				//회원일 때 (아이디에 해당하는 비밀번호가 있을 때)
				 // id 고유한값이니까 여러번 비교할 필요 xx
					if(pw.equals(rs.getString("pw"))){
						// 아이디가 있으면서 비밀번호 같은 경우 
						session.setAttribute("id",id );// 로그인 성공했을 때 어디서든 아이디 값을 가지고 다님.
						
						// 페이지 이동 - 문제 없이 다른 페이지로 넘어가기 때문에, 자바스크립트는 다른 실행 다 한 뒤에 이동하므로,, 가능하면 자바코드로!
						response.sendRedirect("main.jsp"); 
						System.out.println("로그인 성공");
						
					}else{
						// 아이디 같으면서 비밀번호 다름.
						
				%>
					 <script type = "text/javascript">
							alert("비밀번호 오류");
							//history.back(); // 이전에 처리 했던 아이디 정보가 남아있음. 사용자 편의를 위해서 
							location.href = "loginForm.jsp"; // 다를 것 없지만, 이 방법은 이전에 처리했던 정보가 남아있지 않음.
						</script> 
				 	
				<% 	}	
					
				
				 }else{
					//회원 아닐 때 (아이디에 해당하는 비밀번호가 없을 때)
				 %>
				<script type = "text/javascript">
				//confirm();
				// 비회원일 때 ->"비회원입니다. 회원가입 하시겠습니까?"
				// yes -> 회원가입창으로 이동(insertForm.jsp)
				// no -> 페이지 뒤로가기
				var result = confirm("비회원입니다. 회원가입 하시겠습니까?");
				if(result){
					location.href = "insertForm.jsp";
				}else{
					history.back();
				}
				
				
			</script>
			<% 	
			}
			
			
			
			
			
		
	%>

</body>
</html>