<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인 페이지</title>
</head>
<body>
	<div>
		<form method="post" action="loginAction.jsp">
			<h3>로그인</h3>
			<input type="text" placeholder="아이디" name="userID" maxlength="20">
			<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
			<input type="submit" value="로그인">
		</form>
	</div>
</body>
</html>