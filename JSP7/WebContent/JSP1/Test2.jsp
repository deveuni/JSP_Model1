<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP1/Test2.jsp</h1>

	<!-- JSP 선언문을 사용해서 배열 하나를 생성  -->
	<%
		// JSP 선언문 : 멤버변수, 메서드 (배열은 생성 X) 
		
		// String strArr[] = new String[5]; =>가능
		String[] strArr = new String[5];
		strArr[0]= "JAVA";
		strArr[1]= "JSP";
		strArr[2]= "WEB";
		strArr[3]= "DB";
		strArr[4]= "SPRING";
		
		// 콘솔창에 배열 출력
		for(int i=0; i<strArr.length; i++){
			System.out.println(i+" =>"+strArr[i]);
		}
		
		// 배열의 값을 화면에 출력
		// html 영역의 출력
		// out.print("안녕하세요(html)");
		for(int i=0; i<strArr.length; i++){
			out.print(i+" =>"+strArr[i]+"<br>");
		}
		
		out.print("<hr>");
		
		// 표현식 사용해서 배열의 값을 화면에 출력(더 간편한 방법)
		// [%값, 변수 %]
				
	for(int i=0; i<strArr.length; i++){
	%>
		<!--<h3>안녕</h3>  -->
	      <h3> <%=i %>  => <%=strArr[i] %> </h3>
	<% 
		}
	%>
	<!-- html -->
	<h3>테이블에 해당 배열의 값을 출력</h3>
	<!-- 배열의 요소 '인덱스 '
	          배열의 요소 '값'
	-->
	
 
   <table border="1">
     <tr>
       <td>인덱스</td><td>값</td>
     </tr>
     <%
       for(int i=0;i<strArr.length;i++){
     %>
	     <tr>
	       <td><%=i %></td><td><%=strArr[i] %></td>
	     </tr>
     <%
       }
     %>
   </table>
	
	
	
	
	
	
	
	
	
	
	
	
	
</body>
</html>