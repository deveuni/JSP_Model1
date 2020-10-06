<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/JSP4/cookieDel.jsp</h1>

	<h2> 쿠키값 삭제 페이지</h2>
	
	<%
	  // 쿠키값 정보를 가져온다(배열)
	  
	  // 쿠키값이 있을 때만 삭제 동작을 진행
	  // 쿠키 배열의 처음부터 끝까지 비교
	  // 쿠키 이름이 "name"인 대상을 찾아서 삭제 
	  // 변경된 쿠키 정보를 다시 클라이언트 쪽으로 전달 
	  
	  
	  Cookie[] cookies2 = request.getCookies();
	
		String name = "";
		String value = "";
		
		if(cookies2 != null){
			for(int i=0; i<cookies2.length; i++){
				if(cookies2[i].getName().equals("name")){
					// 삭제 - 사용시간을 0으로 만들면 쿠키정보 사라짐.
					cookies2[i].setMaxAge(0); 
					response.addCookie(cookies2[i]);
				}

			}
		}
	%>

	<script type="text/javascript">
		alert("쿠키값 삭제 완료!");
		location.href = "cookieTest.jsp";
	
	</script>


</body>
</html>