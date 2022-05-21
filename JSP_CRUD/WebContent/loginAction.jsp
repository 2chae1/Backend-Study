<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="user.userDAO" %>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="user" class="user.user" scope="page"/>
<jsp:setProperty name="user" property="userID"/>
<jsp:setProperty name="user" property="userPassword"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		userDAO userDAO = new userDAO();
		int result = userDAO.login(user.getUserID(),user.getUserPassword());
		
		if(result == 1) {
			
			session.setAttribute("userID",user.getUserID());
			
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("location.href='index.jsp'");
			script.println("</script>");
		} else if(result == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong password')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -1) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('wrong password')");
			script.println("history.back()");
			script.println("</script>");
		} else if(result == -2) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('db error')");
			script.println("history.back()");
			script.println("</script>");
		}
		
	%>
</body>
</html>