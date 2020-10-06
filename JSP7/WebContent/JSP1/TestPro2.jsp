<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/TestPro2.jsp</h1>
	<h1>정보 전달 받아서 출력하는 페이지</h1>


	<%
	// 파라미터값 한글처리(form 태그 - post방식 한글전달)
	request.setCharacterEncoding("UTF-8");
	
	
	// 변수에 담아서 전달하기!!
	  String name = request.getParameter("name");
	  int age = Integer.parseInt(request.getParameter("age"));
	  String addr = request.getParameter("addr");
	  
	  // 콘솔창에 출력
	  System.out.println("name: "+name);
	  System.out.println("age: "+age);
	  System.out.println("addr: "+ addr);
	  
	  // 화면에 출력(자바코드)
	  out.println("name: "+name);
	  out.println("age: "+age);
	  out.println("addr: "+ addr);
	  
	
	%>
	
	<hr>
	<!-- 표현식 -->
          이름 : <%=name %> <br>
	  나이 : <%=request.getParameter("age") %><br>
	  사는곳 : <%=addr %><br>

	<!-- 전달된 나이 정보가 20살 이상인 경우
	    화면에  "ㅇㅇㅇ님은 성인입니다." 출력,
	   나이 정보가 20살 미만인 경우
	   화면에 "ㅇㅇㅇ님은 미성년자입니다." 출력. 
	 -->
	
	<%
	if(age>=20){
		
		out.println(name+"님은 성인입니다.");
	}else{
		out.println(name+"님은 미성년자입니다.");
	}
	%>
	
	<hr>
	
	<% if(age>=20) {
	%> 
	
	<%=name %> 님은 성인입니다.
	
	<% }else{ %>
	
	<%=name %> 님은 미성년자입니다.
	<%} %>
	
	
	
	
	
	
	
	
	
	
</body>
</html>