<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.nb"%>
<%@ page import="board.nbDAO"%>
<%@ page import="java.io.PrintWriter" %>
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
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('please login')");
				script.println("history.back()");
				script.println("</script>");
			}
		
		
			int BID = 0;
			if(request.getParameter("BID") != null) {
				BID = Integer.parseInt(request.getParameter("BID"));
			}
			else {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('unvalid writing')");
				script.println("history.back() </script>");		
			}
			
			nb _nb = new nbDAO().getOne(BID);
			
			if(userID !=null && BID!=0 && !userID.equals(_nb.getUserID()) ) {
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('삭제 권한이 없습니다')");
				script.println("history.back() </script>");
			} else {
				
				nbDAO nbdao = new nbDAO();
				
				int result = nbdao.delete(BID);
				
				if(result == -1) {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("alert('삭제 실패')");
					script.println("history.back()");
					script.println("</script>");
				} else {
					PrintWriter script = response.getWriter();
					script.println("<script>");
					script.println("location.href='noticeBoard.jsp'");
					script.println("</script>");
				}
			}
		%>
</body>
</html>