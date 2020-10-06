<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/reWriteForm.jsp</h1>

	<h1> 게시판 답글쓰기 </h1>
	
	<%
	// 세션, 어플리케이션, request, 페이지로 넘어가면 Attribute
	// 전달한 데이터 저장 - 주소줄에 넘기거나 겟방식(폼태그에서)으로 정보를 넘길 때는 무조건 parameter!!()
	 int bno = Integer.parseInt(request.getParameter("bno"));
	 int re_ref = Integer.parseInt(request.getParameter("re_ref"));
	 int re_lev = Integer.parseInt(request.getParameter("re_lev"));
	 int re_seq = Integer.parseInt(request.getParameter("re_seq"));
	
	
	
	%>
	
	
	<fieldset>
	<form action="reWritePro.jsp" method ="post">
	
		<!-- BoardBean에 멤버변수로 있을 때는 form태그로 , 없으면 ?get방식으로  -->
		<input type="hidden" name="bno"  value=<%=bno %> >
		<input type="hidden" name="re_ref" value=<%=re_ref %>>
		<input type="hidden" name="re_lev"  value=<%=re_lev %>>
		<input type="hidden" name="re_seq"  value=<%=re_seq %>>
	
	
	 글쓴이 : <input type ="text" name="name"><br>
	 비밀번호 : <input type="password" name ="passwd"><br>
	 제목 : <input type="text" name="subject" value="[답글]"><br>
	 내용 : <br> 
	 <textarea rows="10" cols ="25" name = "content"></textarea><br>
	 
	 <br>
	 <input type="submit" value="답글쓰기">
	 
	</form>
	</fieldset>


</body>
</html>