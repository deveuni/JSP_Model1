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
<h1>WebContent/member/loginPro.jsp</h1>

	<%
		
		// 한글처리
		request.setCharacterEncoding("UTF-8");
		// 전달된 파라미터값 저장 
		String id = request.getParameter("id");
		String pw = request.getParameter("pw");
		
		// 자바빈 객체 생성
		
	%>
	
<%-- 	<jsp:useBean id="mb" class="com.itwillbs.member.MemberBean"/>
		<jsp:setProperty property="*" name="mb" param="*"/>
 --%>
	

	<%
		// 로그인 처리 -> DAO에서 처리 -> pro에서 결과에 따른 이동
		
		// MemberDAO 객체 생성 
			MemberDAO mdao = new MemberDAO();
		
		// 로그인 처리 하는 동작 (메서드) - idCheck(id,passwd)
		// DB에서 해당 값이 있는지 체크하고 결과를 리턴 
		// 정수형 데이터값 사용 (1:정상처리, 0:비밀번호 오류, -1:아이디가 없음)
			
		int result = mdao.idCheck(id, pw);
	
		//out.println("result = "+result);
		// 결과에 따른 페이지 이동 처리 
		// result == 1 
		if(result == 1){
			// 아이디정보를 세션값으로 저장
			session.setAttribute("id",id);
			response.sendRedirect("main.jsp");
		}else if(result == 0){// result == 0
	%>	
		<script type type="text/javascript">
			alert("비밀번호 오류!");
			history.back();
		</script>		
	<% 		
		}else{// result == -1 
	%>	
		<script type type="text/javascript">
				alert("아이디 없음!");
				history.back();
		</script>		
	<% 				
		}
		
	%>

</body>
</html>