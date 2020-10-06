<%@page import="com.itwillbs.member.MemberDAO"%>

<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/member/joinPro.jsp</h1>
	
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 전달되는 데이터 입력 (저장)
		// => 자바빈 객체 (MemberBean)
		// => 액션태그
		
	%>
	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
	<jsp:setProperty property="*" name="mb"/>
	
	<%
	
	// 날짜 정보 저장
	mb.setReg_date(new Date(System.currentTimeMillis()));	
	
	// MemberDAO 객체 생성 -> 전달받은 정보 모두를 저장
	MemberDAO mdao = new MemberDAO();
	
	// 회원가입 메서드(insertMember())
	mdao.insertMember(mb);
	%>
	
	
	<script type = "text/javascript">
	 	alert("회원가입 완료");
	 	location.href="loginForm.jsp";
	</script>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>