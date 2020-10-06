<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
 <h1>WebContent/JSP1/TestPro1.jsp</h1>
 
 <%
 	// 이전 페이지에서 정보를 받아오기
 	System.out.println(request.getParameter("num"));
 	out.println(request.getParameter("num")+100);
 	
 	
 	
 	// form태그에서 get방식으로 정보를 전달할 때 데이터가 String타입으로
 	// 변경되서 전달됨. => 숫자를 전달할 경우는 받아서 사용할 때 문자를 숫자로 변경해야함.(형변환)
 	
 	// Integer.parseInt(문자열) => 문자열을 정수형(int)로 변경
 
 	// 데이터 타입
 	// 1) 기본형 타입 - 8개
	//    boolean, char, byte, short, int, long, float, double
	//메모리	 1       2     1      2    4     8    4       8   
	//
	// => 묵시적 형변환 : 메모리 공간의 크기가 작은곳 -> 큰곳
	//    => 컴파일러가 자동으로 형변환(문제가 없기 때문)
	// => 명시적 형변환 : 메모리 공간의 크기가 큰곳 -> 작은곳
	//    => 컴파일러가 자동으로 형변환 X (문제가 있기 때문: 메모리 공간 큰->작)
	//    => 형변환 하고자하는 타입으로 (타입) 직접 지정
	//    => 문제상황을 개발자가 인지하고, 그래도 해당 타입으로 처리하겠다는 뜻
	
	// 2) 참조형 타입 - 무한대
	// => 기본형 타입 8가지가 아닌 모든 데이터타입
	//    String(참조형), int[]
			//new int[3];
 	
 	int num = Integer.parseInt(request.getParameter("num")); 
 %>
 	<hr>
 
 	<!-- 표현식을 사용해서 num출력 -->
 	 정수형 값: <%=num %> <br>
 	 정수형 값: <%=num+100 %> <br>
 	 <%=Integer.parseInt(request.getParameter("num"))%>
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 
 

</body>
</html>