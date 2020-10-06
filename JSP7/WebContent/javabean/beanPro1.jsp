<%@page import="com.itwillbs.bean.Javabean1"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/javabean/beanPro1.jsp</h1>
	
	<%
		request.setCharacterEncoding("UTF-8");
	
		String id = request.getParameter("id");
	
	
	
	%>
	
	아이디 : <%=id %><br>
	
	<hr>
	
	 <%
	 	// 자바빈 객체를 사용해서 파라미터값 저장
	 	Javabean1 jb = new Javabean1();
	 	
	 	// 파라미터의 값을 객체에 저장
	 
	 	jb.setId(id);
	 	jb.setId(request.getParameter("id"));
	 	
	 	
	 
	 %>
	 
	 자바빈 객체 사용해서 id 출력 : <%=jb.getId() %><br>
	 
	 <hr>
	 
	 <%
	 	// 액션태그 : 태그형태로 구현되어있지만, 자바의 동작을 사용
	 	// <jsp:~>
	 %>
	 
	 
	 <!-- 자바빈 객체 생성 -->
	 <!-- id : 객체의 레퍼런스명(참조변수) -->
	 <!-- class : 객체의 위치(패키지.클래스명) -->
	<jsp:useBean id ="bean" class="com.itwillbs.bean.Javabean1" />
	
	<!-- 자바빈 사용 멤버변수값(파라미터) 저장 -->
	<!-- property : 자바빈 객체의 멤버변수(저장공간 )-->
	<!-- name : 자바빈 객체의 레퍼런스(useBean-id값) 만들때는 id, 저장출력은 name -->
	<!-- param : 전달되는 파라미터값 -->
	
	
	<%-- <jsp:setProperty property="id" name="bean" param="id" />--%>
	<jsp:setProperty property="id" name="bean" />	 
	<!-- setProperty : param의 값과 property 값이 같은 경우 param의 값을 생략가능 -->
	<%-- <jsp:setProperty property="*" name="bean"/>--%>
	<!-- 이전 페이지에서 전달된 모든 파라미터의 값을 저장 -->
	<!-- property는 자바빈의 멤버변수 -->
		
	<!-- 액션태그 사용 자바빈 변수 값 출력 -->
	액션태그 값 : 
	<jsp:getProperty property="id" name="bean"/>
	
	<hr>
	<%
		out.println("액션태그 객체를 자바코드로 출력: "+bean.getId());
	
	%>
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	 

</body>
</html>