<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="color.jspf" %>    
    
<%!
	// color.jspf
	// jspf(Jsp Servlet Page Framegment) : JSP 변수를 저장 가능한 확장자

/* String col1 = "yellow";
String col2 = "pink";
String col3 = "green";
String col4 = "orange";
String col5 = "blue";
 */
	String color = "red";
%>    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body bgcolor=<%=color %>>
	<h1>WebContent/JSP2/IncludeMain.jsp</h1>
	<%-- <%@ include ~	--%>
	<!-- JSP 지시어 : 공통으로 사용되는 변수를 파일에 지정해서 추가 -->
	<!-- 해당페이지 컴파일 되기 전에 소스코드를 include한 후 컴파일  -->
	
	
	<%-- <jsp:include page=""> ~ --%>
	<!-- 액션태그 : 공통으로 사용되는 메뉴들을(페이지) 특정 공간에 추가 -->
	<!-- 해당 페이지가 java파일(서블릿)으로 컴파일 된 후에 include한다. -->
	
	
	<table border ="1" width="600" height="600">
		<tr>
			<td colspan="2" height="100">
				<jsp:include page="top.jsp">
					<jsp:param name="name" value="Hong"/>
				</jsp:include>
			 </td>
		</tr>		
		<tr>
			<td width="100">
				<jsp:include page="left.jsp" />
			</td>
			<td>본문</td>
		</tr>
		<tr>
			<td colspan="2" height="100">
				<jsp:include page="bottom.jsp" />
			</td>
		</tr>
	</table>
	
	
	
	
	
	
	
	
	
</body>
</html>