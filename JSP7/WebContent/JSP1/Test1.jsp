<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import ="java.util.*" %>
    <%-- 외부로부터 다른 파일(클래스/객체)을 가져와서 추가해서 지정 --%>
    <!-- 
    	contentType 타입 : 사용자의 요청을 응답할 때 응답할 페이지의 타입(MIME)을 지정
    
   MIME 타입 : 
   https://developer.mozilla.org/ko/docs/Web/HTTP/Basics_of_HTTP/MIME_types/Common_types
     -->
    
    <!-- 선언문  -->
    <%!
      // 자바코드를 사용해서 변수, 메서드 사용(전역변수)
	  String name = "홍길동";    
    
    %>
    <%!
      public void Method(){
    	System.out.println("안녕하세요");
    }
     %>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

	<%
	
	// JSP 디렉티브(directive) - p150 ~
	// jsp 페이지가 실행될 때 필요한 정보를 지정
	// [%@ ~ %] 형태로 사용
	// page, include, taglib 
	
	// JSP 스크립트 요소 - 160p ~ --->[] = <> 오류날까봐 이렇게 표현
	// 1) 선언문 [%! %] : 변수, 메서드(함수)를 선언해서 사용 => 멤버변수(전역변수), 중복사용가능
	// 2) 스크립틀릿 [% %] : 자바코드를 작성(변수, 메서드 사용) => 지역변수
	// 3) 표현식 [%= %] : 화면에 출력할 내용 작성, html영역에서 사용
	
	// System.out.println(a); (x)
	
	// 스크립틀릿 : 자바코드를 작성할 수 있는 영역
	int a = 100;	
	//System.out.println(a);
	System.out.println("전역변수로 선언한 이름: "+name);
	
	%>
	
	
	<h1>WebContent/JSP1/Test1.jsp</h1>
	<!--int a = 100; (html)-->
    <%-- <h1>WebContent/JSP1/Test1.jsp</h1> (JSP) --%>
    
    <!-- html -->
    <%="안녕(JAVA의 값)" %> <br>
    <%=name %> <br>
    <!--  
    	표현식은 값, 자바변수의 값을 화면에 출력 가능
     -->
     
     
    
 <%
 	// java
 	System.out.println(name);
 	System.out.println(a);
 
 	// html 영역의 출력
 	out.print("안녕하세요(html)");
 %>   









</body>
</html>