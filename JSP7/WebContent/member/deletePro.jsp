<%@page import="com.itwillbs.db.MemberDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<h1>WebContent/member/deletePro.jsp</h1>

	<%
		String id = (String)session.getAttribute("id");
		if(id == null){
			response.sendRedirect("loginForm.jsp");
		}
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		
		// 삭제할 비밀번호 가져오기 
		
		String pw = request.getParameter("pw");
		
		// MemberDAO 객체 생성 -> deleteMember(id,pw);
		
		MemberDAO mdao = new MemberDAO();
		
		// 결과를 리턴 ( 1=> 정상처리, 0 => 비밀번호 오류, -1 => 아이디가 없음)
		
		// 해당 데이터 처리 후 이동
	
		 int result = mdao.deleteMember(id, pw);
		
		if(result == 1){
			
			session.invalidate();
			%>
				<script type ="text/javascript">
					alert("탈퇴성공");
					location.href = "main.jsp"; // 세션 제거 했기 때문에 main에서 바로 회원가입 페이지로~
				</script>
			
			<% 
			
		}else if(result == 0){
			%>
			<script type ="text/javascript">
				alert("비번오류");
				history.back();
			</script>
		
		<% 
			
		}else{
			%>
			<script type ="text/javascript">
				alert("아이디 없음");
				history.back();
			</script>
		
		<% 
			
			
		}
	
	%>


</body>
</html>