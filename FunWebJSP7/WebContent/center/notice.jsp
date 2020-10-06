<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="java.util.List"%>
<%@page import="com.itwillbs.board.BoardDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="../css/default.css" rel="stylesheet" type="text/css">
<link href="../css/subpage.css" rel="stylesheet" type="text/css">
<!--[if lt IE 9]>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/IE9.js" type="text/javascript"></script>
<script src="http://ie7-js.googlecode.com/svn/version/2.1(beta4)/ie7-squish.js" type="text/javascript"></script>
<script src="http://html5shim.googlecode.com/svn/trunk/html5.js" type="text/javascript"></script>
<![endif]-->
<!--[if IE 6]>
 <script src="../script/DD_belatedPNG_0.0.8a.js"></script>
 <script>
   /* EXAMPLE */
   DD_belatedPNG.fix('#wrap');
   DD_belatedPNG.fix('#main_img');   

 </script>
 <![endif]-->
</head>
<body>
<div id="wrap">
<!-- 헤더들어가는 곳 -->
<jsp:include page="../inc/top.jsp"/>
<!-- 헤더들어가는 곳 -->

<!-- 본문들어가는 곳 -->
<!-- 메인이미지 -->
<div id="sub_img_center"></div>
<!-- 메인이미지 -->

<!-- 왼쪽메뉴 -->
<nav id="sub_menu">
<ul>
<li><a href="writeForm.jsp">글쓰기</a></li>
<li><a href="#">글 목록 보기</a></li>
<li><a href="#">파일업로드/다운로드</a></li>
<li><a href="#">Service Policy</a></li>
</ul>
</nav>
<!-- 왼쪽메뉴 -->





<%
	// BoardDAO 객체 생성 
	BoardDAO bdao = new BoardDAO();
	
	// 테이블에 저장된 글의 개수 메서드 
	// getBoardCount()
	int count = bdao.getBoardCount();
	
	
	List boardList = null;
	if(count != 0){
		// 글이 있을 경우, 모든 글의 정보를 가져오는 메서드 
		boardList = bdao.getBoardList();
	}
	
%>


<!-- 게시판 -->
<article>
<h1>게시판 [글: <%=count %>개]</h1>
<table id="notice">
<tr><th class="tno">No.</th>
    <th class="ttitle">Title</th>
    <th class="twrite">Writer</th>
    <th class="tdate">Date</th>
    <th class="tread">Read</th></tr>
    
    
    <% for(int i=0;i<boardList.size();i++){
    		BoardBean bb = (BoardBean)boardList.get(i); //저장할 때 업캐스팅 했기 때문에 꺼내올 때는 다운캐스팅	
    %>
	<tr>
		<td><%=bb.getBno() %></td>
		<td class="left"><%=bb.getSubject() %></td>
    	<td><%=bb.getName() %></td>
    	<td><%=bb.getDate() %></td>
    	<td><%=bb.getReadcount() %></td>
    </tr>
    <%} %>
    
    
</table>
<div id="table_search">
<input type="text" name="search" class="input_box">
<input type="button" value="search" class="btn">
</div>
<div class="clear"></div>
<div id="page_control">
<a href="#">Prev</a>
<a href="#">1</a><a href="#">2</a><a href="#">3</a>
<a href="#">4</a><a href="#">5</a><a href="#">6</a>
<a href="#">7</a><a href="#">8</a><a href="#">9</a>
<a href="#">10</a>
<a href="#">Next</a>
</div>
</article>
<!-- 게시판 -->
<!-- 본문들어가는 곳 -->
<div class="clear"></div>
<!-- 푸터들어가는 곳 -->
<jsp:include page="../inc/bottom.jsp"/>
<!-- 푸터들어가는 곳 -->
</div>
</body>
</html>