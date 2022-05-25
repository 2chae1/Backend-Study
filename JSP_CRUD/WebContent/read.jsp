<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.nb"%>
<%@ page import="board.nbDAO"%>
<%@ page import="java.io.PrintWriter" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 하나 읽기 페이지</title>
</head>
<body>
	<nav>
		<a href="index.jsp">메인</a>
		<a href="noticeBoard.jsp">게시판</a>
	</nav>

	<%
		int BID = 0;
		if(request.getParameter("BID") != null) {
			BID = Integer.parseInt(request.getParameter("BID"));
		}
		if(BID == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않는 글입니다.')");
			script.println("location.href=read.jsp");
			script.println("history.back() </script>");		
		}
		nb _nb = new nbDAO().getOne(BID);
	%>
	
	<div>
		<table style="text-align: center; border: 1px solid">
			<thead>
				<tr><%= BID %></tr>
			</thead>
			<tbody>
				<tr>
					<th>제목</th>
					<td><%= _nb.getBTitle()%></td>
				</tr>
				<tr>
					<th>작성자</th>
					<td><%= _nb.getUserID()%></td>
				</tr>
				<tr>
					<th>내용</th>
					<td><%= _nb.getBContent()%></td>
				</tr>
			</tbody> 
		</table>
	</div>
	<div>
		<a href="noticeBoard.jsp">목록</a>
		<!-- <a href="update.jsp?BID=<%=BID%>">수정</a> 
		<a href="delete.jsp?BID=<%=BID%>">삭제</a> -->
	</div>
</body>
</html>