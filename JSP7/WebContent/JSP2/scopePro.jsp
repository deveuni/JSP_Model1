<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 	<h1>WebContent/JSP2/scopePro.jsp</h1>
 	
 	<%
 		System.out.println("내장객체 속성값(Attribute) 생성 시작");
 		 	int a = 100;
 	
 			// 해당접근영역의 객체.setAttribute("이름","값")
 			pageContext.setAttribute("p", "pageContext 값!!!"+a);
 			request.setAttribute("req", "request 값!!!");
 			session.setAttribute("ses", "session 값!!!");
 			application.setAttribute("app", "application 값!!!");
 		
 	
 	
 	    System.out.println("내장객체 속성값(Attribute) 생성 끝");
 	%>
 	
 	
 	<%
 		//전달된 파라미터값을 저장 -> 출력
 		String id = request.getParameter("id");
  	%>
 	<h2>정보를 파라미터를 사용해서 전달</h2>
 	<h3>아이디: <%=id %></h3>
 	
 	<hr>
 	
 	<h2> 내장객체 (pageContext, request, session, application) </h2>
 	
 	<h4> pageContext 내장객체의 값 : <%=pageContext.getAttribute("p") %></h4>
 	<h4> request 내장객체의 값 : <%=request.getAttribute("req") %> </h4>
 	<h4> session 내장객체의 값 : <%=session.getAttribute("ses") %> </h4>
 	<h4> application 내장객체의 값 : <%=application.getAttribute("app") %> </h4>
 	
 	<h2> page 영역에서는 모두 사용 가능 </h2>
 	
 	
 	<hr>
 	
 	<!-- a태그(링크)로 이동시, session, application 영역의 값을 공유 가능 -->
 	<!-- 파라미터의 값도 저장/ 전달 가능하다(get방식) -->
 	<a href="scopeProPro.jsp?id=<%=id %>&pw=1234"> scopeProPro.jsp 페이지로 이동</a>
 	
 	
 	<!-- 자바스크립트 이동시, session, application 영역의 값을 공유 가능 -->
 	<!-- 파라미터의 값도 저장/ 전달 가능하다(get방식) -->
 	<script type= "text/javascript">
 		// alert("자바스크립트 사용 :scopeProPro.jsp 페이지로 이동 ");
 		//location.href = "scopeProPro.jsp?id=<%=id %>&pw=1234";
   	</script>
   	
   	
   	<!-- 내장객체 response 이동시, session,applicaion + 파라미터값 -->
   	<!-- 자바스크립트,JSP(sendRedirect),액션태그 방식은 모두 같이 사용불가  -->
   	<%
   		// response.sendRedirect("이동할 페이지 주소");
   		// response.sendRedirect("scopeProPro.jsp?id="+id+"&pw=1234"); // 문자열
   	%>
 	
 	
 	<!-- 액션태그  forward 사용해서 이동 (p222~) -->
 	<!-- request,session,application + 파라미터값  -->
 	<!-- 
 		액션태그 : JSP 페이지에서 자바, 스크립트 코드 없이 다른 페이지로 이동 (model2방식,MVC패턴방식)
 				서블릿, 객체(자바빈)에 접근할 수 있는 방법 
 	 -->
 	<%--  <jsp:forward page="scopeProPro.jsp?pw=1234" />--%>
 
 	<jsp:forward page="scopeProPro.jsp">
          <jsp:param name="pw" value="<%=a %>" />
    
    </jsp:forward>
 	
 	<!-- forwarding(포워딩) : 
 		  * 이동하는 페이지의 주소는 변경 X, 페이지의 내용만 변경 
 		  * request, response 객체의 정보를 가지고 이동이 가능.
 	-->
 					
 	
 	
 	

</body>
</html>