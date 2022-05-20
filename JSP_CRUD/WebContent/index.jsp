<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome Page</title>
</head>
<body>
	<% 
		String userID = null;
		if(session.getAttribute("userID")!=null) userID = (String) session.getAttribute("userID");
	%>
	<nav>
		<a href="index.jsp">메인</a>
		<a href="board.jsp">게시판</a>
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
		</div>
	<%
		}
	%>
	</nav>
</body>
</html>