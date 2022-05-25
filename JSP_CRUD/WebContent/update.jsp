
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="board.nb"%>
<%@ page import="board.nbDAO"%>
<%@ page import="java.io.PrintWriter" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정 페이지</title>
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
				script.println("alert('수정 권한이 없습니다')");
				script.println("history.back() </script>");
			} else {
		%>
		
	
		<div>
			<form method="post" action="updateAction.jsp?BID=<%=BID%>">
				<table style="text-align: center; border: 1px solid">
				<thead>
					<tr><%= BID %></tr>
				</thead>
				<tbody>
					<tr>
						<th>제목</th>
						<td><input type="text" placeholder="제목" name="BTitle" maxlength="20" value="<%= _nb.getBTitle()%>"></td>
					</tr>
					<tr>
						<th>내용</th>
						<td><input type="text" placeholder="내용" name="BContent" maxlength="50" value="<%= _nb.getBContent()%>"></td>
					</tr>
				</tbody> 
			</table>
			<div>
				<input type="submit" value="수정완료">
			</div>
			</form>
		</div>
		<%
			}
		%>
	</body>
</html>