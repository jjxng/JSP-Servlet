<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>writeAction</title>
</head>
<body>
<%
// 현재 세션 상태 체크
String id = null;
if(session.getAttribute("id") != null) {
   id = (String)session.getAttribute("id");
}

String email = null;
if(session.getAttribute("email") != null) {
   email = (String)session.getAttribute("email");
}

if(id == null) {
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('로그인을 하세요.')");
   script.println("location.href='login.jsp'");
   script.println("</script>");   
} 
int num = 0;
if (request.getParameter("num") != null) {
   num = Integer.parseInt(request.getParameter("num"));
}
if (num == 0) {
   PrintWriter script = response.getWriter();
   script.println("<script>");
   script.println("alert('유효하지 않은 글입니다.')");
   script.println("location.href='bbs.jsp'");
   script.println("</script>");
}
Bbs bbs = new BbsDAO().getBbs(num);
if (!email.equals(bbs.getEmail())) {
    PrintWriter script = response.getWriter();
    script.println("<script>");
    script.println("alert('권한이 없습니다.')");
    script.println("location.href='bbs.jsp'");
    script.println("</script>");
} else {
	    BbsDAO bbsDAO = new BbsDAO();
	    int result = bbsDAO.delete(num);
	    if(result == -1) {
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('글 삭제에 실패했습니다.')");
	        script.println("history.back()");
	        script.println("</script>");
	    } else {
	        PrintWriter script = response.getWriter();
	        script.println("<script>");
	        script.println("alert('글 삭제 완료')");
	        script.println("location.href='bbs.jsp'");
	        script.println("</script>");
	   }
	}
%>
</body>
</html>