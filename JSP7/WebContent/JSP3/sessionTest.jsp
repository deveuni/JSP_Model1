<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP3/sessionTest.jsp</h1>
	<%	
		// p270~
		// 세션(Session) : 서버쪽에서 웹컨테이너의 상태를 유지하기 위해서 정보를 저장하는 객체(방법)
		// * 웹 브라우저당 1개의 세션 정보를 생성해서 사용
		// 웹서버는 각각의 브라우저로부터 요청을 받아서 처리할 때 특별한 식별자(sessionID)를 가지고 응답
		// 세션 객체 생성 (JSP 내장객체) -> 값을 저장 -> 저장된 값을 확인
		
		// 세션값 생성 : 세션영역에 해당 속성을 저장
		// session.setAttribute("이름",값);
		// 세션값 가져오기 : 세션 영역에 있는 속성값을 가져오기
		// session.getAttribute("이름");
	%>
	<%
		String val = (String)session.getAttribute("val");
	
		if(val == null){
			val = "세션값 없음";
		}
	%>
	
	
	<h1> 세션값 테스트 </h1>
	
				
	<h2>세션값 : <%=val %> </h2>
	<!-- 세션값이 없을 경우 null 표시 대신에 "세션값없음"출력 -->
	<h2>세션값 (이름) : <%=session.getAttribute("name") %></h2>

	<input type="button" value="세션값 생성"
			onclick = "location.href='sessionSet.jsp'"
	><br>
	
	<input type="button" value="세션값 삭제"
			onclick = "location.href='sessionDel.jsp'"
	><br>
	
	<input type="button" value="세션값 초기화"
			onclick = "location.href='sessionInval.jsp'"
	><br>
			
		






</body>
</html>