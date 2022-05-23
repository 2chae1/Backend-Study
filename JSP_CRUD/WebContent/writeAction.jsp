<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.nbDAO"%>
<%@ page import="java.io.PrintWriter" %>

<% request.setCharacterEncoding("UTF-8"); %>

<jsp:useBean id="nb" class="board.nb" scope="page"/>
<jsp:setProperty name="nb" property="BTitle"/>
<jsp:setProperty name="nb" property="BContent"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<%
		String userID = null;
	
		if(session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		if(userID == null) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('로그인을 하세요')");
			script.println("location.href='login.jsp'");
			script.println("</script>");
		} else {
			if(nb.getBTitle() == null || userID == null || nb.getBContent() == null) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('입력 다 해주세요')");
				script.println("history.back()");
				script.println("</script>");
			} else {
				nbDAO nbdao = new nbDAO();
				int result = nbdao.write(nb.getBTitle(),userID,nb.getBContent());
				
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('글쓰기 실패')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='noticeBoard.jsp'");
					script.println("</script>");
				}
			}
		}
	%>
</body>
</html>