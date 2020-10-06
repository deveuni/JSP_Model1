<%@page import="com.itwillbs.db.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/updatePro.jsp</h1>
	
	
	<%
		
	  	// 한글처리
	  	request.setCharacterEncoding("UTF-8");
	
		// get방식으로 전달되는 데이터 처리 ---> 까먹을 수 있으니 젤 먼저 처리하기!!  
		String pageNum = request.getParameter("pageNum");
	  	
		// 파라미터 값 저장 (수정할 데이터) 
		// => 액션태그 사용 BoardBean 객체에 저장 
		// <useBean> // 객체 생성자를 받아올때 boardBean의 멤버변수는 0으로 초기화됨!! 그래서 오류가뜬것!! --> bno 초기화돼서 
		// <setProperty>
		//updateForm 에 pageNum을 hidden으로 받아와서 가져오면 에러남 !! -> 왜냐하면 BoardBean 객체에 pageNum 멤버변수가 없으므로!! 
		
	%>
	
		<jsp:useBean id="bb" class= "com.itwillbs.board.BoardBean" />
		<jsp:setProperty property="*" name="bb"/>
		
	
	<% 	
		
		
	
		// DAO 객체 생성 
		BoardDAO bdao = new BoardDAO();
		
		// 정보 수정메서드 updateBoard(bb) - 이름, 제목, 내용만 수정 
		
		int result = bdao.updateBoard(bb);
		
		// => 결과를 정수형 데이터로 리턴 
		// 1=> 정상처리(list로), 0=>비밀번호오류, -1=>해당 글이 없음.
		// => 처리 결과에 따라서 페이지 이동 
		
		if(result == 1){
			
			%>
				<script type="text/javascript">
					alert("글 수정 완료!");
					location.href = "boardList.jsp?pageNum=<%=pageNum%>";
				
				</script>
			
			<% 
		}else if(result == 0){
			%>
			<script type="text/javascript">
			alert("비밀번호 오류");
				history.back();
			
			</script>
		
		<% 
		
		}else{
			%>
			<script type="text/javascript">
			alert("작성글 오류 ");
				history.back();
			
			</script>
		
		<% 
			
		}
		
		
		
	%>
	
	
	
	
	
	
	
	
	
	
	
	

</body>
</html>