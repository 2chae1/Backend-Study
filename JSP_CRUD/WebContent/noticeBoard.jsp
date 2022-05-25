<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.nbDAO"%>
<%@ page import="board.nb"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 페이지</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID")!=null) userID = (String) session.getAttribute("userID");
	%>
	<nav>
		<a href="index.jsp">메인</a>
	<%
		if(userID==null) {
	%>
		<div>
			<button type="button" onclick="location.href='login.jsp';">로그인</button>
			<button type="button" onclick="location.href='signup.jsp';">회원가입</button>
		</div>
	<%
		} else {	
	%>
		<div>
			<button type="button" onclick="location.href='logout.jsp';">로그아웃</button>
			<button type="button" onclick="location.href='signup.jsp';">회원가입</button>
			<a href="write.jsp">글쓰기</a>
		</div>
	<%
		}
	%>
	</nav>
	
	<div>
		<table style="text-align: center; border: 1px solid">
			<thead>
				<tr>
					<th>번호</th>
					<th>제목</th>
					<th>내용</th>
					<th>작성자</th>
				</tr>
			</thead>
			<tbody>
				<%
					nbDAO nbdao = new nbDAO();
					ArrayList<nb> list = nbdao.getList();
					for (int i=0; i<list.size(); i++) {
				%>
				<tr>
					<td><%= list.get(i).getBID() %></td>
					<td><a href="read.jsp?BID=<%= list.get(i).getBID() %>"><%= list.get(i).getBTitle() %></a></td>
					<td><%= list.get(i).getBContent() %></td>
					<td><%= list.get(i).getUserID() %></td>
				<tr>
				<%
					}
				%>
			</tbody> 
		</table>
	</div>
</body>
</html>