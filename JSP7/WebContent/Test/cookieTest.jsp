<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	Cookie[] cookies = request.getCookies();

	String name = "";
	String value = "";

	if(cookies != null){
		for(int i=0; i<cookies.length; i++){
			if(cookies[i].getName().equals("name")){
				name = cookies[i].getName();
				value = cookies[i].getValue();
			}
		}
	}

%>

<h3>쿠키값 이름:<%=name %></h3>
<h3>쿠키값 값 :<%=value %></h3>

<input type = "button" value ="쿠키값 저장"
	onclick="location.href ='cookieSet.jsp'">
	
	<input type = "button" value = "쿠키값 삭제"
		onclick = "location.href='cookieDel.jsp'">

</body>
</html>