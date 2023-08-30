<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link rel="stylesheet" href="css/custom.css"/>
<script src = "https://developers.kakao.com/sdk/js/kakao.min.js"></script>
<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script>
<title>BBS</title>
</head>
<body class="bg-gradient-primary">
<nav class="navbar navbar-expand-sm bg-dark navbar-dark">
	<div class="container-fluid">
		<div class="navbar-header">
			<button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<a class="navbar-brand active" href="main.jsp">JJXXNZ</a>
		</div>
	<div class="collapse navbar-collapse" id="#collapsibleNavbar">
		<ul class="nav navbar-nav me-auto">
			<li class="nav-item"><a class="nav-link" href="main.jsp">메인</a></li>
			<li class="nav-item"><a class="nav-link" href="bbs.jsp">게시판</a></li>
		</ul>
			<ul class="navbar-nav mr-auto">
				<li class="nav-item dropdown">
					<a class="nav-link dropdown-toggle" href="#" role="button" data-bs-toggle="dropdown">접속하기</a>
					<ul class="dropdown-menu">
						<li><a class="dropdown-item active" href="login.jsp">로그인</a></li>
						<li><a class="dropdown-item" href="join.jsp">회원가입</a></li>
					</ul>
				</li>
			</ul>
		</div>
	</div>
</nav>
	<div class="container">
		<div class="row justyfy-content-center">
			<div class="col-xl-10 col-lg-12 col-md-9">
				<div class="card o-hidden border-0 shadow-lg my-5">
					<div class="card-body p-0">
						<div class="row">
							<div class="col-lg-6 d-none d-lg-block bg-login-image"></div>
							<div class="col-lg-6">
								<div class="p-5">
									<form method="post" action="loginAction.jsp">
										<div class="text-center">
											<h1 class="mb-4 text-gray-900 h4">Welcome!</h1>
										</div>
										<div class="form-group mt-3">
											<input 
											type="text" 
											class="form-control rounded-5" 
											placeholder="enter your id"
											name="id"
											maxlength="10"
											>
										</div>
		
										<div class="form-group mt-3">
											<input 
											type="password" 
											class="form-control rounded-5" 
											placeholder="enter your password"
											name="pass"
											maxlength="10"
											>
										</div>
										<input type="submit" class="btn btn-secondary form-control rounded-5" value="로그인"><br /><br />
										
<!-- 										<div class="button-login" align ="left" > -->
<!-- 										<a id="kakao-login-btn" href="kakaoLogin.jsp"> -->
<!-- 										<img src="//k.kakaocdn.net/14/dn/btqbjxsO6vP/KPiGpdnsubSq3a0PHEGUK1/o.jpg" alt="My Image" width="45%" height ="35px" /> -->
<!-- 									    </a> -->
<!-- 	            						</div> -->
	            						  <!-- 네이버 로그인 버튼 노출 영역 -->
										  <div id="naver_id_login"></div>
										  <!-- //네이버 로그인 버튼 노출 영역 -->
										  <script type="text/javascript">
										  	var naver_id_login = new naver_id_login("vsERwWHRQPUZGAbmDf9O", "http://localhost:8081/bbs/naverCallBack.jsp");
										  	var state = naver_id_login.getUniqState();
										  	naver_id_login.setButton("white", 2,60);
										  	naver_id_login.setDomain("http://localhost:8081/bbs/login.jsp");
										  	naver_id_login.setState(state);
										  	naver_id_login.setPopup();
										  	naver_id_login.init_naver_id_login();
										  </script>
<!-- 									    <div class="button-login" align ="right" > -->
<!-- 						                <a id="naver-login-btn" href="naverLogin.jsp"> -->
<!-- 									    <img src="img/slide/네이버.png" alt="My Image" width="45%" height ="35px" /> -->
<!-- 									    </a> -->
<!-- 	            						</div> -->
									</form>
									
									<div class="text-center">
										<a class="small" href="join.jsp">
										회원가입하기
										</a>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>	

<%@ include file="include/footer.jsp" %>
</body>
</html>