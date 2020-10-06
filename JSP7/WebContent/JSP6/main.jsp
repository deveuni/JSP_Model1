<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP6/main.jsp</h1>
	
	<!-- 
		아이디, 비밀번호, 이름, 나이, 성별, 이메일 정보를 저장해서 
		회원 관리를 하는 프로그램 작성
	 -->
	 
	 <!-- 
	 	회원가입 -> 회원가입 완료 -> 로그인 -> 메인페이지 
	 -->
	 
	 <!-- 메인페이지는 로그인한 사람만 접근 가능 
	 	로그인 안한 사람은 다시 로그인 페이지로 이동 
	 -->
	 
	 <!-- 로그인 아이디 : ooo님 환영합니다. -->
	 
	 	 <!--  
	  	로그인한 회원정보를 출력하는 페이지 
	 		(비밀번호를 제외한 모든 정보 출력)
	 -->
	
	 
	 
	 <%
	 
	 String id = (String)session.getAttribute("id");
	 // 오브젝트를 스트링타입으로 다운캐스팅 한것!!
	 
	 
	 	if(id==null){
	 		// 로그인 페이지 이동
		 	response.sendRedirect("loginForm.jsp");
	 	}
	 
	 
	 %>
	 
	 <h2><%=id %>님 환영합니다.</h2>
	 
	 <input type="button" value="로그아웃" onclick ="location.href='logout.jsp'">
	 
	 <hr>
	 
	 <a href = "myInfo.jsp"><h2>회원정보 보기(select)</h2></a>
	 
	 <a href = "updateForm.jsp"><h2>회원정보 수정(update)</h2></a>
	 
	 <a href = "deleteForm.jsp"><h2>회원정보 삭제(delete)</h2></a>
	 
	 <!-- 관리자(admin)일때만 정보확인 가능,
	 	일반 사용자는 메뉴 확인 불가능 
	 -->
	 <%
	  if(id != null){
	 	if(id.equals("admin")){ // id가 null이기 때문에 비교를 못해서 실행 안됨. 
	 %>
	 
	  <a href = "adminSelect.jsp"><h2>관리자 회원정보 목록</h2></a>
	 <%
	 	}
	  }
	 %>

	 
	 
	 
	
	 
	 
	 
	 
	 
	 
	 
	 
	 
	 

	
</body>
</html>