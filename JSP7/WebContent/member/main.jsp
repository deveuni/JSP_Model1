<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1>WebContent/member/main.jsp</h1>

<%
	//메인페이지는 로그인 없이 이동할 수 없는 페이지 
	// 로그인 없이 접근할 경우 -> 로그인 페이지로 이동 
	
     String id = (String)session.getAttribute("id");
	if(id == null){
		response.sendRedirect("loginForm.jsp");
	}
	

%>

	<h3>로그인 : <%=id %></h3>

	<input type ="button" value="로그아웃" onclick="location.href='logout.jsp'">	

<hr>
	
	<h3><a href ="memberInfo.jsp"> 회원 정보 조회 </a></h3>
	
	<hr>
	<h3><a href="updateForm.jsp"> 회원정보 수정 </a></h3>
	
	<hr>
	<h3><a href="deleteForm.jsp"> 회원정보 삭제(탈퇴) </a></h3>
	
	
	<hr>
	<h3><a href="../board/boardList.jsp"> ITWILL 게시판 </a></h3>
	
	<%
	  //if(id != null){ // 아이디가 null이게 되면 비교자체가 안되기 때문에! 가능.
		if(id != null && id.equals("admin")){ // 연산할 때는 순서가 중요하다!! 확실하게 하기 위해 첫번째 방법씀
	
	%>
	
	<hr>
	<h3><a href="memberList.jsp"> 회원 전체 목록(관리자) </a></h3>

	<%
		}
	  //}
	%>

</body>
</html>