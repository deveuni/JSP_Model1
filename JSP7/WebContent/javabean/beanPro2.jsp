<%@page import="com.itwillbs.bean.Javabean2"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/javabean/beanPro2.jsp</h1>
	
	<%
	 request.setCharacterEncoding("UTF-8");
	
	 String id = request.getParameter("id");
	 String pw = request.getParameter("pw");
	 int num = Integer.parseInt(request.getParameter("num"));
			 
	%>
	<h2>파라미터 값</h2>
	아이디 : <%=id %><br>
	비밀번호 : <%=pw %><br>
	좋아하는 숫자 : <%=num %><br>
	
	<hr>
	
	<%
		// 자바빈 객체 사용 값 저장
		Javabean2 jb2 = new Javabean2();
	
		jb2.setId(id);
		jb2.setPw(pw);
		jb2.setNum(num);
		
		out.print(jb2.getId()+"<br>");
		out.print(jb2.getPw()+"<br>");
		out.print(jb2.getNum()+"<br>");
	
	
	%>
	
	<hr>
	
	<h2>자바빈 객체 사용</h2> 
	아이디 : <%=jb2.getId() %><br>
	비밀번호 : <%=jb2.getPw() %><br>
	좋아하는 숫자 : <%=jb2.getNum() %><br>
	toString이용1 : <%=jb2.toString() %><br>
	toString이용2 : <%=jb2 %>
			
	
	
	<hr>
	
	<h2>액션태그 사용</h2>
	
	<jsp:useBean id="bean2"  class = "com.itwillbs.bean.Javabean2" />
	<!-- scope : page, request, session, application 영역에 지정해서 저장 가능 
				설정 값이 없을 경우, 기본 page에 저장
	-->
	
	
	<%--<jsp:setProperty property="id" name="bean2" param ="id" />
	<jsp:setProperty property="pw" name="bean2" param ="pw"/>
	<jsp:setProperty property="num" name="bean2"  param ="num"/> --%>
	
	<jsp:setProperty property="*" name="bean2" />
	
	아이디 : <jsp:getProperty property="id" name="bean2"/> <br>
	비밀번호 : <jsp:getProperty property="pw" name="bean2"/><br>
	좋아하는 숫자 :<jsp:getProperty property="num" name="bean2"/><br>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>