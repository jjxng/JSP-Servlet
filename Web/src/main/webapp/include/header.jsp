<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter" %>
<%@ page import="bbs.BbsDAO" %>
<%@ page import="bbs.Bbs" %>
<%@ page import="java.util.ArrayList" %>
<%
String id = null;
if(session.getAttribute("id") != null) {
	id = (String)session.getAttribute("id");
}
int pageNumber = 1;
if(request.getParameter("pageNumber") != null) {
	pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
}
%>
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">

<div class="container-fluid">
	<a class="navbar-brand active" href="main.jsp">
	JJXXNZ
	</a>
	
	<!-- 토글버튼 -->
	<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
		<span class="navbar-toggler-icon"></span>
	</button>
	
	<div class="collapse navbar-collapse" id="collapsibleNavbar">
		<ul class="navbar-nav me-auto">
			<li class="nav-item">
				<a class="nav-link" href="main.jsp">메인</a>
			</li>
			<li class="nav-item">
				<a class="nav-link" href="bbs.jsp">게시판</a>
			</li>
		</ul>
		<%
		// 로그인 하지 않았을 때 보이는 화면
		if(id == null) {
		%>
			
		<ul class="navbar-nav mr-auto">
			<li class="nav-item dropdown">
				<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">접속하기</a>
				<ul class="dropdown-menu">
					<li>
						<a class="dropdown-item active" href="login.jsp">
						로그인
						</a>
					</li>
					<li>
						<a class="dropdown-item" href="join.jsp">
						회원가입
						</a>
					</li>
				</ul>
			</li>
		</ul>
		<!-- 로그인이 되어 있는 상태에서 보여주는 화면 -->
		<%} else {%>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">회원관리</a>
					<ul class="dropdown-menu">
						<li>
							<a class="dropdown-item" href="logoutAction.jsp">
							로그아웃
							</a>
						</li>
					</ul>
				</li>
			</ul>
			
		<%} %>
	</div>
</div>

</nav>