<%@page import="com.itwillbs.db.BoardDAO"%>
<%@page import="com.itwillbs.board.BoardBean"%>
<%@page import="com.oreilly.servlet.multipart.DefaultFileRenamePolicy"%>
<%@page import="com.oreilly.servlet.MultipartRequest"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>WebContent/board/fWritePro.jsp</h1>
	<%
		// 파일 업로드 => cos.jar (MultipartRequest 클래스)
		
		// 파일이 저장되는 위치 지정 (D:/upfile) - 직접 경로 쓰면 보안 위험있음.
		String savePath = "d:\\upfile";
		// 파일 업로드 최대 크기 5MB (20~250MB) 
		int maxSize = 5 * 1024 * 1024;
		
		
		// MultipartRequest(요청정보, 파일 업로드할 폴더, 파일 업로드 제한 크기, 인코딩방식, 파일 이름 동일시 처리객체)
		
		MultipartRequest multi = 
						new MultipartRequest(
								request, 
								savePath,
								maxSize,
								"UTF-8",
								new DefaultFileRenamePolicy()
								);
		
		// 파일 업로드 완료 
		out.println("파일 업로드 완료!");
		
		////////////////////////////////////////////////////////////////////////////////////////////
		
		// 파일의 정보 + 글 정보를 디비에 저장 
		
		// 글 정보를 저장하는 객체 생성 
		BoardBean bb = new BoardBean();
		
		// 전달되는 정보 저장 
		//bb.setName(request.getParameter("name")); - enctype 쓰면 request로 폼태그 정보를 받지 못함.
		bb.setName(multi.getParameter("name"));
		bb.setPasswd(multi.getParameter("passwd"));
		bb.setSubject(multi.getParameter("subject"));
		bb.setContent(multi.getParameter("content"));
		
		//bb.setFile(multi.getParameter("file")); --(x)
		bb.setFile(multi.getFilesystemName("file"));
		
		System.out.println("upfile에 저장된 이름: " + multi.getFilesystemName("file"));
		System.out.println("사용자가 올린 원본 파일 이름: " + multi.getOriginalFileName("file"));
		
		bb.setIp(request.getRemoteAddr()); // 전달되는 정보가 아니기 때문에 
		
		// BoardDAO 객체 생성 
		BoardDAO bdao = new BoardDAO();
		
		// 글쓰기 메서드 호출 - 파일 컬럼 생성했음.
		bdao.insertBoard(bb);
		
		// 목록페이지로 이동 
		response.sendRedirect("boardList.jsp");
		
		
		
		
		
	
	
	
	
	
	%>
	
	
	
	
	
	
	
	

</body>
</html>