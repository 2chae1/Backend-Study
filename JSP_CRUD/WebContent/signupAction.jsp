<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.user" scope="page"/>
<jsp:setProperty name="user" property="userName"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		if(user.getUserName() == null || user.getUserID() == null || user.getUserPassword() == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('입력 다 해주세요')");
			script.println("history.back()");
			script.println("</script>");
		} else {
			userDAO userdao = new userDAO();
			int result = userdao.join(user.getUserName(), user.getUserID(), user.getUserPassword());
			
			if(result == -1) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('이미 아이디 존재')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("location.href='login.jsp'");
				script.println("</script>");
			}
		}
		
	%>
</body>
</html>