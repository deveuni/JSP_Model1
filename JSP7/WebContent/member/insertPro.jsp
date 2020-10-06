<%@page import="java.sql.Timestamp"%>
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
	<h1>WebContent/member/insertPro.jsp</h1>
	
	<%
		// 한글처리
		request.setCharacterEncoding("UTF-8");
	
		// 전달되는 파라미터 정보를 저장(액션태그사용 - 자바빈)
	
	%>
	
	<!-- 자바빈 객체 생성 -->
	<jsp:useBean id ="mb" class = "com.itwillbs.member.MemberBean" />
	<!-- 파라미터 값 저장 -->
	<jsp:setProperty property="*" name="mb"/>
	
	<% 	
	
		//System.out.println(mb);
		// 파라미터로 전달되지 않는 정보는 직접 생성
		mb.setReg_date(new Timestamp(System.currentTimeMillis()));	
		
		//System.out.println(mb);
	
		// DB로 전달해서 처리 (회원가입)
		// 객체 생성
		MemberDAO mda = new MemberDAO();
		
		//mda.getCon();
		//회원가입 메서드 호출(insertMember())
		mda.insertMember(mb);
		

		// 성공시 -> 로그인 페이지로 이동
		
	%>
	<script type ="text/javascript">
		alert("회원가입 성공");
		location.href = "loginForm.jsp";
	</script>
	
	
	
	
	

</body>
</html>