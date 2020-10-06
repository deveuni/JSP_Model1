<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
<h1> 정보전달받는 페이지</h1>

<%

	// 한글처리(post방식으로 전달될 때 한글이 깨지는 경우)
	request.setCharacterEncoding("UTF-8");


	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String sel = request.getParameter("sel");
	// String hobby = request.getParameter("hobby");
	
	// 동일한 파라미터의 값을 가지는 데이터가 여러개 있을 경우
	// 배열을 통해서 저장
	String[] hobbyArr = request.getParameterValues("hobby");

	System.out.println("이름: "+name);
	System.out.println("성별: "+gender);
	System.out.println("학년: "+sel);
	//System.out.println("취미: "+hobby);

	out.println("이름: "+name);
	out.println("성별: "+gender);
	out.println("학년: "+sel);
	//out.println("취미: "+hobby);

%>

<hr>

<!-- 표현식 -->

	이름: <%=name %><br>
	성별: <%=gender %><br>
	학년: <%= sel %><br>
	<%-- 취미 1: <%= hobbyArr[0] %><br>
	취미 2: <%= hobbyArr[1] %><br>
	취미 3: <%= hobbyArr[2] %><br>--%>
	
	<!-- 취미의 선택 결과에 따른 갯수대로 출력 -->
	<!-- 취미를 선택 안한 경우 처리 -->
	
	<% if(hobbyArr!=null){
		for(int i=0; i<hobbyArr.length; i++){ %>
	
                취미<%=i+1 %> : <%= hobbyArr[i] %><br>
	<%
		}
	}else{%>
	취미를 선택하시오.
	<% }%>	
	
	
	
	
	
	
	
	
	
	
	
	
	


</body>
</html>