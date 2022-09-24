<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>로그인</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/memLoginForm.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath }/css/memberCss/userUI.css">
</head>
<body>
	<div>
		<jsp:include page="../main/header.jsp"></jsp:include>
	</div>

    <div id="memLogin-wrap">
        <div id="memLogin-inner-contents">
            <div class="memLogin-container">
                <!-- 로그인 헤더 -->
                <div class="page-title-wrap">
                    <h2 class="text-head1">로그인</h2>
                </div><!-- page-title-wrap 로그인 헤더-->

                <div class="login-contents-inner-wrap">
                    <div class="tab-wrap">
                        <!-- 로그인 탭 -->
                        <ul class="tab-ul">
                            <li>
                                회원 로그인
                            </li>
                        </ul>
    
                        <!-- 로그인 FORM -->
                        <div class="tab-login-form">
                            <form action="${pageContext.request.contextPath }/member/login.do" id="loginForm" name="loginForm" method="post">
                                <div class="login-input login-input-id">
                                    <input type="text" id="mem_id" name="mem_id" placeholder="아이디를 입력해주세요." value="${cookie.id.value }">
                                </div>
                                <div class="login-input login-input-pwd">
                                    <input type="password" id="mem_pwd" name="mem_pwd" placeholder="비밀번호를 입력해주세요.">
                                </div>

                                <div class="loginCheck">
                                    <span class="ui-chk">
                                        <input id="chkSaveID" name="rememberId" type="checkbox" ${empty cookie.id.value ? "" : "checked"}>
                                        <label for="chkSaveID">아이디 저장</label>
                                    </span>
                                </div>

                                <div class="btn-wrap">
                                    <button class="btn-accept-black btn-login" id="loginFormBtn" type="button">
                                        로그인
                                    </button>
                                </div>
                            </form>
                        </div><!-- 로그인 FORM -->

                        <div class="login-util-wrap">
                            <a href="#" id="idSearch" class="btn-login-util">아이디 찾기 </a>
                            <a href="#" id="pwSearch" class="btn-login-util">비밀번호 찾기 </a>
                            <a href="#" id="joinBtn" class="btn-login-util">회원가입</a>
                        </div>

                        <div class="sns-login-btn-wrap">
                            <button type="button" class="btn-sns" data-id="10000">
                                <img width="223" src="${pageContext.request.contextPath }/img/memberImg/kakao/kakao_login_medium_narrow.png">
                            </button>
                        
                            <button type="button" class="btn-sns" data-id="10002">
                                <img width="223" id="naverLoginBtn" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png">   
                            </button>
                        </div>
                    </div><!-- tab-wrap -->
                </div><!-- login-contents-inner-wrap 로그인 wrap-->
            </div><!-- memLogin-container -->
        </div><!-- memLogin-inner-contents -->
    </div><!-- memLogin-wrap -->
    
    <div>
		<jsp:include page="../main/footer.jsp"></jsp:include>
	</div>
	
<script src="https://code.jquery.com/jquery-3.6.1.js"></script>
<script>
$(function() {
	$('#loginFormBtn').on('click', function() {
		var mem_id = $('#mem_id').val();
		var mem_pwd = $('#mem_pwd').val();
		
		if(mem_id == '') {
			alert("아이디를 입력해주세요.");
		} else if(mem_pwd == '') {
			alert("비밀번호를 입력해주세요.");
		} else {
			$('#loginForm').submit();
		}
	});
})
</script>
</body>
</html>