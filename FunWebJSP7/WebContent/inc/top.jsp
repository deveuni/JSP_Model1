<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
	<%
		// 화면 상단에 위치하는 메뉴처리 (모든 페이지에 공유)
	
		
		
	%>
    
    <header>
		<div id="login">
		
	<% 	
		// 로그인 체크 (세션 id 값이 있는지 없는지 체크)
		String id = (String)session.getAttribute("id");
		if(id != null){
		
		%>
			<a><%=id %>님 안녕하세요.</a> 
				|
			<a href="../member/logout.jsp">로그아웃</a></div>
		<%
		}else{
		
		%>
		<a href="../member/loginForm.jsp">로그인</a> 
				|
			<a href="../member/joinForm.jsp">회원가입</a></div>
		
		<%
		}
		%>
		
		
	 
		<div class="clear"></div>
		<!-- 로고들어가는 곳 -->
		<div id="logo"><img src="../images/logo.gif" width="265" height="62" alt="Fun Web"></div>
		<!-- 로고들어가는 곳 -->
		<nav id="top_menu">
			<ul>
				<li><a href="../index.jsp">HOME</a></li>
				<li><a href="../company/welcome.html">COMPANY</a></li>
				<li><a href="#">SOLUTIONS</a></li>
				<li><a href="../center/notice.jsp">CUSTOMER CENTER</a></li>
				<li><a href="#">CONTACT US</a></li>
			</ul>
		</nav>
	</header>
    