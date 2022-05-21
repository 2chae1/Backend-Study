<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Notice Board</title>
</head>
<body>
	<h1>로그아웃</h1>
	<%
		session.invalidate(); // 설정된 세션 값이 다 사라진다
	%>
	<script>
		location.href = 'index.jsp';
	</script>ㅣ
</body>
</html>