<%@page import="com.itwillbs.board.BoardBean"%>
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
	<h1>WebContent/board/content.jsp</h1>

	<h1> 글 내용 보기 </h1>
	
	<%
		// 글 번호(pk)에 해당하는 글의 정보를 가져오기 
		
		// 전달된 데이터 저장 (bno, pageNum)
		int bno = Integer.parseInt(request.getParameter("bno"));
		String pageNum = request.getParameter("pageNum");
		
		// BoardDAO 객체 생성
		BoardDAO bdao = new BoardDAO(); 
		
		// 글의 조회수 정보를 1증가 (updateReadCount(bno)) 
		bdao.updateReadCount(bno);
		
		
		// 글 정보를 가져오는 메서드 생성(getBoard(bno))
		BoardBean bb = bdao.getBoard(bno);
		
		// 화면(테이블)에 출력
		
	
	%>

	<table border="1">
		<tr>
		  <td>글번호</td>
		  <td><%=bb.getBno() %></td>
		  <td>조회수</td>
		  <td><%=bb.getReadcount() %></td>
		</tr>
		<tr>
		  <td>작성자</td>
		  <td><%=bb.getName() %></td>
		  <td>작성일</td>
		  <td><%=bb.getDate() %></td>
		</tr>
		<tr>
		  <td>제목</td>
		  <td colspan="3"><%=bb.getSubject() %></td>
		</tr>
		<tr>
		  <td>첨부파일</td>
		  <td colspan="3">
		  	  <a href="D:\upfile\<%=bb.getFile()%>"><%=bb.getFile() %></a> 		  	 
		  </td>
		</tr>
		<tr>
		  <td> 글 내용 </td>
		  <td colspan="3"> <%=bb.getContent() %></td>
		</tr>
		<tr>
		  <td colspan ="4">
		  <!-- 로그인 정보가 없거나, 글쓴이 이름과 아이디가 다를 경우 
		  	수정하기, 삭제하기 버튼을 숨김
		  	로그인한 아이디의 정보가 글쓴이 이름과 같다면 수정하기, 삭제하기를 보여주기  -->
		  
		  <% 
		   // 로그인 정보를 가져와서 판단
		   // 세션값 가져오기 
		  
		  String id = (String)session.getAttribute("id");
		  
		  if( id != null && id.equals(bb.getName())){
			  // 아이디 있으면서, 이름이랑 아이디랑 같은 경우 ---> 페이지에서 구현할때 아이디랑 이름 똑같이 하자 바보야!!!!!!
		 
			%>
		     <input type="button" value="수정하기" 
		     	onclick="location.href='updateForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>'" >
		     <input type="button" value="삭제하기"
		     	onclick="location.href='deleteForm.jsp?bno=<%=bb.getBno() %>&pageNum=<%=pageNum %>'" >
		     	
		   <%
		  }
		  
		   %>  	
		     <input type="button" value="답글쓰기"
		     	onclick = "location.href ='reWriteForm.jsp?bno=<%=bb.getBno()%>&re_ref=<%=bb.getRe_ref() %>&re_lev=<%=bb.getRe_lev()%>&re_seq=<%=bb.getRe_seq()%>'">
		     <input type="button" value="목록으로" onclick = "location.href='boardList.jsp?pageNum=<%=pageNum%>'">
		  </td>
		</tr>
	</table>


	<%
	
	//삭제 & 수정 할 때 글 정보를 가져가기 위해 글번호 , 삭제수정 후 글의 페이지 목록으로 가기 위해서 페이지 가지고 이동하기.
	
	%>





</body>
</html>