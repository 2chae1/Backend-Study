<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
</head>
<body>
	<div>
		<form method="post" action="signupAction.jsp">
			<h3>회원가입</h3>
			<input type="text" placeholder="이름" name="userName" maxlength="20">
			<input type="text" placeholder="아이디" name="userID" maxlength="20">
			<input type="password" placeholder="비밀번호" name="userPassword" maxlength="20">
			<input type="submit" value="회원가입">
		</form>
	</div>
</body>
</html>