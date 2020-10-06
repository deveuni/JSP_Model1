<%@page import="java.util.ArrayList"%>
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
	<h1>WebContent/board/boardList.jsp</h1>
	
	<%
		// DB에서 전제 글 목록을 읽어서 가져오기 
		
		// BoardDAO 객체 생성 
		BoardDAO bdao = new BoardDAO(); 
		
		// 테이블에 글이 있는지 없는지 판단(getBoardCount()) 
		int cnt = bdao.getBoardCount();
		
		System.out.println("테이블에 저장된 글의 수 : " + cnt);
		
		// 페이징 처리 *********************************************************************************
		
		// 한 페이지에서 보여줄 글의 개수 설정
		int pageSize = 10;
		
		// 현 페이지의 페이지 값을 확인 - 연산하지 않고 표시만 하기 때문에 문자열로 저장
		String pageNum = request.getParameter("pageNum");
		if(pageNum == null){ // 페이지 정보가 없을 경우 항상 1페이지 
			pageNum = "1";
		}
		
		// 시작 행번호 계산  1...10 / 11...20 / 21...30 / 31...40
		// 현재 페이지
		int currentPage = Integer.parseInt(pageNum);
		// 시작 행번호 계산 - 1, 11, 21, 31, ...
		int startRow = (currentPage-1) * pageSize + 1;
		
		// 끝 행번호 계산  - 10, 20, 30, ...
		int endRow = currentPage * pageSize;
		
		// 페이징 처리 *********************************************************************************
		
		// 게시판의 총 글의 수를 화면에 출력 
		ArrayList boardList = null; // 전역변수로 사용하기 위해서 
		// 글 모두 가져오기 (getBoardList())
		if(cnt != 0){
			//boardList = bdao.getBoardList();
			// 페이징 처리한 리스트 호출 (시작행, 페이지크기)
			boardList = bdao.getBoardList(startRow, pageSize);
		}
	
	%>
	
	<h2> 게시판 글의 수 : <%=cnt %> 개</h2>
	<h2><a href = "writeForm.jsp"> 글쓰기 </a></h2>
	
	
	 <table border="1">
     <tr>
       <td>번호</td>
       <td>제목</td>
       <td>작성자</td>
       <td>작성일</td>
       <td>조회수</td>
       <td>IP</td>
     </tr>
     
     <%
     for(int i=0;i<boardList.size(); i++){
    	 // ArrayList 한칸의 정보 -> BoardBean 객체 하나로 이동 
 	 	BoardBean bb =	(BoardBean)boardList.get(i);
     
     %>
     
     <tr>
       <td><%=bb.getBno() %></td>
       <td>
       <%
       	 // 답글 들여쓰기 처리 
       	 int wid = 0;
       	 // 답글일 때 - 일반글과 답글 구분 (level)
      	 if(bb.getRe_lev()>0){	 
      		 wid = 10 * bb.getRe_lev();
       %>
       	 <img src="level.gif" width="<%=wid%> height="15">
       	 <img src="re.gif">
       <%
     }
       %>
       	 <a href="content.jsp?bno=<%=bb.getBno()%>&pageNum=<%=pageNum%>"><%=bb.getSubject() %></a>
       </td>
       <td><%=bb.getName()%></td>
       <td><%=bb.getDate() %></td>
       <td><%=bb.getReadcount() %></td>
       <td><%=bb.getIp() %></td>
     </tr>
   
   <%
     }
   %>
   </table>
   
	<%
		// 다른 페이지 이동 버튼 -- 외울 필요 없음!
		if(cnt != 0){
			// 전체 페이지수 - 글 50 / 화면 10씩 출력 => 5페이지
			// 			 - 글 56 / 화면 10씩 출력 => 6페이지
			
			int pageCount = cnt/pageSize + (cnt % pageSize == 0? 0:1) ;
			
			// 한 화면에 보여줄 페이지 번호 개수 
			int pageBlock = 3; 
			
			// 페이지 블럭의 시작페이지 번호  1...10/ 11...20/ 21...30/ 31...40 
			int startPage = ((currentPage-1)/pageBlock)*pageBlock+1;
			//  ((11-1)/10) * 10 + 1 = 11
			
			// 페이지 블럭의 끝 페이지 번호 
			int endPage = startPage + pageBlock-1;
			if(endPage > pageCount){
				endPage = pageCount;
			}
			
			
			// 이전 / startPage-pageBlock = 5-2 = 3
			if(startPage > pageBlock){
				%>
					<a href="boardList.jsp?pageNum=<%=startPage-pageBlock%>">[이전]</a>
				<% 
			}
			
			// 숫자 (1...10/11...20/.....) 
			for(int i=startPage;i<=endPage;i++){
				%>
					<a href="boardList.jsp?pageNum=<%=i%>">[<%=i %>]</a>
				<% 
			}
			// 다음
			if(endPage < pageCount){
				%>
					<a href ="boardList.jsp?pageNum=<%=startPage+pageBlock%>">[다음]</a>
				<% 
			}
		}

	%>
	
	


</body>
</html>