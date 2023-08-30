<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
    <script src="https://developers.kakao.com/sdk/js/kakao.js"></script>
</head>
<body>
<body>
    <a href="javascript:kakaoLogin();"><img src="./kakao_login.png" alt="카카오계정 로그인" style="height: 100px;"/></a>

    <script>
        window.Kakao.init('883edbf67907a6820e7cd0ed3ac8139b');

        function kakaoLogin() {
            window.Kakao.Auth.login({
                scope: 'profile_nickname, profile_image, account_email', //동의항목 페이지에 있는 개인정보 보호 테이블의 활성화된 ID값을 넣습니다.
                success: function(response) {
                    console.log(response) // 로그인 성공하면 받아오는 데이터
                    window.Kakao.API.request({ // 사용자 정보 가져오기 
                        url: '/v2/user/me',
                        success: (res) => {
                            const kakao_account = res.kakao_account;
                            console.log(kakao_account)
                        }
                    });
                    window.location.href='/bbs/login.jsp' //리다이렉트 되는 코드
                },
                fail: function(error) {
                    console.log(error);
                }
            });
        }
    </script>
</body>
</body>
</html>