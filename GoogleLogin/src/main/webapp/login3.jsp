<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
	<script src="http://code.jquery.com/jquery.js"></script>
	
	<meta name="google-signin-client_id"
	content="695889794747-qcjscoecvg6h6loc00bvk796bqon6o2u.apps.googleusercontent.com">
	<script>
	function onSignIn(googleUser) {
		var profile = googleUser.getBasicProfile();
		$('#my-signin2').css('display', 'none');
		$('#logout').css('display', 'block');
		$('#upic').attr('src', profile.getImagerUrl());
		$('#uname').html('[ '+ profile.getName() + ' ]');
	}
	function onFailure(error) {
	}
	function signOut() {
		var auth2 = gapi.auth2.getAuthInstance();
		auth2.signOut().then(function () {
			$('#my-signin2').css('display', 'block');
			$('#logout').css('display', 'none');
			$('#upic').attr('src', '');
			$('#uname').html('');
		});
	}
	function renderButton() {
		gapi.signin2.render('my-signin2', {
			'scope' : 'profile email',
			'width' : 240,
			'height' : 50,
			'longtitle' : true,
			'theme' : 'dark',
			'onsuccess' : onSignIn,
			'onfailure' : onFailure
		});
	}
	$(document).ready(function() {
		
	});
	</script>
</head>
<body>
	<div id="my-signin2"></div>
	
	<div id="logout" style="display: none;">
	<input type="button" onclick="signOut();" value="로그아웃" /><br>
	
	<img id="upic" src=""><br>
	<span id="uname"></span>
	</div>
	
	<script src="https://apis.google.com/js/platform.js?onload=renderButton" async defer>
	</script>
</body>
</html>